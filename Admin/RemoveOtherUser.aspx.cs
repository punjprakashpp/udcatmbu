using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_RemoveOtherUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            PopulateUserNames();
        }
    }

    protected void btnRemoveUser_Click(object sender, EventArgs e)
    {
        string selectedUser = ddlUserNames.SelectedValue;
        string currentUser = HttpContext.Current.User.Identity.Name;

        if (selectedUser == currentUser)
        {
            lblMessage.Text = "You cannot remove your own account.";
            return;
        }

        if (RemoveUser(selectedUser))
        {
            lblMessage.ForeColor = System.Drawing.Color.Green;
            lblMessage.Text = "User removed successfully!";
            PopulateUserNames(); // Refresh the dropdown list
        }
        else
        {
            lblMessage.Text = "An error occurred while removing the user.";
        }
    }

    private void PopulateUserNames()
    {
        string connectionString = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;
        string currentUser = HttpContext.Current.User.Identity.Name;

        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            string sql = "SELECT UserName FROM Users WHERE UserName != @CurrentUserName";
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@CurrentUserName", currentUser);

            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            ddlUserNames.Items.Clear();
            while (reader.Read())
            {
                ddlUserNames.Items.Add(new ListItem(reader["UserName"].ToString()));
            }
        }
    }

    private bool RemoveUser(string userName)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;

        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            string sql = "DELETE FROM Users WHERE UserName = @UserName";
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@UserName", userName);

            conn.Open();
            int rowsAffected = cmd.ExecuteNonQuery();

            return rowsAffected > 0;
        }
    }
}
