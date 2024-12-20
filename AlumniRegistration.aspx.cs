using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.UI.WebControls;

public partial class AlumniRegistration : System.Web.UI.Page
{
    private string connectionString = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadSessions();
        }
    }

    protected void btnResetVerify_Click(object sender, EventArgs e)
    {
        ddlSession.SelectedIndex=0;
        txtRollNo.Text = txtRegistrationNo.Text = txtRegistrationYear.Text = txtDOB.Text = string.Empty;
        RegisterAlumniPanel.Visible = false;
    }

    private void LoadSessions()
    {
        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            string query = "SELECT DISTINCT [Session] FROM [Student]";
            SqlDataAdapter da = new SqlDataAdapter(query, conn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            ddlSession.DataSource = dt;
            ddlSession.DataTextField = "Session";
            ddlSession.DataValueField = "Session";
            ddlSession.DataBind();
            ddlSession.Items.Insert(0, new ListItem("Select Session", ""));
        }
    }

    protected void btnVerifyStudent_Click(object sender, EventArgs e)
    {
        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            string query = "SELECT * FROM [Student] WHERE [Session] = @Session AND [RollNo] = @RollNo AND [RegNo] = @RegNo AND [RegYear] = @RegYear AND [DOB] = @DOB";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@Session", ddlSession.SelectedValue);
            cmd.Parameters.AddWithValue("@RollNo", txtRollNo.Text);
            cmd.Parameters.AddWithValue("@RegNo", txtRegistrationNo.Text);
            cmd.Parameters.AddWithValue("@RegYear", txtRegistrationYear.Text);
            cmd.Parameters.AddWithValue("@DOB", DateTime.ParseExact(txtDOB.Text, "dd-MM-yyyy", null));

            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                if (reader.Read())
                {
                    ViewState["StudentID"] = reader["StudentID"].ToString();
                    if(VerifyAlumni())
                    {
                        txtFirstName.Text = reader["FirstName"].ToString();
                        txtMidName.Text = reader["MidName"].ToString();
                        txtLastName.Text = reader["LastName"].ToString();
                        RegisterAlumniPanel.Visible = true;
                        VerifyStudentPanel.Visible = false;
                        lblMessage.Text = "Verification Successful.";
                        NotificationHelper.ShowNotification(this, "Verification Successful.", "success", "success");
                    }
                    else
                    {
                        NotificationHelper.ShowNotification(this, "Alumni already Registered.", "warning", "warning");
                        lblMessage.Text = "Alumni already Registered.";
                    }
                    
                }
            }
            else
            {
                NotificationHelper.ShowNotification(this, "Verification failed. Please check your details.", "error", "error");
                lblMessage.Text = "Verification failed. Please check your details.";
            }
        }
    }

    protected bool VerifyAlumni()
    {
        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            string query = "SELECT * FROM [Alumni] WHERE [StudentID] = @StudentID";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@StudentID", Convert.ToInt32(ViewState["StudentID"]));
            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                return false;
            }
            else
            {
                return true;
            }
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        string filePath = SaveFile();

        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            string query = @"INSERT INTO [Alumni] ([StudentID], [Session], [FirstName], [MidName], [LastName], [Qualification], [Occupation], [Company], [Phone], [Email], [LinkedIn], [Facebook], [Instagram], [Twitter], [FilePath], [EntryDate]) 
                             VALUES (@StudentID, @Session, @FirstName, @MidName, @LastName, @Qualification, @Occupation, @Company, @Phone, @Email, @LinkedIn, @Facebook, @Instagram, @Twitter, @FilePath, @EntryDate)";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@StudentID", Convert.ToInt32(ViewState["StudentID"]));
            cmd.Parameters.AddWithValue("@Session", ddlSession.SelectedValue);
            cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text);
            cmd.Parameters.AddWithValue("@MidName", txtMidName.Text);
            cmd.Parameters.AddWithValue("@LastName", txtLastName.Text);
            cmd.Parameters.AddWithValue("@Qualification", txtQualification.Text);
            cmd.Parameters.AddWithValue("@Occupation", txtOccupation.Text);
            cmd.Parameters.AddWithValue("@Company", txtCompany.Text);
            cmd.Parameters.AddWithValue("@Phone", txtPhone.Text);
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
            cmd.Parameters.AddWithValue("@LinkedIn", txtLinkedIn.Text);
            cmd.Parameters.AddWithValue("@Facebook", txtFacebook.Text);
            cmd.Parameters.AddWithValue("@Instagram", txtInstagram.Text);
            cmd.Parameters.AddWithValue("@Twitter", txtTwitter.Text);
            cmd.Parameters.AddWithValue("@FilePath", filePath);
            cmd.Parameters.AddWithValue("@EntryDate", DateTime.Now);

            conn.Open();
            cmd.ExecuteNonQuery();
            lblMessage.Text = "Alumni details saved successfully!";
            NotificationHelper.ShowNotification(this, "Alumni details saved successfully!", "success", "success");
        }
    }

    private string SaveFile()
    {
        if (fileUpload.HasFile)
        {
            string fileName = Path.GetFileName(fileUpload.PostedFile.FileName);
            string fileExtension = Path.GetExtension(fileName);
            string[] allowedExtensions = { ".jpg", ".jpeg", ".png" };

            if (Array.Exists(allowedExtensions, ext => ext.Equals(fileExtension, StringComparison.OrdinalIgnoreCase)))
            {
                try
                {
                    string uniqueFileName = Guid.NewGuid().ToString() + fileExtension;
                    string filePath = "Uploads/alumni/" + uniqueFileName;
                    string serverPath = Server.MapPath(filePath);

                    // Compress and save the image
                    using (System.Drawing.Image originalImage = System.Drawing.Image.FromStream(fileUpload.PostedFile.InputStream))
                    {
                        int maxWidth = 300; // Set your desired maximum width
                        int maxHeight = 300; // Set your desired maximum height

                        int newWidth, newHeight;
                        CalculateNewDimensions(originalImage.Width, originalImage.Height, maxWidth, maxHeight, out newWidth, out newHeight);

                        using (System.Drawing.Bitmap compressedImage = new System.Drawing.Bitmap(originalImage, newWidth, newHeight))
                        {
                            // Save with compression
                            System.Drawing.Imaging.ImageCodecInfo jpegCodec = GetEncoder(System.Drawing.Imaging.ImageFormat.Jpeg);
                            if (jpegCodec != null)
                            {
                                var encoderParams = new System.Drawing.Imaging.EncoderParameters(1);
                                encoderParams.Param[0] = new System.Drawing.Imaging.EncoderParameter(System.Drawing.Imaging.Encoder.Quality, 75L); // Set quality to 75
                                compressedImage.Save(serverPath, jpegCodec, encoderParams);
                            }
                            else
                            {
                                // Fallback to saving without explicit compression
                                compressedImage.Save(serverPath);
                            }
                        }
                    }

                    return filePath;
                }
                catch (Exception ex)
                {
                    // Log the exception or display a user-friendly message
                    NotificationHelper.ShowNotification(this, "An error occurred while processing the file.", "error", "error");
                    lblFileTypeError.Text = "An error occurred while processing the file.";
                    lblFileTypeError.Visible = true;
                }
            }
            else
            {
                NotificationHelper.ShowNotification(this, "Only JPG, JPEG, and PNG files are allowed.", "error", "error");
                lblFileTypeError.Text = "Only JPG, JPEG, and PNG files are allowed.";
                lblFileTypeError.Visible = true;
            }
        }
        return null;
    }

    // Helper to calculate new dimensions while maintaining aspect ratio
    private void CalculateNewDimensions(int originalWidth, int originalHeight, int maxWidth, int maxHeight, out int newWidth, out int newHeight)
    {
        double aspectRatio = (double)originalWidth / originalHeight;

        if (originalWidth > maxWidth || originalHeight > maxHeight)
        {
            if (aspectRatio > 1) // Landscape
            {
                newWidth = maxWidth;
                newHeight = (int)(maxWidth / aspectRatio);
            }
            else // Portrait or square
            {
                newHeight = maxHeight;
                newWidth = (int)(maxHeight * aspectRatio);
            }
        }
        else
        {
            // Use original dimensions if within limits
            newWidth = originalWidth;
            newHeight = originalHeight;
        }
    }

    // Helper to get encoder for a specific image format
    private System.Drawing.Imaging.ImageCodecInfo GetEncoder(System.Drawing.Imaging.ImageFormat format)
    {
        foreach (var codec in System.Drawing.Imaging.ImageCodecInfo.GetImageDecoders())
        {
            if (codec.FormatID == format.Guid)
            {
                return codec;
            }
        }
        return null;
    }
}
