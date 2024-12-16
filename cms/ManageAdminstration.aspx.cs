using System;
using System.Configuration;
using System.Data;
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
        string query = "SELECT * FROM Member WHERE Type = @Type AND Position = @Position";

        try
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@Type", "Admin");
                cmd.Parameters.AddWithValue("@Position", ddlType.SelectedItem.ToString());

                con.Open();
                using (SqlDataReader rdr = cmd.ExecuteReader())
                {
                    if (rdr.Read())
                    {
                        hfPersonID.Value = rdr["MemberID"].ToString();
                        txtName.Text = rdr["Name"].ToString();
                        txtPhone.Text = rdr["Phone"].ToString();
                        txtEmail.Text = rdr["Email"].ToString();
                        hfCurrentFilePath.Value = rdr["FilePath"].ToString();

                        currentImage.Src = ResolveUrl("~/" + rdr["FilePath"].ToString());
                        currentImage.Style["display"] = "block";
                    }
                    else
                    {
                        ClearForm();
                    }
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
        string name = txtName.Text.Trim();
        string filePath = hfCurrentFilePath.Value ?? "Image/default/default.jpg"; // Default image path

        try
        {
            if (fileUpload.HasFile)
            {
                // Validate file type
                string fileExtension = Path.GetExtension(fileUpload.FileName).ToLower();
                if (fileExtension == ".jpg" || fileExtension == ".jpeg" || fileExtension == ".png")
                {
                    string fileName = name + fileExtension;
                    string folderPath = Server.MapPath("~/Uploads/person/");

                    if (!Directory.Exists(folderPath))
                    {
                        Directory.CreateDirectory(folderPath);
                    }

                    string fullPath = Path.Combine(folderPath, fileName);

                    // Save the cropped image if provided
                    string base64String = imagePreviewBase64.Value;
                    if (!string.IsNullOrEmpty(base64String))
                    {
                        base64String = base64String.Replace("data:image/png;base64,", "").Replace("data:image/jpeg;base64,", "");
                        byte[] imageBytes = Convert.FromBase64String(base64String);

                        using (MemoryStream ms = new MemoryStream(imageBytes))
                        using (Bitmap bmp = new Bitmap(ms))
                        {
                            bmp.Save(fullPath, ImageFormat.Png);
                        }

                        filePath = "Uploads/person/" + fileName;

                        // Delete the old file if a new one is uploaded
                        DeletePreviousFile(hfCurrentFilePath.Value);
                    }
                }
                else
                {
                    Alert("Invalid file type. Only .jpg, .jpeg, and .png are allowed.");
                    return;
                }
            }

            SavePerson(name, filePath);

            Alert("Person saved successfully!");
            ClearForm();
        }
        catch (Exception ex)
        {
            lblMessage.Text = "Error saving person: " + ex.Message;
        }
    }

    private void SavePerson(string name, string filePath)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;

        using (SqlConnection con = new SqlConnection(connectionString))
        {
            string query = string.IsNullOrEmpty(hfPersonID.Value)
                ? "INSERT INTO Member (Type, Align, Name, Position, Phone, Email, FilePath, UploadDate) VALUES (@Type, @Align, @Name, @Position, @Phone, @Email, @FilePath, @UploadDate)"
                : "UPDATE Member SET Name = @Name, Phone = @Phone, Email = @Email, FilePath = @FilePath WHERE MemberID = @MemberID";

            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@Type", "Admin");
                cmd.Parameters.AddWithValue("@Align", ddlType.SelectedIndex);
                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@Position", ddlType.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@Phone", txtPhone.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@FilePath", filePath);
                cmd.Parameters.AddWithValue("@UploadDate", DateTime.Now);

                if (!string.IsNullOrEmpty(hfPersonID.Value))
                {
                    cmd.Parameters.AddWithValue("@MemberID", hfPersonID.Value);
                }

                con.Open();
                cmd.ExecuteNonQuery();
            }
        }
    }

    private void DeletePreviousFile(string filePath)
    {
        if (!string.IsNullOrEmpty(filePath))
        {
            string fullPath = Server.MapPath("~/" + filePath);
            if (File.Exists(fullPath))
            {
                File.Delete(fullPath);
            }
        }
    }

    private void ClearForm()
    {
        hfPersonID.Value = string.Empty;
        ddlType.SelectedIndex = 0;
        txtName.Text = string.Empty;
        txtPhone.Text = string.Empty;
        txtEmail.Text = string.Empty;
        fileUpload.Attributes.Clear();
        hfCurrentFilePath.Value = string.Empty;
        currentImage.Src = string.Empty;
        currentImage.Style["display"] = "none";
    }

    private void Alert(string message)
    {
        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + message.Replace("'", "\'") + "');", true);
    }
}
