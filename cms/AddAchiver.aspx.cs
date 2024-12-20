using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Web.UI.WebControls;

public partial class AddAchiver : System.Web.UI.Page
{
    private string _connectionString = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;

    private string StudentID
    {
        get
        {
            return ViewState["StudentID"] != null ? ViewState["StudentID"].ToString() : string.Empty;
        }
        set
        {
            ViewState["StudentID"] = value;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            PopulateSessionDropdown();
            MultiViewStudent.ActiveViewIndex = -1;
        }
        lblMessage.Text = string.Empty;
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
                ShowErrorMessage("Error loading sessions: " + ex.Message);
            }
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrWhiteSpace(txtsearch.Text))
        {
            lblMessage.Text = "Enter search criteria!";
            ClearGrid();
            return;
        }

        string searchCriteria = txtsearch.Text.Trim() + "%";
        string query = GetSearchQuery();

        if (string.IsNullOrEmpty(query))
        {
            lblMessage.Text = "Please select a search option.";
            return;
        }

        using (SqlConnection connection = new SqlConnection(_connectionString))
        using (SqlDataAdapter adapter = new SqlDataAdapter(query, connection))
        {
            adapter.SelectCommand.Parameters.AddWithValue("@SearchParam", searchCriteria);
            DataTable studentTable = new DataTable();

            try
            {
                connection.Open();
                adapter.Fill(studentTable);
                BindGridData(studentTable);
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
                ClearGrid();
            }
        }
    }

    private string GetSearchQuery()
    {
        if (rdRoll.Checked)
            return "SELECT StudentID, Session, RollNo, RegNo, RegYear, FirstName, MidName, LastName FROM Student WHERE RollNo LIKE @SearchParam";
        if (rdName.Checked)
            return "SELECT StudentID, Session, RollNo, RegNo, RegYear, FirstName, MidName, LastName FROM Student WHERE FirstName LIKE @SearchParam";

        return string.Empty;
    }

    private void BindGridData(DataTable studentTable)
    {
        GridViewStudent.DataSource = studentTable;
        GridViewStudent.DataBind();
        if (studentTable.Rows.Count > 0)
        {
            MultiViewStudent.ActiveViewIndex = 0;
            lblMessage.Text = String.Format("{0} Student(s) Found.", studentTable.Rows.Count);
        }
        else
        {
            MultiViewStudent.ActiveViewIndex = -1;
            lblMessage.Text = "No students found.";
        }
    }

    private void ClearGrid()
    {
        GridViewStudent.DataSource = null;
        GridViewStudent.DataBind();
        MultiViewStudent.ActiveViewIndex = -1;
    }

    protected void GridViewStudent_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "View")
        {
            int studentID;
            if (int.TryParse(e.CommandArgument.ToString(), out studentID))
            {
                StudentID = studentID.ToString();
                ShowStudentDetails(studentID);
            }
            else
            {
                ShowErrorMessage("Invalid Student ID.");
            }
        }
    }

    private void ShowStudentDetails(int studentId)
    {
        string query = "SELECT * FROM Student WHERE StudentID = @StudentID";

        using (SqlConnection connection = new SqlConnection(_connectionString))
        using (SqlCommand command = new SqlCommand(query, connection))
        {
            command.Parameters.AddWithValue("@StudentID", studentId);

            try
            {
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                if (reader.Read())
                {
                    LoadStudentDetails();
                    MultiViewStudent.ActiveViewIndex = 1;
                }
                else
                {
                    ShowErrorMessage("Student details not found.");
                }
            }
            catch (Exception ex)
            {
                ShowErrorMessage("Error: " + ex.Message);
            }
        }
    }

    private void LoadStudentDetails()
    {
        string query = "SELECT FirstName, MidName, LastName FROM Student WHERE StudentID = @StudentID";

        using (SqlConnection conn = new SqlConnection(_connectionString))
        using (SqlCommand cmd = new SqlCommand(query, conn))
        {
            cmd.Parameters.AddWithValue("@StudentID", StudentID);

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
                ShowErrorMessage("Error loading student details: " + ex.Message);
            }
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (!Page.IsValid) return;

        // Validation for required fields
        if (string.IsNullOrWhiteSpace(txtFirstName.Text) || string.IsNullOrWhiteSpace(txtLastName.Text) || ddlSession.SelectedIndex == 0)
        {
            ShowErrorMessage("Please fill all required fields.");
            return;
        }

        // Process image upload
        string filePath = ProcessImageUpload() ?? "Image/default/default.jpg";

        // Validation for phone number (ensure it's in the correct format)
        txtPhone.Text = "+91 " + txtPhone.Text.Trim();

        // Save student achiever details
        string query = @"INSERT INTO [Achiver] ([StudentID], [Session], [FirstName], [MidName], [LastName], [Achivement], [Qualification], [Occupation], [Company], [Phone], [Email], [FilePath], [EntryDate]) 
                             VALUES (@StudentID, @Session, @FirstName, @MidName, @LastName, @Qualification, @Achivement, @Occupation, @Company, @Phone, @Email, @FilePath, @EntryDate)";


        using (SqlConnection conn = new SqlConnection(_connectionString))
        using (SqlCommand cmd = new SqlCommand(query, conn))
        {
            cmd.Parameters.AddWithValue("@Session", ddlSession.SelectedValue);
            cmd.Parameters.AddWithValue("@StudentID", Convert.ToInt32(StudentID));
            cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text.Trim());
            cmd.Parameters.AddWithValue("@MidName", txtMidName.Text.Trim());
            cmd.Parameters.AddWithValue("@LastName", txtLastName.Text.Trim());
            cmd.Parameters.AddWithValue("@Achivement", txtAchivement.Text.Trim());
            cmd.Parameters.AddWithValue("@Qualification", txtQualification.Text.Trim());
            cmd.Parameters.AddWithValue("@Phone", txtPhone.Text.Trim());
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
            cmd.Parameters.AddWithValue("@Occupation", txtOccupation.Text);
            cmd.Parameters.AddWithValue("@Company", txtCompany.Text);
            cmd.Parameters.AddWithValue("@FilePath", filePath); 
            cmd.Parameters.AddWithValue("@EntryDate", DateTime.Now);

            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
                ClearForm();
                lblMessage.Text = "Achiever details saved successfully!";
                lblMessage.ForeColor = Color.Green;
            }
            catch (Exception ex)
            {
                ShowErrorMessage("Error saving achiever details: " + ex.Message);
            }
        }
    }

    private string ProcessImageUpload()
    {
        if (fileUpload.HasFile)
        {
            string fileExtension = Path.GetExtension(fileUpload.FileName).ToLower();

            // File size validation (max 2MB)
            if (fileUpload.PostedFile.ContentLength > 2097152)
            {
                ShowErrorMessage("File size exceeds 2MB limit.");
                return null;
            }

            if (fileExtension == ".jpg" || fileExtension == ".jpeg" || fileExtension == ".png")
            {
                string fileName = Guid.NewGuid().ToString() + fileExtension;
                string folderPath = Server.MapPath("~/Uploads/achiver/");
                Directory.CreateDirectory(folderPath);

                string fullPath = Path.Combine(folderPath, fileName);

                try
                {
                    if (string.IsNullOrEmpty(imagePreviewBase64.Value))
                        throw new Exception("Image preview data is missing.");

                    string base64String = imagePreviewBase64.Value.Replace("data:image/png;base64,", "").Replace("data:image/jpeg;base64,", "");
                    byte[] imageBytes = Convert.FromBase64String(base64String);

                    using (MemoryStream ms = new MemoryStream(imageBytes))
                    using (Bitmap bmp = new Bitmap(ms))
                    {
                        bmp.Save(fullPath, ImageFormat.Png);
                    }

                    return "Uploads/achiver/" + fileName;
                }
                catch (Exception ex)
                {
                    ShowErrorMessage("Error processing image: " + ex.Message);
                }
            }
            else
            {
                ShowErrorMessage("Invalid file type. Only .jpg, .jpeg, and .png files are allowed.");
            }
        }
        return null;
    }

    private void ClearForm()
    {
        txtAchivement.Text = txtQualification.Text = txtPhone.Text = txtEmail.Text = txtCompany.Text = txtOccupation.Text = 
        lblMessage.Text = txtFirstName.Text = txtMidName.Text = txtLastName.Text  = string.Empty;
        ddlSession.SelectedIndex = 0;
        fileUpload.Attributes.Clear();
    }

    private void ShowErrorMessage(string message)
    {
        lblMessage.Text = message;
        lblMessage.ForeColor = Color.Red;
    }

    protected void btnReset_Click(object sender, EventArgs e)
    {
        StudentID = string.Empty;
        ClearForm();
    }
}
