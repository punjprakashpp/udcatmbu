﻿using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;

public partial class AddOfficeStaff : System.Web.UI.Page
{
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        Response.Redirect("ManageStaff.aspx");
    }

    protected void Alert(string message)
    {
        string script = string.Format("alert('{0}');", message.Replace("'", "\\'")); // Escape single quotes

        // Register the JavaScript alert
        ClientScript.RegisterStartupScript(this.GetType(), "AlertMessage", script, true);
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        string FilePath = "Image/default/default.jpg"; // Default image path
        string type = ddlType.SelectedValue;
        if (fileUpload.HasFile)
        {
            // Check if the file is an image
            string fileExtension = Path.GetExtension(fileUpload.FileName).ToLower();
            if (fileExtension == ".jpg" || fileExtension == ".jpeg" || fileExtension == ".png")
            {
                string fileName = txtName.Text.Trim().ToString() + Path.GetExtension(fileUpload.FileName).ToLower();
                string folderPath = Server.MapPath("~/Uploads/Staff/");
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
                FilePath = "Uploads/Staff/" + fileName;
            }
            else
            {
                Alert("Invalid file type. Only .jpg, .jpeg, .png files are allowed.");
                return;
            }
        }

        string connStr = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "INSERT INTO Member (Type, Status, Name, Qualification, Position, Phone, Email, FilePath, UploadDate) VALUES (@Type, @Status, @Name, @Qualification, @Position, @Phone, @Email, @FilePath, @UploadDate)";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Type", type);
                    cmd.Parameters.AddWithValue("@Status", string.Empty);
                    cmd.Parameters.AddWithValue("@Name", txtName.Text);
                    cmd.Parameters.AddWithValue("@Qualification", txtQualification.Text);
                    cmd.Parameters.AddWithValue("@Position", txtPosition.Text);
                    cmd.Parameters.AddWithValue("@Phone", txtPhone.Text);
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@FilePath", FilePath);
                    cmd.Parameters.AddWithValue("@UploadDate", DateTime.Now);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    Alert("Staff details saved successfully!");
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
