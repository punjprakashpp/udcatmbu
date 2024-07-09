using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_Vice_Chancellor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadPerson();
        }
    }

    private void LoadPerson()
    {
        string connectionString = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;
        string query = "SELECT * FROM Person WHERE Type = 'Vice-Chancellor'";

        using (SqlConnection con = new SqlConnection(connectionString))
        {
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.Read())
                {
                    string name = rdr["Name"].ToString();
                    string imagePath = rdr["ImagePath"].ToString();

                    lblName.Text = name;
                    imgPerson.ImageUrl = "../" + imagePath;
                }
                else
                {
                    lblName.Text = "No person found.";
                    imgPerson.ImageUrl = "";
                }
                con.Close();
            }
        }
    }
}