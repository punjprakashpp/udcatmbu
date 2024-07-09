using System;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.UI;

public partial class Admin_pages_UploadGalleryImage : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btnEdit_Click(object sender, EventArgs e)
    {
        Response.Redirect("DeleteGalleryImage.aspx");
    }

    protected void btnUpload_Click(object sender, EventArgs e)
    {
        string occasion = txtOccasion.Text;
        string uploadFolder = Server.MapPath("../img/gallery/");
        string imagePath = "img/gallery/";

        // Ensure the upload directory exists
        if (!Directory.Exists(uploadFolder))
        {
            Directory.CreateDirectory(uploadFolder);
        }

        if (fileUpload.HasFiles)
        {
            foreach (HttpPostedFile uploadedFile in fileUpload.PostedFiles)
            {
                string fileName = Path.GetFileName(uploadedFile.FileName);
                string fullFilePath = Path.Combine(uploadFolder, fileName);
                string relativeFilePath = Path.Combine(imagePath, fileName);

                // Save the file to the server
                uploadedFile.SaveAs(fullFilePath);

                // Save the file path and details to the database
                SaveImageDetailsToDatabase(occasion, relativeFilePath);
            }

            lblMessage.Text = "Images uploaded successfully.";
        }
        else
        {
            lblMessage.Text = "Please select at least one image to upload.";
        }
    }

    private void SaveImageDetailsToDatabase(string occasion, string imagePath)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string query = "INSERT INTO Gallery (Occasion, ImagePath) VALUES (@Occasion, @ImagePath)";

            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@Occasion", occasion);
                command.Parameters.AddWithValue("@ImagePath", imagePath);

                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
            }
        }
    }
}
