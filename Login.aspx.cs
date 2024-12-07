using System;
using System.IO;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Drawing;
using System.Web.Security;
using System.Configuration;
using System.Data.SqlClient;
using System.Security.Cryptography;

public partial class Login : System.Web.UI.Page
{
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            string userName = txtUserName.Text.Trim();
            string password = txtPassword.Text;

            try
            {
                string role;
                if (AuthenticateUser(userName, password, out role))
                {
                    lblMessage.Text = "Login successful!";
                    lblMessage.ForeColor = Color.Green;

                    // Create the authentication ticket with the role
                    FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(
                        1,                      // Ticket version
                        userName,               // Username
                        DateTime.Now,           // Issue date
                        DateTime.Now.AddMinutes(30), // Expiration date (default)
                        chkboxRem.Checked,      // Persistent (true if checked)
                        role                    // User role (stored as user data)
                    );

                    // Encrypt the ticket
                    string encryptedTicket = FormsAuthentication.Encrypt(ticket);
                    HttpCookie authCookie = new HttpCookie(FormsAuthentication.FormsCookieName, encryptedTicket);

                    // Set the cookie expiration based on whether "Remember Me" is checked
                    if (chkboxRem.Checked)
                    {
                        authCookie.Expires = DateTime.Now.AddDays(30); // Cookie expires in 30 days
                    }

                    Response.Cookies.Add(authCookie);

                    // Redirect to the dashboard
                    Response.Redirect("~/cms/Default.aspx");
                }
                else
                {
                    lblMessage.Text = "Invalid username or password.";
                    lblMessage.ForeColor = Color.Red;
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "An error occurred during login. Please try again later.";
                lblMessage.ForeColor = Color.Red;
                LogError(ex);  // Log the error for troubleshooting
            }
        }
    }

    private bool AuthenticateUser(string userName, string password, out string role)
    {
        role = null;
        string connectionString = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;

        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            string sql = "SELECT PasswordHash, PasswordSalt, Role FROM [User] WHERE UserName = @UserName";
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@UserName", userName);

            conn.Open();

            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                if (reader.Read())
                {
                    string storedHash = reader["PasswordHash"].ToString();
                    string storedSalt = reader["PasswordSalt"].ToString();
                    role = reader["Role"].ToString();
                    string passwordHash = GenerateHash(password, storedSalt);

                    return storedHash == passwordHash;
                }
            }
        }
        return false;
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

    private void LogError(Exception ex)
    {
        // Log errors to a file or database as needed
        string logFilePath = Server.MapPath("~/App_Data/ErrorLog.txt");
        using (StreamWriter writer = new StreamWriter(logFilePath, true))
        {
            writer.WriteLine("Date: " + DateTime.Now.ToString());
            writer.WriteLine("Message: " + ex.Message);
            writer.WriteLine("StackTrace: " + ex.StackTrace);
            writer.WriteLine("-----------------------------------------------------");
        }
    }

    protected void btnReset_Click(object sender, EventArgs e)
    {
        // Clear the input fields
        txtUserName.Text = "";
        txtPassword.Text = "";
        lblMessage.Text = "Login to School Website";
        chkboxRem.Checked = false;
        txtUserName.Focus();
    }
}
