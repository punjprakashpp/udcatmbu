using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

public partial class pages_Event : System.Web.UI.Page
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
            string query = "SELECT DocsID, Title, Date, FilePath FROM Docs WHERE Type = 'Event' ORDER BY Date DESC";
            if (!string.IsNullOrEmpty(searchQuery))
            {
                query = "SELECT DocsID, Title, Date, FilePath FROM Docs WHERE Type = 'Event' AND Title LIKE @SearchQuery ORDER BY Date DESC";
            }
            using (SqlDataAdapter sda = new SqlDataAdapter(query, conn))
            {
                if (!string.IsNullOrEmpty(searchQuery))
                {
                    sda.SelectCommand.Parameters.AddWithValue("@SearchQuery", "%" + searchQuery + "%");
                }

                DataTable dt = new DataTable();
                sda.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        BindGridView(txtSearch.Text.Trim());
    }

    protected void AffReg_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        BindGridView(txtSearch.Text.Trim());
    }
}

