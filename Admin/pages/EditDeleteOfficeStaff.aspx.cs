using System;
using System.Configuration;
using System.Data;
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
            string query = "SELECT OfficeId, Name FROM Office";
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                ddlFaculties.DataSource = reader;
                ddlFaculties.DataTextField = "Name";
                ddlFaculties.DataValueField = "OfficeId";
                ddlFaculties.DataBind();
                ddlFaculties.Items.Insert(0, new ListItem("--Select Office--", ""));
                reader.Close();
            }
        }
    }

    private void PopulateFacultyDetails(int facultyId)
    {
        string connStr = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            string query = "SELECT * FROM Office WHERE OfficeId = @OfficeId";
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@OfficeId", facultyId);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    txtName.Text = reader["Name"].ToString();
                    txtQualification.Text = reader["Qualification"].ToString();
                    txtPosition.Text = reader["Position"].ToString();
                    txtPhone.Text = reader["Phone"].ToString();
                    txtEmail.Text = reader["Email"].ToString();
                    currentImage.Src = ResolveUrl("../../" + reader["ImagePath"].ToString());
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


                string selectImagePathQuery = "SELECT ImagePath FROM Office WHERE OfficeId = @OfficeId";
                using (SqlCommand selectImagePathCmd = new SqlCommand(selectImagePathQuery, con))
                {
                    selectImagePathCmd.Parameters.AddWithValue("@OfficeId", facultyId);
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
                    string folderPath = Server.MapPath("~/img/office/");
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
                        imagePath = "img/office/" + fileName;

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
                    string query = "UPDATE Office SET Name = @Name, Qualification = @Qualification, Position = @Position, Phone = @Phone, Email = @Email, ImagePath = @ImagePath WHERE OfficeId = @OfficeId";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Name", txtName.Text);
                        cmd.Parameters.AddWithValue("@Qualification", txtQualification.Text);
                        cmd.Parameters.AddWithValue("@Position", txtPosition.Text);
                        cmd.Parameters.AddWithValue("@Phone", txtPhone.Text);
                        cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                        cmd.Parameters.AddWithValue("@ImagePath", imagePath);
                        cmd.Parameters.AddWithValue("@OfficeId", ddlFaculties.SelectedValue);
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        lblMessage.Text = "Staff details updated successfully!";
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error updating faculty details: " + ex.Message;
            }
        }
        else
        {
            lblMessage.Text = "Please select a faculty.";
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
                    string selectImagePathQuery = "SELECT ImagePath FROM Office WHERE OfficeId = @OfficeId";
                    using (SqlCommand selectImagePathCmd = new SqlCommand(selectImagePathQuery, conn))
                    {
                        selectImagePathCmd.Parameters.AddWithValue("@OfficeId", facultyId);
                        imagePath = selectImagePathCmd.ExecuteScalar() as string;
                    }

                    string deleteFacultyQuery = "DELETE FROM Office WHERE OfficeId = @OfficeId";
                    using (SqlCommand deleteFacultyCmd = new SqlCommand(deleteFacultyQuery, conn))
                    {
                        deleteFacultyCmd.Parameters.AddWithValue("@OfficeId", facultyId);
                        int rowsAffected = deleteFacultyCmd.ExecuteNonQuery();
                        if (rowsAffected > 0 && !string.IsNullOrEmpty(imagePath))
                        {
                            string filePath = Server.MapPath("~/" + imagePath);
                            if (File.Exists(filePath))
                            {
                                File.Delete(filePath);
                            }

                            lblMessage.Text = "Staff deleted successfully!";
                            PopulateFacultyDropdown();
                            ClearForm();
                        }
                        else
                        {
                            lblMessage.Text = "Failed to delete Staff.";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error deleting faculty: " + ex.Message;
            }
        }
        else
        {
            lblMessage.Text = "Please select a Staff.";
        }
    }

    private void ClearForm()
    {
        txtName.Text = string.Empty;
        fileUpload.Attributes.Clear();
        txtQualification.Text = string.Empty;
        txtPosition.Text = string.Empty;
        txtPhone.Text = string.Empty;
        txtEmail.Text = string.Empty;
        currentImage.Style["display"] = "none";
    }
}