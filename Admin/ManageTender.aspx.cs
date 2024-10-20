﻿using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Web.UI.WebControls;

public partial class Admin_pages_EditDeleteTender : System.Web.UI.Page
{
    private int PageSize
    {
        get
        {
            return int.Parse(ddlRecordsPerPage.SelectedValue);
        }
    }

    private int PageIndex
    {
        get
        {
            return ViewState["PageIndex"] != null ? (int)ViewState["PageIndex"] : 0;
        }
        set
        {
            ViewState["PageIndex"] = value;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            PageIndex = 0;
            BindGridView();
        }
    }

    private void BindGridView()
    {
        string connStr = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            string query = @"
            WITH Tender_CTE AS (
                SELECT 
                    DocsID,
                    No, 
                    Title, 
                    Date, 
                    FilePath,
                    ROW_NUMBER() OVER (ORDER BY Date) AS RowNum
                FROM 
                    Docs
                WHERE
                    Type = 'Tender'
                    AND (@SearchNo IS NULL OR No LIKE '%' + @SearchNo + '%')
                    AND (@SearchTitle IS NULL OR Title LIKE '%' + @SearchTitle + '%')
            )
            SELECT * FROM Tender_CTE
            WHERE RowNum BETWEEN @StartRow AND @EndRow";

            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                string searchNo = rdNo.Checked ? txtSearch.Text : string.Empty;
                string searchTitle = rdTitle.Checked ? txtSearch.Text : string.Empty;

                cmd.Parameters.AddWithValue("@SearchNo", string.IsNullOrEmpty(searchNo) ? (object)DBNull.Value : searchNo);
                cmd.Parameters.AddWithValue("@SearchTitle", string.IsNullOrEmpty(searchTitle) ? (object)DBNull.Value : searchTitle);

                int startRow = PageIndex * PageSize + 1;
                int endRow = startRow + PageSize - 1;

                cmd.Parameters.AddWithValue("@StartRow", startRow);
                cmd.Parameters.AddWithValue("@EndRow", endRow);

                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
            }
        }
    }


    protected void btnSearch_Click(object sender, EventArgs e)
    {
        PageIndex = 0;
        BindGridView();
    }


    protected void ddlRecordsPerPage_SelectedIndexChanged(object sender, EventArgs e)
    {
        PageIndex = 0;
        BindGridView();
    }

    protected void btnPrevious_Click(object sender, EventArgs e)
    {
        if (PageIndex > 0)
        {
            PageIndex--;
            BindGridView();
        }
    }

    protected void btnNext_Click(object sender, EventArgs e)
    {
        PageIndex++;
        BindGridView();
    }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        BindGridView();
    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow row = GridView1.Rows[e.RowIndex];
        int TenderID = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
        string no = (row.FindControl("txtNo") as TextBox).Text;
        string title = (row.FindControl("txtTitle") as TextBox).Text;
        string TenderDateText = (row.FindControl("txtTenderDate") as TextBox).Text;
        DateTime TenderDate;

        if (!DateTime.TryParseExact(TenderDateText, "dd-MM-yyyy", null, System.Globalization.DateTimeStyles.None, out TenderDate))
        {
            lblMessage.Text = "Invalid date format.";
            lblMessage.ForeColor = System.Drawing.Color.Red;
            return;
        }

        FileUpload fileUpload = (FileUpload)row.FindControl("fileUpload");
        HiddenField hiddenFilePath = (HiddenField)row.FindControl("hiddenFilePath");
        string oldFilePath = hiddenFilePath.Value;
        string newFilePath = oldFilePath;

        if (fileUpload.HasFile)
        {
            string fileExtension = Path.GetExtension(fileUpload.FileName).ToLower();
            if (fileExtension == ".pdf")
            {
                try
                {
                    string fileName = Path.GetFileName(fileUpload.FileName);
                    string uploadFolder = Server.MapPath("~/docs/tender/");
                    if (!Directory.Exists(uploadFolder))
                    {
                        Directory.CreateDirectory(uploadFolder);
                    }
                    newFilePath = Path.Combine(uploadFolder, fileName);
                    fileUpload.SaveAs(newFilePath);

                    // Delete the old file
                    if (File.Exists(Server.MapPath("~/" + oldFilePath)))
                    {
                        File.Delete(Server.MapPath("~/" + oldFilePath));
                    }

                    // Store the relative path to the database
                    newFilePath = "docs/tender/" + fileName;
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error: " + ex.Message;
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    return;
                }
            }
            else
            {
                lblMessage.Text = "Only PDF files are allowed.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }
        }

        string connStr = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            string query = "UPDATE Docs SET No=@No, Title=@Title, Date=@TenderDate, FilePath=@FilePath WHERE DocsID=@TenderID";
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@No", no);
                cmd.Parameters.AddWithValue("@Title", title);
                cmd.Parameters.AddWithValue("@TenderDate", TenderDate);
                cmd.Parameters.AddWithValue("@FilePath", newFilePath);
                cmd.Parameters.AddWithValue("@TenderID", TenderID);

                conn.Open();
                cmd.ExecuteNonQuery();
                GridView1.EditIndex = -1;
                BindGridView();
            }
        }
    }

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        BindGridView();
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int TenderID = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);

        string connStr = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            // Retrieve the file path to delete the file
            string query = "SELECT FilePath FROM Docs WHERE DocsID=@TenderID";
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@TenderID", TenderID);
                conn.Open();
                string filePath = cmd.ExecuteScalar() as string;
                if (filePath != null && File.Exists(Server.MapPath("~/" + filePath)))
                {
                    File.Delete(Server.MapPath("~/" + filePath));
                }
            }

            // Delete the record from the database
            query = "DELETE FROM Docs WHERE DocsID=@TenderID";
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@TenderID", TenderID);
                cmd.ExecuteNonQuery();
                BindGridView();
            }
        }
    }
}
