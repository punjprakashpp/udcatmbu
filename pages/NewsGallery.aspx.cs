using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_VideoGallery : System.Web.UI.Page
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
            string query = "SELECT NDesc, ImagePath FROM Newspaper";
            SqlDataAdapter da = new SqlDataAdapter(query, conn);
            DataTable dt = new DataTable();
            da.Fill(dt);

            NewsRepeater.DataSource = dt;
            NewsRepeater.DataBind();
        }
    }
}