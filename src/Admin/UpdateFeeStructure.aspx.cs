using System;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_pages_UpdateFeeStructure : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadSemesterDropdown();
        }
    }

    protected void LoadSemesterDropdown()
    {
        // Load semester data into the dropdown list from the database
        string connectionString = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();
            SqlCommand command = new SqlCommand("SELECT Semester FROM [dbo].[Fee]", connection);
            SqlDataReader reader = command.ExecuteReader();
            ddlSemester.DataSource = reader;
            ddlSemester.DataTextField = "Semester";
            ddlSemester.DataValueField = "Semester";
            ddlSemester.DataBind();
        }
        ddlSemester.Items.Insert(0, new ListItem("--Select Semester--", "0"));
    }

    protected void ddlSemester_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlSemester.SelectedValue != "Semester-1")
        {
            txtAdmission.Enabled = false;
        }
        else
        {
            txtAdmission.Enabled = true;
        }
        // Fetch and display data for the selected semester
        if (ddlSemester.SelectedValue != "0")
        {
            string connectionString = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand("SELECT Admission, Academic, Computer, Miscellaneous, Examination, Total FROM [dbo].[Fee] WHERE Semester = @Semester", connection);
                command.Parameters.AddWithValue("@Semester", ddlSemester.SelectedValue);
                SqlDataReader reader = command.ExecuteReader();
                if (reader.Read())
                {
                    txtAdmission.Text = reader["Admission"].ToString();
                    txtAcademic.Text = reader["Academic"].ToString();
                    txtComputer.Text = reader["Computer"].ToString();
                    txtMiscellaneous.Text = reader["Miscellaneous"].ToString();
                    txtExamination.Text = reader["Examination"].ToString();
                    txtTotal.Text = reader["Total"].ToString();
                }
                else
                {
                    clear_text();
                    lblMessage.Text = "No data found for the selected semester.";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
        else
        {
            clear_text();
        }
    }

    protected void clear_text()
    {
        txtAdmission.Text = "";
        txtAcademic.Text = "";
        txtComputer.Text = "";
        txtMiscellaneous.Text = "";
        txtExamination.Text = "";
        txtTotal.Text = "";
        txtAdmission.Focus();
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            // Replace empty values with 0
            decimal admission = string.IsNullOrEmpty(txtAdmission.Text) ? 0 : decimal.Parse(txtAdmission.Text);
            decimal academic = string.IsNullOrEmpty(txtAcademic.Text) ? 0 : decimal.Parse(txtAcademic.Text);
            decimal computer = string.IsNullOrEmpty(txtComputer.Text) ? 0 : decimal.Parse(txtComputer.Text);
            decimal miscellaneous = string.IsNullOrEmpty(txtMiscellaneous.Text) ? 0 : decimal.Parse(txtMiscellaneous.Text);
            decimal examination = string.IsNullOrEmpty(txtExamination.Text) ? 0 : decimal.Parse(txtExamination.Text);

            // Calculate total
            decimal total = admission + academic + computer + miscellaneous + examination;

            // Set total value
            txtTotal.Text = total.ToString("0.00");

            // Check if a fee structure already exists for the selected semester
            SqlCommand checkCommand = new SqlCommand("SELECT COUNT(*) FROM [dbo].[Fee] WHERE Semester = @Semester", connection);
            checkCommand.Parameters.AddWithValue("@Semester", ddlSemester.SelectedValue);
            int count = (int)checkCommand.ExecuteScalar();

            if (count > 0)
            {
                // Update existing fee structure
                SqlCommand updateCommand = new SqlCommand("UPDATE [dbo].[Fee] SET Admission = @Admission, Academic = @Academic, Computer = @Computer, Miscellaneous = @Miscellaneous, Examination = @Examination, Total = @Total WHERE Semester = @Semester", connection);
                updateCommand.Parameters.AddWithValue("@Semester", ddlSemester.SelectedValue);
                updateCommand.Parameters.AddWithValue("@Admission", txtAdmission.Text);
                updateCommand.Parameters.AddWithValue("@Academic", txtAcademic.Text);
                updateCommand.Parameters.AddWithValue("@Computer", txtComputer.Text);
                updateCommand.Parameters.AddWithValue("@Miscellaneous", txtMiscellaneous.Text);
                updateCommand.Parameters.AddWithValue("@Examination", txtExamination.Text);
                updateCommand.Parameters.AddWithValue("@Total", txtTotal.Text);

                updateCommand.ExecuteNonQuery();
                lblMessage.Text = "Fee Structure uploaded successfully!";
                lblMessage.ForeColor = System.Drawing.Color.Green;
                clear_text();
            }
            else
            {
                // Insert new fee structure
                SqlCommand insertCommand = new SqlCommand("INSERT INTO [dbo].[Fee] (Semester, Admission, Academic, Computer, Miscellaneous, Examination, Total) VALUES (@Semester, @Admission, @Academic, @Computer, @Miscellaneous, @Examination, @Total)", connection);
                insertCommand.Parameters.AddWithValue("@Semester", ddlSemester.SelectedValue);
                insertCommand.Parameters.AddWithValue("@Admission", txtAdmission.Text);
                insertCommand.Parameters.AddWithValue("@Academic", txtAcademic.Text);
                insertCommand.Parameters.AddWithValue("@Computer", txtComputer.Text);
                insertCommand.Parameters.AddWithValue("@Miscellaneous", txtMiscellaneous.Text);
                insertCommand.Parameters.AddWithValue("@Examination", txtExamination.Text);
                insertCommand.Parameters.AddWithValue("@Total", txtTotal.Text);

                insertCommand.ExecuteNonQuery();
                lblMessage.Text = "Fee Structure Inserted successfully!";
                lblMessage.ForeColor = System.Drawing.Color.Green;
                clear_text();
            }
        }
    }
}
