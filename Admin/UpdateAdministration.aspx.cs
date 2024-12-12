using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;

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

        try
        {
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
                        txtPhone.Text = rdr["Phone"].ToString();
                        txtEmail.Text = rdr["Email"].ToString();
                        hfCurrentFilePath.Value = rdr["FilePath"].ToString(); // Save current image path
                        currentImage.Src = ResolveUrl("~/" + rdr["FilePath"].ToString());
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
        catch (Exception ex)
        {
            lblMessage.Text = "Error loading person: " + ex.Message;
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        string type = ddlType.SelectedValue;
        string name = txtName.Text.Trim();
        string FilePath = !string.IsNullOrEmpty(hfCurrentFilePath.Value) ? hfCurrentFilePath.Value : "img/default/default.jpg"; // Default image path

        try
        {
            if (fileUpload.HasFile)
            {
                // Check if the file is an image
                string fileExtension = Path.GetExtension(fileUpload.FileName).ToLower();
                if (fileExtension == ".jpg" || fileExtension == ".jpeg" || fileExtension == ".png")
                {
                    string fileName = Path.GetFileName(fileUpload.PostedFile.FileName);
                    string folderPath = Server.MapPath("~/img/person/");
                    if (!Directory.Exists(folderPath))
                    {
                        Directory.CreateDirectory(folderPath);
                    }
                    string fullPath = folderPath + fileName;

                    // Save the cropped image
                    string base64String = imagePreviewBase64.Value;
                    if (!string.IsNullOrEmpty(base64String))
                    {
                        base64String = base64String.Replace("data:image/png;base64,", "").Replace("data:image/jpeg;base64,", "");
                        byte[] imageBytes = Convert.FromBase64String(base64String);
                        using (MemoryStream ms = new MemoryStream(imageBytes))
                        {
                            using (Bitmap bmp = new Bitmap(ms))
                            {
                                bmp.Save(fullPath, ImageFormat.Png);
                            }
                        }
                        FilePath = "img/person/" + fileName;

                        // Delete the previous image file if a new one is uploaded and it's an update operation
                        if (!string.IsNullOrEmpty(hfCurrentFilePath.Value))
                        {
                            string previousFilePath = Server.MapPath("~/" + hfCurrentFilePath.Value);
                            if (File.Exists(previousFilePath))
                            {
                                File.Delete(previousFilePath);
                            }
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
                    query = "INSERT INTO Person (Type, Name, Phone, Email, FilePath) VALUES (@Type, @Name, @Phone, @Email, @FilePath)";
                }
                else
                {
                    // Update existing record
                    query = "UPDATE Person SET Name = @Name, Phone = @Phone, Email = @Email, FilePath = @FilePath WHERE Type = @Type AND PersonID = @PersonID";
                }

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Type", type);
                    cmd.Parameters.AddWithValue("@Name", name);
                    cmd.Parameters.AddWithValue("@Phone", txtPhone.Text);
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@FilePath", FilePath);

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
        }
        catch (Exception ex)
        {
            lblMessage.Text = "Error saving person: " + ex.Message;
        }

        ClearForm();
    }

    private void ClearForm()
    {
        hfPersonID.Value = string.Empty;
        ddlType.SelectedIndex = 0;
        txtName.Text = string.Empty;
        txtPhone.Text = string.Empty;
        txtEmail.Text = string.Empty;
        fileUpload.Attributes.Clear();
        currentImage.Style["display"] = "none";
    }
}
