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

public partial class Admin_Account_ChangePassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnChangePassword_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            string userName = HttpContext.Current.User.Identity.Name;
            string oldPassword = txtCurrentPassword.Text;
            string newPassword = txtNewPassword.Text;

            if (ValidateCurrentPassword(userName, oldPassword))
            {
                string newSalt = CreateSalt();
                string newHash = GenerateHash(newPassword, newSalt);

                if (UpdatePassword(userName, newHash, newSalt))
                {
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    lblMessage.Text = "Password changed successfully!";
                }
                else
                {
                    lblMessage.Text = "An error occurred while updating the password.";
                }
            }
            else
            {
                lblMessage.Text = "Current password is incorrect.";
            }
        }
    }

    private bool ValidateCurrentPassword(string userName, string password)
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

    private bool UpdatePassword(string userName, string newHash, string newSalt)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;

        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            string sql = "UPDATE Admin SET PasswordHash = @PasswordHash, PasswordSalt = @PasswordSalt WHERE UserName = @UserName";
            SqlCommand cmd = new SqlCommand(sql, conn);

            cmd.Parameters.AddWithValue("@PasswordHash", newHash);
            cmd.Parameters.AddWithValue("@PasswordSalt", newSalt);
            cmd.Parameters.AddWithValue("@UserName", userName);

            conn.Open();
            int rowsAffected = cmd.ExecuteNonQuery();

            return rowsAffected > 0;
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