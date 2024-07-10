using System;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class Library_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lbl.Text = "";
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

    protected void btnAbout_Click(object sender, EventArgs e)
    {
        Response.Redirect("About.aspx");
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["LibraryConnectionString"].ConnectionString;

        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            conn.Open();

            if (rdolibrary.Checked == true)
            {
                string query = "SELECT AID, Name FROM Admin WHERE UserName = @UserName AND Password = @Password";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@UserName", txtuname.Text);
                    cmd.Parameters.AddWithValue("@Password", txtupass.Text);

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            Session["aid"] = reader["AID"].ToString();
                            Session["email"] = txtuname.Text;
                            Session["name"] = reader["Name"].ToString();
                            Response.Redirect("Librarian/Default.aspx");
                        }
                        else
                        {
                            lbl.Text = "Invalid Credential";
                        }
                    }
                }
            }
            else
            {
                string query = "SELECT SID FROM Student WHERE Email = @Email AND Password = @Password";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Email", txtuname.Text);
                    cmd.Parameters.AddWithValue("@Password", txtupass.Text);

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            Session["sid"] = reader["SID"].ToString();
                            Session["email"] = txtuname.Text;
                            Response.Redirect("Student/Default.aspx");
                        }
                        else
                        {
                            lbl.Text = "Invalid Credential";
                        }
                    }
                }
            }
        }
    }
}