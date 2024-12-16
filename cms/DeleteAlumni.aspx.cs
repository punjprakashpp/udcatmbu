using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class Admin_pages_DeleteAlumni : System.Web.UI.Page
{
    private string ConnectionString = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadAlumniData();
        }
    }

    private void LoadAlumniData()
    {
        string query = "SELECT AlumniID, Session, FirstName, MidName, LastName, '../' + FilePath AS FilePath FROM Alumni";
        using (SqlConnection conn = new SqlConnection(ConnectionString))
        {
            SqlDataAdapter da = new SqlDataAdapter(query, conn);
            DataTable dt = new DataTable();
            da.Fill(dt);

            gvAlumni.DataSource = dt;
            gvAlumni.DataBind();
        }
    }

    protected void gvAlumni_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            int alumniID = Convert.ToInt32(e.CommandArgument);
            DeleteAlumniRecord(alumniID);
            LoadAlumniData(); // Refresh the grid after deletion
        }
    }

    private void DeleteAlumniRecord(int alumniID)
    {
        string query = "DELETE FROM Alumni WHERE AlumniID = @AlumniID";
        using (SqlConnection conn = new SqlConnection(ConnectionString))
        {
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@AlumniID", alumniID);
            conn.Open();
            cmd.ExecuteNonQuery();
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string searchQuery = txtName.Text.Trim();
        string query = "SELECT AlumniID, FirstName, LastName, Phone, Email, Qualification, Occupation, Company FROM Alumni WHERE FirstName LIKE @SearchQuery OR LastName LIKE @SearchQuery";
        using (SqlConnection conn = new SqlConnection(ConnectionString))
        {
            SqlDataAdapter da = new SqlDataAdapter(query, conn);
            da.SelectCommand.Parameters.AddWithValue("@SearchQuery", "%" + searchQuery + "%");
            DataTable dt = new DataTable();
            da.Fill(dt);

            gvAlumni.DataSource = dt;
            gvAlumni.DataBind();
        }
    }

    protected void gvAlumni_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvAlumni.PageIndex = e.NewPageIndex;
        LoadAlumniData();
    }

    protected void ddlRecordsPerPage_SelectedIndexChanged(object sender, EventArgs e)
    {
        int recordsPerPage = int.Parse(ddlRecordsPerPage.SelectedValue);
        gvAlumni.PageSize = recordsPerPage;
        LoadAlumniData();
    }

    protected void btnPrevious_Click(object sender, EventArgs e)
    {
        if (gvAlumni.PageIndex > 0)
        {
            gvAlumni.PageIndex--;
            LoadAlumniData();
        }
    }

    protected void btnNext_Click(object sender, EventArgs e)
    {
        if (gvAlumni.PageIndex < gvAlumni.PageCount - 1)
        {
            gvAlumni.PageIndex++;
            LoadAlumniData();
        }
    }
}
