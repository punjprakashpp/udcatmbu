using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Web.UI.WebControls;

public partial class Admin_pages_EditFaculty : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            PopulateFacultyDropdown();
            if (!string.IsNullOrEmpty(ddlFaculties.SelectedValue))
            {
                PopulateFacultyDetails(Convert.ToInt32(ddlFaculties.SelectedValue));
            }
        }
    }

    private void PopulateFacultyDropdown()
    {
        string connStr = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            string query = "SELECT ID, Title FROM Image Where Type ='Slider'";
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                ddlFaculties.DataSource = reader;
                ddlFaculties.DataTextField = "Title";
                ddlFaculties.DataValueField = "ID";
                ddlFaculties.DataBind();
                ddlFaculties.Items.Insert(0, new ListItem("--Select Slider Image--", ""));
                reader.Close();
            }
        }
    }

    private void PopulateFacultyDetails(int facultyId)
    {
        string connStr = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            string query = "SELECT * FROM Image WHERE ID = @SliderID";
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@SliderID", facultyId);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    txtName.Text = reader["Title"].ToString();
                    currentImage.Src = ResolveUrl("~/" + reader["ImagePath"].ToString());
                    currentImage.Style["display"] = "block";
                }
                reader.Close();
            }
        }
    }

    protected void ddlFaculties_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(ddlFaculties.SelectedValue))
        {
            PopulateFacultyDetails(Convert.ToInt32(ddlFaculties.SelectedValue));
        }
        else
        {
            ClearForm();
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(ddlFaculties.SelectedValue))
        {
            int facultyId = Convert.ToInt32(ddlFaculties.SelectedValue);
            string connStr = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;
            string imagePath = "";
            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();


                string selectImagePathQuery = "SELECT ImagePath FROM Image WHERE ID = @SliderID";
                using (SqlCommand selectImagePathCmd = new SqlCommand(selectImagePathQuery, con))
                {
                    selectImagePathCmd.Parameters.AddWithValue("@SliderID", facultyId);
                    imagePath = selectImagePathCmd.ExecuteScalar() as string;
                }
            }

            bool newFileUploaded = fileUpload.HasFile;
            string oldImagePath = imagePath; // Store the current image path

            if (newFileUploaded)
            {
                string fileExtension = Path.GetExtension(fileUpload.FileName).ToLower();
                if (fileExtension == ".jpg" || fileExtension == ".jpeg" || fileExtension == ".png")
                {
                    string fileName = Path.GetFileName(fileUpload.PostedFile.FileName);
                    string folderPath = Server.MapPath("~/img/slider/");
                    string fullPath = Path.Combine(folderPath, fileName);

                    try
                    {
                        if (!Directory.Exists(folderPath))
                        {
                            Directory.CreateDirectory(folderPath);
                        }

                        // Save the new file
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
                        imagePath = "img/slider/" + fileName;

                        // Delete the old file
                        if (!string.IsNullOrEmpty(oldImagePath))
                        {
                            string filePath = Server.MapPath("~/" + oldImagePath);
                            if (File.Exists(filePath))
                            {
                                File.Delete(filePath);
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        lblMessage.Text = "Error saving new image file: " + ex.Message;
                        return;
                    }
                }
                else
                {
                    lblMessage.Text = "Invalid file type. Only .jpg, .jpeg, .png files are allowed.";
                    return;
                }
            }

            try
            {
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string query = "UPDATE Image SET Title = @Title, ImagePath = @FilePath WHERE ID = @SliderID";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Title", txtName.Text);
                        cmd.Parameters.AddWithValue("@FilePath", imagePath);
                        cmd.Parameters.AddWithValue("@SliderID", ddlFaculties.SelectedValue);
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        lblMessage.Text = "Slider Image updated successfully!";
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error updating Slider Image: " + ex.Message;
            }
        }
        else
        {
            lblMessage.Text = "Please select a Slider Image.";
        }

        ClearForm();
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(ddlFaculties.SelectedValue))
        {
            int facultyId = Convert.ToInt32(ddlFaculties.SelectedValue);
            string connStr = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;

            try
            {
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    conn.Open();

                    string imagePath = "";
                    string selectImagePathQuery = "SELECT ImagePath FROM Image WHERE ID = @SliderID";
                    using (SqlCommand selectImagePathCmd = new SqlCommand(selectImagePathQuery, conn))
                    {
                        selectImagePathCmd.Parameters.AddWithValue("@SliderID", facultyId);
                        imagePath = selectImagePathCmd.ExecuteScalar() as string;
                    }

                    string deleteFacultyQuery = "DELETE FROM Image WHERE ID = @SliderID";
                    using (SqlCommand deleteFacultyCmd = new SqlCommand(deleteFacultyQuery, conn))
                    {
                        deleteFacultyCmd.Parameters.AddWithValue("@SliderID", facultyId);
                        int rowsAffected = deleteFacultyCmd.ExecuteNonQuery();
                        if (rowsAffected > 0 && !string.IsNullOrEmpty(imagePath))
                        {
                            string filePath = Server.MapPath("~/" + imagePath);
                            if (File.Exists(filePath))
                            {
                                File.Delete(filePath);
                            }

                            lblMessage.Text = "Slider Image deleted successfully!";
                            PopulateFacultyDropdown();
                            ClearForm();
                        }
                        else
                        {
                            lblMessage.Text = "Failed to delete Slider Image.";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error deleting Slider Image: " + ex.Message;
            }
        }
        else
        {
            lblMessage.Text = "Please select a Slider Image.";
        }
    }

    private void ClearForm()
    {
        txtName.Text = string.Empty;
        fileUpload.Attributes.Clear();
        currentImage.Style["display"] = "none";
    }
}