using System;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PagesMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Display the visitor count
            lblVisitorCount.Text = GetVisitorCount().ToString();
            lblyear.Text = DateTime.Now.Year.ToString();
        } 
    }

    private int GetVisitorCount()
    {
        int count = 0;
        string connectionString = WebConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();
            SqlCommand command = new SqlCommand("SELECT Count FROM Visit WHERE ID = 1", connection);
            SqlDataReader reader = command.ExecuteReader();

            if (reader.Read())
            {
                count = reader.GetInt32(0);
            }
        }

        return count;
    }
}
