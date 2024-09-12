using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI.WebControls;
using System.Configuration;

public partial class Admin_pages_EditDeleteFiles : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadFiles();
        }
    }

    private void LoadFiles(string searchQuery = "")
    {
        string connectionString = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            string query = "SELECT FilesID, FileName, FileType, Semester, Session FROM Files";
            if (!string.IsNullOrEmpty(searchQuery))
            {
                query += " WHERE FileName LIKE @SearchQuery";
            }

            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                if (!string.IsNullOrEmpty(searchQuery))
                {
                    cmd.Parameters.AddWithValue("@SearchQuery", "%" + searchQuery + "%");
                }

                conn.Open();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GridViewFiles.DataSource = dt;
                GridViewFiles.DataBind();
                conn.Close();
            }
        }
    }

    protected void GridViewFiles_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int id = Convert.ToInt32(e.CommandArgument);
        if (e.CommandName == "DeleteFile")
        {
            DeleteFile(id);
        }
    }

    private void DeleteFile(int id)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            string query = "SELECT FilePath FROM Files WHERE FilesID = @FilesID";
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@FilesID", id);

                conn.Open();
                string filePath = cmd.ExecuteScalar().ToString();
                conn.Close();

                if (File.Exists(Server.MapPath("~/" + filePath)))
                {
                    File.Delete(Server.MapPath("~/" + filePath));
                }

                query = "DELETE FROM Files WHERE FilesID = @FilesID";
                using (SqlCommand cmdDelete = new SqlCommand(query, conn))
                {
                    cmdDelete.Parameters.AddWithValue("@FilesID", id);
                    conn.Open();
                    cmdDelete.ExecuteNonQuery();
                    conn.Close();

                    lblMessage.Text = "File deleted successfully!";
                    LoadFiles();
                }
            }
        }
    }

    protected void GridViewFiles_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridViewFiles.PageIndex = e.NewPageIndex;
        LoadFiles(txtSearch.Text.Trim());
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        LoadFiles(txtSearch.Text.Trim());
    }
}
