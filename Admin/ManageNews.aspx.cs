using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_pages_EditDeleteNews : System.Web.UI.Page
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
                WITH News_CTE AS (
                    SELECT 
                        NewsID, 
                        Title, 
                        NewsDate, 
                        FilePath,
                        ROW_NUMBER() OVER (ORDER BY NewsDate) AS RowNum
                    FROM 
                        News
                    WHERE
                        (@NewsDate IS NULL OR CONVERT(VARCHAR, NewsDate, 105) = @NewsDate)
                )
                SELECT * FROM News_CTE
                WHERE RowNum BETWEEN @StartRow AND @EndRow";

            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                if (!string.IsNullOrEmpty(txtSearchDate.Text))
                {
                    cmd.Parameters.AddWithValue("@NewsDate", txtSearchDate.Text);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@NewsDate", DBNull.Value);
                }

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
        int newsID = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
        string title = (row.Cells[1].Controls[0] as TextBox).Text;
        string newsDateText = (row.FindControl("txtNewsDate") as TextBox).Text;
        DateTime newsDate;

        if (!DateTime.TryParseExact(newsDateText, "dd-MM-yyyy", null, System.Globalization.DateTimeStyles.None, out newsDate))
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
                    string uploadFolder = Server.MapPath("../doc/news/");
                    if (!Directory.Exists(uploadFolder))
                    {
                        Directory.CreateDirectory(uploadFolder);
                    }
                    newFilePath = Path.Combine(uploadFolder, fileName);
                    fileUpload.SaveAs(newFilePath);

                    // Delete the old file
                    if (File.Exists(Server.MapPath(oldFilePath)))
                    {
                        File.Delete(Server.MapPath(oldFilePath));
                    }

                    // Store the relative path to the database
                    newFilePath = "doc/news/" + fileName;
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
            string query = "UPDATE News SET Title=@Title, NewsDate=@NewsDate, FilePath=@FilePath WHERE NewsID=@NewsID";
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@Title", title);
                cmd.Parameters.AddWithValue("@NewsDate", newsDate);
                cmd.Parameters.AddWithValue("@FilePath", newFilePath);
                cmd.Parameters.AddWithValue("@NewsID", newsID);

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
        int newsID = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);

        string connStr = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            // Retrieve the file path to delete the file
            string query = "SELECT FilePath FROM News WHERE NewsID=@NewsID";
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@NewsID", newsID);
                conn.Open();
                string filePath = cmd.ExecuteScalar() as string;
                if (filePath != null && File.Exists(Server.MapPath(filePath)))
                {
                    File.Delete(Server.MapPath(filePath));
                }
            }

            // Delete the record from the database
            query = "DELETE FROM News WHERE NewsID=@NewsID";
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@NewsID", newsID);
                cmd.ExecuteNonQuery();
                BindGridView();
            }
        }
    }
}
