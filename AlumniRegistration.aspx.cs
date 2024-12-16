using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Web.UI.WebControls;

public partial class pages_AlumniRegister : System.Web.UI.Page
{
    private string _studentID;
    private readonly string _connectionString = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            PopulateSessionDropdown();
        }
    }

    private void PopulateSessionDropdown()
    {
        ddlSession.Items.Clear();
        ddlSession.Items.Add(new ListItem("--- Select Session ---", string.Empty));

        string query = "SELECT DISTINCT Session FROM Student ORDER BY Session";

        using (SqlConnection conn = new SqlConnection(_connectionString))
        using (SqlCommand cmd = new SqlCommand(query, conn))
        {
            try
            {
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    string session = reader["Session"].ToString();
                    ddlSession.Items.Add(new ListItem(session, session));
                }
            }
            catch (Exception ex)
            {
                NotificationHelper.ShowNotification(this, "Error loading sessions: " + ex.Message, "error", "Error");
                ShowErrorMessage("Error loading sessions: " + ex.Message);
            }
        }
    }

    protected void btnVerify_Click(object sender, EventArgs e)
    {
        if (ValidateStudent())
        {
            if (CheckIfAlumniExists())
            {
                NotificationHelper.ShowNotification(this, "Alumni already registered.", "warning", "warning");
            }
            else
            {
                NotificationHelper.ShowNotification(this, "Verification Succesful.", "success", "Success");
                VerifyStudentPanel.Visible = false;
                RegisterAlumniPanel.Visible = true;
                LoadStudentDetails();
            }
        }
        else
        {
            NotificationHelper.ShowNotification(this, "No student found with the provided details.", "info", "info");
        }
    }

    private bool ValidateStudent()
    {
        string query = @"SELECT StudentID FROM Student WHERE RegNo = @RegNo AND RegYear = @RegYear 
                         AND RollNo = @RollNo AND DOB = @DOB AND Session = @Session";

        using (SqlConnection conn = new SqlConnection(_connectionString))
        using (SqlCommand cmd = new SqlCommand(query, conn))
        {
            cmd.Parameters.AddWithValue("@RegNo", txtRegistrationNo.Text.Trim());
            cmd.Parameters.AddWithValue("@RegYear", txtRegistrationYear.Text.Trim());
            cmd.Parameters.AddWithValue("@RollNo", txtRollNo.Text.Trim());
            cmd.Parameters.AddWithValue("@DOB", DateTime.Parse(txtDOB.Text.Trim()));
            cmd.Parameters.AddWithValue("@Session", ddlSession.SelectedValue);

            try
            {
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    _studentID = reader["StudentID"].ToString();
                    return true;
                }
            }
            catch (Exception ex)
            {
                NotificationHelper.ShowNotification(this, "Database error: " + ex.Message, "error", "Error");
                ShowErrorMessage("Database error: " + ex.Message);
            }
        }

        return false;
    }

    private bool CheckIfAlumniExists()
    {
        string query = "SELECT 1 FROM Alumni WHERE StudentID = @StudentID";

        using (SqlConnection conn = new SqlConnection(_connectionString))
        using (SqlCommand cmd = new SqlCommand(query, conn))
        {
            cmd.Parameters.AddWithValue("@StudentID", _studentID);

            try
            {
                conn.Open();
                return cmd.ExecuteReader().HasRows;
            }
            catch (Exception ex)
            {
                NotificationHelper.ShowNotification(this, "Error checking alumni status: " + ex.Message, "error", "Error");
                ShowErrorMessage("Error checking alumni status: " + ex.Message);
                return true;
            }
        }
    }

    private void LoadStudentDetails()
    {
        string query = "SELECT FirstName, MidName, LastName FROM Student WHERE StudentID = @StudentID";

        using (SqlConnection conn = new SqlConnection(_connectionString))
        using (SqlCommand cmd = new SqlCommand(query, conn))
        {
            cmd.Parameters.AddWithValue("@StudentID", _studentID);

            try
            {
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    txtFirstName.Text = reader["FirstName"].ToString();
                    txtMidName.Text = reader["MidName"].ToString();
                    txtLastName.Text = reader["LastName"].ToString();
                }
            }
            catch (Exception ex)
            {
                NotificationHelper.ShowNotification(this, "Error loading student details: " + ex.Message, "error", "Error");
                ShowErrorMessage("Error loading student details: " + ex.Message);
            }
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (!Page.IsValid) return;

        string FilePath = ProcessImageUpload() ?? "Image/default/default.jpg";
        txtPhone.Text = "+91 " + txtPhone.Text.Trim();

        string query = @"INSERT INTO Alumni 
                         (Session, StudentID, FirstName, MidName, LastName, Qualification, Phone, Email, Occupation, Company, LinkedIn, Facebook, Instagram, Twitter, FilePath, EntryDate) 
                         VALUES 
                         (@Session, @StudentID, @FirstName, @MidName, @LastName, @Qualification, @Phone, @Email, @Occupation, @Company, @LinkedIn, @Facebook, @Instagram, @Twitter, @FilePath, @EntryDate)";

        using (SqlConnection conn = new SqlConnection(_connectionString))
        using (SqlCommand cmd = new SqlCommand(query, conn))
        {
            cmd.Parameters.AddWithValue("@Session", ddlSession.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@StudentID", Convert.ToInt32(_studentID));
            cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text.Trim());
            cmd.Parameters.AddWithValue("@MidName", txtMidName.Text.Trim());
            cmd.Parameters.AddWithValue("@LastName", txtLastName.Text.Trim());
            cmd.Parameters.AddWithValue("@Qualification", txtQualification.Text.Trim());
            cmd.Parameters.AddWithValue("@Phone", txtPhone.Text.Trim());
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
            cmd.Parameters.AddWithValue("@Occupation", txtOccupation.Text);
            cmd.Parameters.AddWithValue("@Company", txtCompany.Text);
            cmd.Parameters.AddWithValue("@LinkedIn", txtLinkedIn.Text);
            cmd.Parameters.AddWithValue("@Facebook", txtFacebook.Text);
            cmd.Parameters.AddWithValue("@Instagram", txtInstagram.Text);
            cmd.Parameters.AddWithValue("@Twitter", txtTwitter.Text);
            cmd.Parameters.AddWithValue("@FilePath", FilePath);
            cmd.Parameters.AddWithValue("@EntryDate", DateTime.Now);

            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
                ClearForm();
                NotificationHelper.ShowNotification(this, "Alumni details saved successfully.", "success", "Success");
            }
            catch (Exception ex)
            {
                NotificationHelper.ShowNotification(this, "Error loading alumni details: " + ex.Message, "error", "Error");
                ShowErrorMessage("Error saving alumni details: " + ex.Message);
            }
        }
    }

    private string ProcessImageUpload()
    {
        if (fileUpload.HasFile)
        {
            string fileExtension = Path.GetExtension(fileUpload.FileName).ToLower();

            if (fileExtension == ".jpg" || fileExtension == ".jpeg" || fileExtension == ".png")
            {
                string fileName = Path.GetFileName(fileUpload.FileName);
                string folderPath = Server.MapPath("~/Image/alumni/");

                if (!Directory.Exists(folderPath))
                    Directory.CreateDirectory(folderPath);

                string fullPath = Path.Combine(folderPath, fileName);

                try
                {
                    string base64String = imagePreviewBase64.Value.Replace("data:image/png;base64,", "").Replace("data:image/jpeg;base64,", "");
                    byte[] imageBytes = Convert.FromBase64String(base64String);

                    using (MemoryStream ms = new MemoryStream(imageBytes))
                    using (Bitmap bmp = new Bitmap(ms))
                    {
                        bmp.Save(fullPath, ImageFormat.Png);
                    }

                    return "Image/alumni/" + fileName;
                }
                catch (Exception ex)
                {
                    NotificationHelper.ShowNotification(this, "Error processing image: " + ex.Message, "error", "Error");
                    ShowErrorMessage("Error processing image: " + ex.Message);
                }
            }
            else
            {
                NotificationHelper.ShowNotification(this, "Invalid file type. Only .jpg, .jpeg, and .png files are allowed.", "warning", "warning");
            }
        }

        return null;
    }

    private void ClearForm()
    {
        txtQualification.Text = txtPhone.Text = txtEmail.Text = txtRegistrationNo.Text = txtRegistrationYear.Text =
        txtRollNo.Text = txtCompany.Text = txtOccupation.Text = txtLinkedIn.Text = txtFacebook.Text = txtInstagram.Text =
        txtTwitter.Text = lblMessage.Text = txtFirstName.Text = txtMidName.Text = txtLastName.Text = txtDOB.Text = string.Empty;
        ddlSession.SelectedIndex = 0;
        VerifyStudentPanel.Visible = true;
        RegisterAlumniPanel.Visible = false;
        fileUpload.Attributes.Clear();
    }

    private void ShowErrorMessage(string message)
    {
        lblMessage.Text = message;
        lblMessage.ForeColor = Color.Red;
    }

    protected void btnReset_Click(object sender, EventArgs e)
    {
        _studentID = string.Empty;
        ClearForm();
    }
}
