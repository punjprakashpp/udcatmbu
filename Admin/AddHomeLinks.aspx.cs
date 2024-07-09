using System;
using System.IO;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_pages_UploadMarqueeLinks : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            PopulateDropDownList();
        }
    }

    private void PopulateDropDownList()
    {
        ddlLinkPicker.Items.Clear(); // Clear existing items

        string[] filePaths = Directory.GetFiles(Server.MapPath("~/"), "*.aspx", SearchOption.TopDirectoryOnly);
        ddlLinkPicker.Items.Add(new ListItem("--Select Link--", string.Empty));
        // Add more predefined links as needed

        foreach (string filePath in filePaths)
        {
            string relativePath = filePath.Replace(Server.MapPath("~/"), "").Replace("\\", "/");
            string fileName = Path.GetFileNameWithoutExtension(filePath);
            ddlLinkPicker.Items.Add(new ListItem(fileName, relativePath));
        }
    }

    protected void ddlLinkPicker_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlLinkPicker.SelectedValue != string.Empty)
        {
            txtLinkURL.Text = ddlLinkPicker.SelectedValue;
        }
    }

    protected void btnSubmit_Edit(object sender, EventArgs e)
    {
        Response.Redirect("ManageHomeLinks.aspx");
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string linkText = txtLinkText.Text.Trim();
        string linkURL = txtLinkURL.Text.Trim();

        if (!string.IsNullOrEmpty(linkText) && !string.IsNullOrEmpty(linkURL))
        {
            string connStr = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "INSERT INTO Links (LinkText, LinkURL) VALUES (@LinkText, @LinkURL)";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@LinkText", linkText);
                    cmd.Parameters.AddWithValue("@LinkURL", linkURL);

                    try
                    {
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        lblMessage.Text = "Link uploaded successfully!";
                        lblMessage.ForeColor = System.Drawing.Color.Green;

                        // Clear form fields
                        txtLinkText.Text = string.Empty;
                        txtLinkURL.Text = string.Empty;
                        ddlLinkPicker.SelectedIndex = 0;

                        // Refresh the dropdown list
                        PopulateDropDownList();
                    }
                    catch (Exception ex)
                    {
                        lblMessage.Text = "Error: " + ex.Message;
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                    }
                }
            }
        }
        else
        {
            lblMessage.Text = "Please enter both Link Text and Link URL.";
            lblMessage.ForeColor = System.Drawing.Color.Red;
        }
    }
}
