using System;
using System.IO;
using System.Text.RegularExpressions;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_pages_UploadFiles : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            PopulateSessionDropdown();
            populateSemesterDropdown();
            ToggleSessionDropdown();
        }
    }

    private void populateSemesterDropdown()
    {
        ddlSemester.Items.Add(new ListItem("--- Select-Semester ---", string.Empty));
        ddlSemester.Items.Add(new ListItem("Semester 1", "Semester-1"));
        ddlSemester.Items.Add(new ListItem("Semester 2", "Semester-2"));
        ddlSemester.Items.Add(new ListItem("Semester 3", "Semester-3"));
        ddlSemester.Items.Add(new ListItem("Semester 4", "Semester-4"));
    }

    private void PopulateSessionDropdown()
    {
        ddlSession.Items.Add(new ListItem("--- Select-Session ---", string.Empty));
        int currentYear = DateTime.Now.Year;
        for (int year = 2020; year <= currentYear; year++)
        {
            if (year > 2019 && year <= currentYear - 2)
                ddlSession.Items.Add(new ListItem(year.ToString() + " - " + (year + 2).ToString(), year.ToString() + "-" + (year + 2).ToString()));
        }
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        Response.Redirect("DeleteFiles.aspx");
    }

    protected void btnUpload_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            string originalFileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
            string fileType = ddlDownloadType.SelectedValue;
            string semester = ddlSemester.SelectedValue;
            string session = ddlSession.SelectedValue;

            // Extract the file extension from the original file name
            string fileExtension = Path.GetExtension(originalFileName);

            // Create a new file name using the combined values and retain the original file extension
            string newFileName = fileType + "_" + semester + "_" + session + fileExtension;

            // Remove consecutive underscores from the new file name
            newFileName = RemoveConsecutiveUnderscores(newFileName);

            if (fileType == "Other")
            {
                newFileName = originalFileName;
            }

            string folderPath = Server.MapPath("~/docs/Files/");

            // Ensure the directory exists
            if (!Directory.Exists(folderPath))
            {
                Directory.CreateDirectory(folderPath);
            }

            string filePath = Path.Combine(folderPath, newFileName);
            FileUpload1.SaveAs(filePath);

            string relativeFilePath = "docs/Files/" + newFileName;

            string connectionString = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Files (FileName, FileType, Semester, Session, FilePath) VALUES (@FileName, @FileType, @Semester, @Session, @FilePath)";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@FileName", newFileName);
                    cmd.Parameters.AddWithValue("@FileType", fileType);
                    cmd.Parameters.AddWithValue("@Semester", semester);
                    cmd.Parameters.AddWithValue("@Session", session);
                    cmd.Parameters.AddWithValue("@FilePath", relativeFilePath);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
            }

            lblMessage.Text = "File uploaded successfully!";
        }
        else
        {
            lblMessage.Text = "Please select a file to upload.";
        }
    }

    public static string RemoveConsecutiveUnderscores(string input)
    {
        return Regex.Replace(input, "_{2,}", "_");
    }


    protected void ddlDownloadType_SelectedIndexChanged(object sender, EventArgs e)
    {
        ToggleSessionDropdown();
    }

    private void ToggleSessionDropdown()
    {
        if (ddlDownloadType.SelectedValue == "Syllabus")
        {
            ddlSession.Enabled = false;
            ddlSession.SelectedIndex = 0; // Reset to default value
            ddlSemester.Enabled = true;
        }
        else if (ddlDownloadType.SelectedValue == "Other")
        {
            ddlSession.Enabled = false;
            ddlSemester.Enabled = false;
        }
        else
        {
            ddlSession.Enabled = true;
            ddlSemester.Enabled = true;
        }
        ddlSession.SelectedIndex = 0; // Reset to default value
        ddlSemester.SelectedIndex = 0; // Reset to default value
    }
}
