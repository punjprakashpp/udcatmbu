using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class Admin_pages_DeleteAchiver : System.Web.UI.Page
{
    private string ConnectionString = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadAchieverData();
        }
    }

    private void LoadAchieverData()
    {
        string query = "SELECT AchiverID, Session, FirstName, MidName, LastName, '../' + ImagePath AS ImagePath FROM Achiver";
        using (SqlConnection conn = new SqlConnection(ConnectionString))
        {
            SqlDataAdapter da = new SqlDataAdapter(query, conn);
            DataTable dt = new DataTable();
            da.Fill(dt);

            gvAchievers.DataSource = dt;
            gvAchievers.DataBind();
        }
    }

    protected void gvAchievers_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            int achieverID = Convert.ToInt32(e.CommandArgument);
            DeleteAchieverRecord(achieverID);
            LoadAchieverData(); // Refresh the grid after deletion
        }
    }

    private void DeleteAchieverRecord(int achieverID)
    {
        string query = "DELETE FROM Achiver WHERE AchiverID = @AchiverID";
        using (SqlConnection conn = new SqlConnection(ConnectionString))
        {
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@AchiverID", achieverID);
            conn.Open();
            cmd.ExecuteNonQuery();
        }
    }

    protected void btnSearchAchiever_Click(object sender, EventArgs e)
    {
        string searchQuery = txtSearchAchiever.Text.Trim();
        string query = "SELECT AchiverID, FirstName, LastName, Achivement, Qualification, Phone, Email, Occupation, Company FROM Achiver WHERE FirstName LIKE @SearchQuery OR LastName LIKE @SearchQuery";
        using (SqlConnection conn = new SqlConnection(ConnectionString))
        {
            SqlDataAdapter da = new SqlDataAdapter(query, conn);
            da.SelectCommand.Parameters.AddWithValue("@SearchQuery", "%" + searchQuery + "%");
            DataTable dt = new DataTable();
            da.Fill(dt);

            gvAchievers.DataSource = dt;
            gvAchievers.DataBind();
        }
    }

    protected void gvAchievers_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvAchievers.PageIndex = e.NewPageIndex;
        LoadAchieverData();
    }

    protected void ddlAchieversPerPage_SelectedIndexChanged(object sender, EventArgs e)
    {
        int recordsPerPage = int.Parse(ddlAchieversPerPage.SelectedValue);
        gvAchievers.PageSize = recordsPerPage;
        LoadAchieverData();
    }

    protected void btnPreviousAchiever_Click(object sender, EventArgs e)
    {
        if (gvAchievers.PageIndex > 0)
        {
            gvAchievers.PageIndex--;
            LoadAchieverData();
        }
    }

    protected void btnNextAchiever_Click(object sender, EventArgs e)
    {
        if (gvAchievers.PageIndex < gvAchievers.PageCount - 1)
        {
            gvAchievers.PageIndex++;
            LoadAchieverData();
        }
    }
}
