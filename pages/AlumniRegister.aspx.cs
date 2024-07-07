using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Web.UI.WebControls;

public partial class pages_AlumniRegister : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Populate Session dropdown
            PopulateSessionDropdown();
        }
    }

    private void PopulateSessionDropdown()
    {
        ddlSession.Items.Add(new ListItem("-Select-Session-", string.Empty));
        int currentYear = DateTime.Now.Year;
        for (int year = 2002; year <= currentYear; year++)
        {
            if (year <= 2018)
                ddlSession.Items.Add(new ListItem(year.ToString() + " - " + (year + 3).ToString(), year.ToString()));
            else if (year > 2018 && year <= currentYear - 2)
                ddlSession.Items.Add(new ListItem(year.ToString() + " - " + (year + 2).ToString(), year.ToString()));
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (!Page.IsValid) return;

        string imagePath = "img/default/default.jpg"; // Default image path

        if (fileUpload.HasFile)
        {
            // Check if the file is an image
            string fileExtension = Path.GetExtension(fileUpload.FileName).ToLower();
            if (fileExtension == ".jpg" || fileExtension == ".jpeg" || fileExtension == ".png")
            {
                string fileName = Path.GetFileName(fileUpload.PostedFile.FileName);
                string folderPath = Server.MapPath("~/img/alumni/");
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
                imagePath = "img/alumni/" + fileName; // Removed tilde (~)
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
            string query = @"INSERT INTO Alumni 
                        (Name, Qualification, Phone, Email, ImagePath, Session, RegistrationNo, RegistrationYear, RollNo, Occupation, Company, LinkedIn, Facebook, Instagram, Twitter) 
                        VALUES 
                        (@Name, @Qualification, @Phone, @Email, @ImagePath, @Session, @RegistrationNo, @RegistrationYear, @RollNo, @Occupation, @Company, @LinkedIn, @Facebook, @Instagram, @Twitter)";
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@Name", txtName.Text);
                cmd.Parameters.AddWithValue("@Qualification", txtQualification.Text);
                cmd.Parameters.AddWithValue("@Phone", txtPhone.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@ImagePath", imagePath);
                cmd.Parameters.AddWithValue("@Session", string.IsNullOrEmpty(ddlSession.SelectedValue) ? (object)DBNull.Value : ddlSession.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@RegistrationNo", txtRegistrationNo.Text);
                cmd.Parameters.AddWithValue("@RegistrationYear", Convert.ToInt32(txtRegistrationYear.Text));
                cmd.Parameters.AddWithValue("@RollNo", txtRollNo.Text);
                cmd.Parameters.AddWithValue("@Company", txtCompany.Text);
                cmd.Parameters.AddWithValue("@Occupation", txtOccupation.Text);
                cmd.Parameters.AddWithValue("@LinkedIn", txtLinkedIn.Text);
                cmd.Parameters.AddWithValue("@Facebook", txtFacebook.Text);
                cmd.Parameters.AddWithValue("@Instagram", txtInstagram.Text);
                cmd.Parameters.AddWithValue("@Twitter", txtTwitter.Text);

                conn.Open();
                cmd.ExecuteNonQuery();
                lblMessage.Text = "Alumni details saved successfully!";
            }
        }

        ClearForm();
    }

    protected void cvDuplicateCheck_ServerValidate(object source, ServerValidateEventArgs args)
    {
        string connStr = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            string query = @"SELECT COUNT(*) FROM Alumni WHERE RegistrationNo = @RegistrationNo AND RollNo = @RollNo AND RegistrationYear = @RegistrationYear";
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@RegistrationNo", txtRegistrationNo.Text);
                cmd.Parameters.AddWithValue("@RollNo", txtRollNo.Text);
                cmd.Parameters.AddWithValue("@RegistrationYear", txtRegistrationYear.Text);

                conn.Open();
                int count = (int)cmd.ExecuteScalar();
                if (count > 0)
                {
                    args.IsValid = false;
                }
                else
                {
                    args.IsValid = true;
                }
            }
        }
    }

    private void ClearForm()
    {
        txtName.Text = string.Empty;
        txtQualification.Text = string.Empty;
        txtPhone.Text = string.Empty;
        txtEmail.Text = string.Empty;
        ddlSession.SelectedIndex = 0; // Set the dropdown selection to the first item
        txtRegistrationNo.Text = string.Empty;
        txtRegistrationYear.Text = string.Empty;
        txtRollNo.Text = string.Empty;
        txtCompany.Text = string.Empty;
        txtOccupation.Text = string.Empty;
        txtLinkedIn.Text = string.Empty;
        txtFacebook.Text = string.Empty;
        txtInstagram.Text = string.Empty;
        txtTwitter.Text = string.Empty;
        fileUpload.Attributes.Clear();
        lblMessage.Text = string.Empty;
    }
}
