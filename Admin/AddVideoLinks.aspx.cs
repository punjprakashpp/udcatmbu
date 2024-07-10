﻿using System;
using System.IO;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_pages_UploadMarqueeVideos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
        }
    }

    protected void btnSubmit_Edit(object sender, EventArgs e)
    {
        Response.Redirect("ManageVideoLinks.aspx");
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string VideoText = txtVideoText.Text.Trim();
        string VideoURL = txtVideoURL.Text.Trim();

        // Remove "https://youtu.be/" from the VideoURL if it exists
        string urlToRemove = "https://youtu.be/";
        if (VideoURL.StartsWith(urlToRemove))
        {
            VideoURL = VideoURL.Replace(urlToRemove, string.Empty);
        }

        if (!string.IsNullOrEmpty(VideoText) && !string.IsNullOrEmpty(VideoURL))
        {
            string connStr = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "INSERT INTO Video (VideoText, VideoURL) VALUES (@VideoText, @VideoURL)";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@VideoText", VideoText);
                    cmd.Parameters.AddWithValue("@VideoURL", VideoURL);

                    try
                    {
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        lblMessage.Text = "Video Link uploaded successfully!";
                        lblMessage.ForeColor = System.Drawing.Color.Green;

                        // Clear form fields
                        txtVideoText.Text = string.Empty;
                        txtVideoURL.Text = string.Empty;
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
            lblMessage.Text = "Please enter both Video Text and Video Link URL.";
            lblMessage.ForeColor = System.Drawing.Color.Red;
        }
    }
}