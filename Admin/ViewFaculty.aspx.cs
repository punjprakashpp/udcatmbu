using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;

public partial class Admin_pages_ViewFaculty : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadFacultyDetails();
        }
    }

    private void LoadFacultyDetails()
    {
        string connStr = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            string query = "SELECT Name, Qualification, Position, Phone, Email, ImagePath FROM Faculty";
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                conn.Open();
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    DataTable dt = new DataTable();
                    dt.Load(reader);

                    facultyRepeater.DataSource = dt;
                    facultyRepeater.DataBind();
                }
            }
        }
    }
}
