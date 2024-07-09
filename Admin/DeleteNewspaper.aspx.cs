using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_pages_DeleteNewspaper : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGridView();
        }
    }

    private void BindGridView(string searchQuery = "")
    {
        string connStr = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            string query = "SELECT NID, NDesc, '../' + ImagePath AS ImagePath FROM Newspaper";
            if (!string.IsNullOrEmpty(searchQuery))
            {
                query += " WHERE NDesc LIKE @SearchQuery";
            }

            using (SqlDataAdapter da = new SqlDataAdapter(query, conn))
            {
                if (!string.IsNullOrEmpty(searchQuery))
                {
                    da.SelectCommand.Parameters.AddWithValue("@SearchQuery", "%" + searchQuery + "%");
                }

                DataTable dt = new DataTable();
                da.Fill(dt);
                gvNewspapers.DataSource = dt;
                gvNewspapers.DataBind();
            }
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        BindGridView(txtSearch.Text.Trim());
    }

    protected void gvNewspapers_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvNewspapers.PageIndex = e.NewPageIndex;
        BindGridView(txtSearch.Text.Trim());
    }

    protected void gvNewspapers_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int id = Convert.ToInt32(gvNewspapers.DataKeys[e.RowIndex].Value);
        string imagePath = "";

        string connStr = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            string query = "SELECT ImagePath FROM Newspaper WHERE NID = @ID";
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@ID", id);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    imagePath = reader["ImagePath"].ToString();
                }
                reader.Close();
            }

            query = "DELETE FROM Newspaper WHERE NID = @ID";
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@ID", id);
                cmd.ExecuteNonQuery();
            }
        }

        if (!string.IsNullOrEmpty(imagePath))
        {
            string fullPath = Server.MapPath("~/" + imagePath);
            if (File.Exists(fullPath))
            {
                File.Delete(fullPath);
            }
        }

        lblMessage.Text = "Newspaper image deleted successfully!";
        BindGridView(txtSearch.Text.Trim());
    }
}
