using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class pages_VideoGallery : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BindVideoLinks();
    }

    private void BindVideoLinks()
    {
        string connStr = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            string query = "SELECT LinkText, LinkURL FROM Links WHERE Type = 'Video'";
            SqlDataAdapter da = new SqlDataAdapter(query, conn);
            DataTable dt = new DataTable();
            da.Fill(dt);

            linksRepeater.DataSource = dt;
            linksRepeater.DataBind();
        }
    }
}