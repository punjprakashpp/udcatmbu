using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class AddStudent : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            PopulateSessionDropdown();
        }
    }

    private void PopulateSessionDropdown()
    {
        ddlSession.Items.Add(new ListItem("--- Select Session ---", string.Empty));
        int currentYear = DateTime.Now.Year;

        for (int year = 2002; year <= currentYear; year++)
        {
            // Determine session length based on the year
            int sessionLength = year <= 2019 ? 3 : 2;
            string sessionDisplay = string.Format("{0} - {1}", year, year + sessionLength);

            // Add session with display text and value as start year
            ddlSession.Items.Add(new ListItem(sessionDisplay, sessionDisplay));
        }
    }

    protected void btnAddStudent_Click(object sender, EventArgs e)
    {
        // Validate all controls before processing
        if (Page.IsValid)
        {
            string session = ddlSession.SelectedValue;
            string rollNo = txtRollNo.Text.Trim();
            string regNo = txtRegNo.Text.Trim();
            string regYear = txtRegYear.Text.Trim();
            string firstName = txtFirstName.Text.Trim();
            string midName = txtMidName.Text.Trim();
            string lastName = txtLastName.Text.Trim();
            string gender = rdoMale.Checked ? "Male" : "Female";
            DateTime dob;

            if (!DateTime.TryParse(txtDOB.Text, out dob))
            {
                lblmsg.Text = "Invalid Date of Birth format.";
                lblmsg.ForeColor = System.Drawing.Color.Red;
                return;
            }

            // Define the connection string and insert command
            string connectionString = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;
            string query = "INSERT INTO Student (Session, RollNo, RegNo, RegYear, FirstName, MidName, LastName, Gender, DOB, EntryDate) " +
                           "VALUES (@Session, @RollNo, @RegNo, @RegYear, @FirstName, @MidName, @LastName, @Gender, @DOB, @EntryDate)";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    // Define parameters to prevent SQL Injection
                    cmd.Parameters.AddWithValue("@Session", session);
                    cmd.Parameters.AddWithValue("@RollNo", rollNo);
                    cmd.Parameters.AddWithValue("@RegNo", regNo);
                    cmd.Parameters.AddWithValue("@RegYear", regYear);
                    cmd.Parameters.AddWithValue("@FirstName", firstName);
                    cmd.Parameters.AddWithValue("@MidName", string.IsNullOrEmpty(midName) ? (object)DBNull.Value : midName);
                    cmd.Parameters.AddWithValue("@LastName", lastName);
                    cmd.Parameters.AddWithValue("@Gender", gender);
                    cmd.Parameters.AddWithValue("@DOB", dob);
                    cmd.Parameters.AddWithValue("@EntryDate", DateTime.Now);

                    try
                    {
                        con.Open();
                        cmd.ExecuteNonQuery();
                        lblmsg.Text = "Student added successfully!";
                        lblmsg.ForeColor = System.Drawing.Color.Green;
                        ClearForm();
                    }
                    catch (Exception ex)
                    {
                        lblmsg.Text = "Error: " + ex.Message;
                        lblmsg.ForeColor = System.Drawing.Color.Red;
                    }
                }
            }
        }
    }

    private void ClearForm()
    {
        ddlSession.SelectedIndex = 0;
        txtRollNo.Text = string.Empty;
        txtRegNo.Text = string.Empty;
        txtRegYear.Text = string.Empty;
        txtFirstName.Text = string.Empty;
        txtMidName.Text = string.Empty;
        txtLastName.Text = string.Empty;
        rdoMale.Checked = false;
        rdoFemale.Checked = false;
        txtDOB.Text = string.Empty;
    }
}
