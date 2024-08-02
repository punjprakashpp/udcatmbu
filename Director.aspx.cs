using System;
using System.Configuration;
using System.Data.SqlClient;

public partial class About_Director : System.Web.UI.Page
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
        string query = "SELECT Name, Phone, Email, ImagePath FROM Person WHERE Type = 'Director'";

        using (SqlConnection con = new SqlConnection(connectionString))
        {
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.Read())
                {
                    string name = rdr["Name"].ToString();
                    string phone = rdr["Phone"].ToString();
                    string email = rdr["Email"].ToString();
                    string imagePath = rdr["ImagePath"].ToString();

                    lblName.Text = name;
                    lblPhone.Text = phone;
                    lblEmail.Text = email;
                    emailLink.NavigateUrl = "mailto:" + email;
                    imgPerson.ImageUrl = "~/" + imagePath;
                }
                else
                {
                    lblName.Text = "No person found.";
                    lblPhone.Text = "";
                    lblEmail.Text = "";
                    emailLink.NavigateUrl = "#";
                    imgPerson.ImageUrl = "";
                }
                con.Close();
            }
        }
    }
}
