using System;
using System.Data.SqlClient;
using System.Web.Security;
using System.Security.Cryptography;
using System.Text;
using System.Configuration;
using System.Web.UI;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            string userName = txtUserName.Text;
            string password = txtPassword.Text;

            if (AuthenticateUser(userName, password))
            {
                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Text = "Login successful!";
                FormsAuthentication.SetAuthCookie(userName, false);  // Set the authentication cookie
                Response.Redirect("~/Admin/Default.aspx");
            }
            else
            {
                lblMessage.Text = "Invalid username or password.";
            }
        }
    }

    private bool AuthenticateUser(string userName, string password)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;

        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            string sql = "SELECT PasswordHash, PasswordSalt FROM Admin WHERE UserName = @UserName";
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@UserName", userName);

            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                string storedHash = reader["PasswordHash"].ToString();
                string storedSalt = reader["PasswordSalt"].ToString();
                string passwordHash = GenerateHash(password, storedSalt);

                return storedHash == passwordHash;
            }
            else
            {
                return false;
            }
        }
    }

    private string GenerateHash(string input, string salt)
    {
        byte[] inputBytes = Encoding.UTF8.GetBytes(input + salt);
        using (SHA256 sha256 = SHA256.Create())
        {
            byte[] hashBytes = sha256.ComputeHash(inputBytes);
            return Convert.ToBase64String(hashBytes);
        }
    }
}
