using System;
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

public partial class Admin_pages_UpdateAdministration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadPerson();
        }
    }

    protected void ddlType_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadPerson();
    }

    private void LoadPerson()
    {
        string connectionString = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;
        string query = "SELECT * FROM Person WHERE Type = @Type";

        using (SqlConnection con = new SqlConnection(connectionString))
        {
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@Type", ddlType.SelectedValue);
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.Read())
                {
                    hfPersonID.Value = rdr["PersonID"].ToString();
                    txtName.Text = rdr["Name"].ToString();
                    hfCurrentImagePath.Value = rdr["ImagePath"].ToString(); // Save current image path
                    currentImage.Src = ResolveUrl("../" + rdr["ImagePath"].ToString());
                    currentImage.Style["display"] = "block";
                }
                else
                {
                    currentImage.Style["display"] = "none";
                }
                con.Close();
            }
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        string type = ddlType.SelectedValue;
        string name = txtName.Text.Trim();
        string imagePath = "img/default/default.jpg"; // Default image path

        if (fileUpload.HasFile)
        {
            // Check if the file is an image
            string fileExtension = Path.GetExtension(fileUpload.FileName).ToLower();
            if (fileExtension == ".jpg" || fileExtension == ".jpeg" || fileExtension == ".png")
            {
                string fileName = Path.GetFileName(fileUpload.PostedFile.FileName);
                string folderPath = Server.MapPath("../img/person/");
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
                imagePath = "img/person/" + fileName;

                // Delete the previous image file if a new one is uploaded and it's an update operation
                if (!string.IsNullOrEmpty(hfCurrentImagePath.Value))
                {
                    string previousImagePath = Server.MapPath("../" + hfCurrentImagePath.Value);
                    if (File.Exists(previousImagePath))
                    {
                        File.Delete(previousImagePath);
                    }
                }
            }
            else
            {
                lblMessage.Text = "Invalid file type. Only .jpg, .jpeg, .png files are allowed.";
                return;
            }
        }

        string connectionString = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;

        using (SqlConnection con = new SqlConnection(connectionString))
        {
            string query;
            if (string.IsNullOrEmpty(hfPersonID.Value))
            {
                // Insert new record
                query = "INSERT INTO Person (Type, Name, ImagePath) VALUES (@Type, @Name, @ImagePath)";
            }
            else
            {
                // Update existing record
                query = "UPDATE Person SET Name = @Name, ImagePath = @ImagePath WHERE Type = @Type";
            }

            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@Type", type);
                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@ImagePath", imagePath);

                if (!string.IsNullOrEmpty(hfPersonID.Value))
                {
                    cmd.Parameters.AddWithValue("@PersonID", hfPersonID.Value);
                }

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                lblMessage.Text = "Person saved successfully!";
            }
        }

        ClearForm();
    }

    private void ClearForm()
    {
        hfPersonID.Value = string.Empty;
        ddlType.SelectedIndex = 0;
        txtName.Text = string.Empty;
        fileUpload.Attributes.Clear();
        currentImage.Style["display"] = "none";
    }
}
