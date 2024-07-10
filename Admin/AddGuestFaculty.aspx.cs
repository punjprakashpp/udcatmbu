﻿using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_pages_AddFaculty : System.Web.UI.Page
{
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        Response.Redirect("ManageGuestFaculty.aspx");
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        string imagePath = "img/default/default.jpg"; // Default image path
        string type = ddlType.SelectedValue;
        if (fileUpload.HasFile)
        {
            // Check if the file is an image
            string fileExtension = Path.GetExtension(fileUpload.FileName).ToLower();
            if (fileExtension == ".jpg" || fileExtension == ".jpeg" || fileExtension == ".png")
            {
                string fileName = Path.GetFileName(fileUpload.PostedFile.FileName);
                string folderPath = Server.MapPath("../img/guest/");
                if (!Directory.Exists(folderPath))
                {
                    Directory.CreateDirectory(folderPath);
                }
                string fullPath = folderPath + fileName;

                // Save the cropped image

                string base64String = imagePreviewBase64.Value;
                base64String = base64String.Replace("data:image/png;base64,", "").Replace("data:image/jpeg;base64,", "");
                byte[] imageBytes = Convert.FromBase64String(base64String);
                using (MemoryStream ms = new MemoryStream(imageBytes))
                {
                    using (Bitmap bmp = new Bitmap(ms))
                    {
                        bmp.Save(fullPath, ImageFormat.Png);
                    }
                }
                imagePath = "img/guest/" + fileName;
            }
            else
            {
                lblMessage.Text = "Invalid file type. Only .jpg, .jpeg, .png files are allowed.";
                return;
            }
        }

        string connStr = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "INSERT INTO Guest (Type, Name, Qualification, Position, Phone, Email, ImagePath) VALUES (@Type, @Name, @Qualification, @Position, @Phone, @Email, @ImagePath)";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Type", type);
                    cmd.Parameters.AddWithValue("@Name", txtName.Text);
                    cmd.Parameters.AddWithValue("@Qualification", txtQualification.Text);
                    cmd.Parameters.AddWithValue("@Position", txtPosition.Text);
                    cmd.Parameters.AddWithValue("@Phone", txtPhone.Text);
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@ImagePath", imagePath);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    lblMessage.Text = "Guest Faculty details saved successfully!";
                }
            }

            ClearForm();
    }

    private void ClearForm()
    {
        txtName.Text = string.Empty;
        fileUpload.Attributes.Clear();
        txtQualification.Text= string.Empty;
        txtPosition.Text = string.Empty;
        txtPhone.Text= string.Empty;
        txtEmail.Text = string.Empty;
        ddlType.SelectedIndex = 0;
    }

}