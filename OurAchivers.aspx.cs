using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

public partial class OurAchivers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadAchiversDetails();
        }
    }

    private void LoadAchiversDetails()
    {
        string connStr = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            string query = "SELECT Name, RollNo, Session, Achivement, Qualification, Occupation, Company, Phone, Email, ImagePath, LinkedIn, Facebook, Instagram, Twitter FROM Achivers ";
            SqlCommand cmd = new SqlCommand(query, conn);

            conn.Open();
            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                DataTable dt = new DataTable();
                dt.Load(reader);
                AchiverRepeater.DataSource = dt;
                AchiverRepeater.DataBind();
            }
        }
    }
}