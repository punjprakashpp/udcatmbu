using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Web.UI.WebControls;

public partial class Admin_pages_EditDeleteAlumni : System.Web.UI.Page
{
    private int PageSize
    {
        get { return int.Parse(ddlRecordsPerPage.SelectedValue); }
    }

    private int CurrentPage
    {
        get { return ViewState["CurrentPage"] != null ? (int)ViewState["CurrentPage"] : 0; }
        set { ViewState["CurrentPage"] = value; }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGridView();
        }
    }

    private void BindGridView()
    {
        string connStr = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            string query = "SELECT * FROM " +
                           "(SELECT ROW_NUMBER() OVER (ORDER BY Name) AS RowNum, AchiverID, Name, Session, RegistrationNo, RegistrationYear, RollNo " +
                           "FROM Achivers";
            string whereClause = "";
            if (!string.IsNullOrEmpty(txtName.Text))
            {
                whereClause += string.IsNullOrEmpty(whereClause) ? " WHERE" : " AND";
                whereClause += " RollNo = @RollNo";
            }

            query += whereClause + ") AS RowConstrainedResult WHERE RowNum >= @StartRow AND RowNum < @EndRow ORDER BY RowNum";

            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                if (!string.IsNullOrEmpty(txtName.Text))
                {
                    cmd.Parameters.AddWithValue("@RollNo", txtName.Text);
                }

                int startRow = CurrentPage * PageSize + 1;
                int endRow = startRow + PageSize;

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
        CurrentPage = 0;
        BindGridView();
    }

    protected void ddlSession_SelectedIndexChanged(object sender, EventArgs e)
    {
        CurrentPage = 0;
        BindGridView();
    }

    protected void ddlRecordsPerPage_SelectedIndexChanged(object sender, EventArgs e)
    {
        CurrentPage = 0;
        BindGridView();
    }

    protected void btnPrevious_Click(object sender, EventArgs e)
    {
        if (CurrentPage > 0)
        {
            CurrentPage--;
            BindGridView();
        }
    }

    protected void btnNext_Click(object sender, EventArgs e)
    {
        CurrentPage++;
        BindGridView();
    }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        BindGridView();
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int alumniID = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);

        string connStr = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            // Retrieve the file path to delete the file
            string query = "SELECT ImagePath FROM Achivers WHERE AchiverID=@AchiverID";
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@AchiverID", alumniID);
                conn.Open();
                string filePath = cmd.ExecuteScalar() as string;
                if (filePath != null && File.Exists(Server.MapPath(filePath)))
                {
                    File.Delete(Server.MapPath(filePath));
                }
            }

            // Delete the record from the database
            query = "DELETE FROM Achivers WHERE AchiverID=@AchiverID";
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@AchiverID", alumniID);
                cmd.ExecuteNonQuery();
                BindGridView();
                lblMessage.Text = "Record deleted successfully.";
            }
        }
    }
}
