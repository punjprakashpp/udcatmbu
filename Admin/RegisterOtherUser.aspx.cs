using System;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            string userName = txtUserName.Text;
            string email = txtEmail.Text;
            string password = txtPassword.Text;

            if (IsUserExist(userName, email))
            {
                lblMessage.Text = "User with the same username or email already exists.";
                return;
            }

            string passwordSalt = CreateSalt();
            string passwordHash = GenerateHash(password, passwordSalt);

            string connectionString = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string sql = "INSERT INTO Admin (UserName, Email, PasswordHash, PasswordSalt, CreatedDate) VALUES (@UserName, @Email, @PasswordHash, @PasswordSalt, @CreatedDate)";
                SqlCommand cmd = new SqlCommand(sql, conn);

                cmd.Parameters.AddWithValue("@UserName", userName);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@PasswordHash", passwordHash);
                cmd.Parameters.AddWithValue("@PasswordSalt", passwordSalt);
                cmd.Parameters.AddWithValue("@CreatedDate", DateTime.Now);

                conn.Open();
                cmd.ExecuteNonQuery();
            }

            lblMessage.ForeColor = System.Drawing.Color.Green;
            lblMessage.Text = "User registered successfully!";
        }
    }

    private bool IsUserExist(string userName, string email)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;

        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            string sql = "SELECT COUNT(*) FROM Admin WHERE UserName = @UserName OR Email = @Email";
            SqlCommand cmd = new SqlCommand(sql, conn);

            cmd.Parameters.AddWithValue("@UserName", userName);
            cmd.Parameters.AddWithValue("@Email", email);

            conn.Open();
            int userCount = (int)cmd.ExecuteScalar();

            return userCount > 0;
        }
    }

    private string CreateSalt()
    {
        byte[] saltBytes = new byte[16];
        using (RNGCryptoServiceProvider provider = new RNGCryptoServiceProvider())
        {
            provider.GetBytes(saltBytes);
        }
        return Convert.ToBase64String(saltBytes);
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