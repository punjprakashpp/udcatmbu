using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class NewsGallery : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BindNewspaper();
    }

    private void BindNewspaper()
    {
        string connStr = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            string query = "SELECT Title, ImagePath FROM Image WHERE Type = 'News'";
            SqlDataAdapter da = new SqlDataAdapter(query, conn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            NewsRepeater.DataSource = dt;
            NewsRepeater.DataBind();
        }
    }
}