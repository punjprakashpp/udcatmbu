using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class ManageStudents : System.Web.UI.Page
{
    private string connectionString = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadSessionDropdown();
            MultiView1.ActiveViewIndex = -1;
        }
        ClearMessage();
    }

    private void LoadSessionDropdown()
    {
        ddlSession.Items.Clear();
        ddlSessionDelete.Items.Clear();
        ddlSession.Items.Add(new ListItem("--- Select Session ---", string.Empty));
        ddlSessionDelete.Items.Add(new ListItem("--- Select Session ---", string.Empty));

        using (SqlConnection con = new SqlConnection(connectionString))
        {
            string query = "SELECT DISTINCT Session FROM Student ORDER BY Session";
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    ddlSession.Items.Add(new ListItem(reader["Session"].ToString(), reader["Session"].ToString()));
                    ddlSessionDelete.Items.Add(new ListItem(reader["Session"].ToString(), reader["Session"].ToString()));
                }
            }
        }
    }

    protected void btnDeleteSession_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(ddlSessionDelete.SelectedValue))
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM Student WHERE Session = @Session";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Session", ddlSessionDelete.SelectedValue);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    lblMessage.Text = "Session deleted successfully.";
                }
            }
            LoadSessionDropdown();
        }
    }

    private string GetConnectionString()
    {
        return ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;
    }

    private void ShowMessage(string message, bool isError)
    {
        lblMessage.Text = message;
        lblMessage.ForeColor = isError ? System.Drawing.Color.Red : System.Drawing.Color.Green;
    }

    private void ClearMessage()
    {
        lblMessage.Text = string.Empty;
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        ClearMessage();
        if (string.IsNullOrWhiteSpace(txtsearch.Text))
        {
            ShowMessage("Enter search criteria!", true);
            ClearGrid();
            return;
        }

        string searchCriteria = txtsearch.Text.Trim() + "%";
        string query = GetSearchQuery();

        if (string.IsNullOrEmpty(query))
        {
            ShowMessage("Please select a search option.", true);
            return;
        }

        using (SqlConnection connection = new SqlConnection(GetConnectionString()))
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
                ShowMessage("Error: " + ex.Message, true);
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
        GridView1.DataSource = studentTable;
        GridView1.DataBind();
        if (studentTable.Rows.Count > 0)
        {
            MultiView1.ActiveViewIndex = 0;
            ShowMessage(studentTable.Rows.Count + " Student(s) Found.", false);
        }
        else
        {
            MultiView1.ActiveViewIndex = -1;
            ShowMessage("No students found.", true);
        }
    }

    private void ClearGrid()
    {
        GridView1.DataSource = null;
        GridView1.DataBind();
        MultiView1.ActiveViewIndex = -1;
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "View")
        {
            ClearMessage();
            int studentId;
            if (int.TryParse(e.CommandArgument.ToString(), out studentId))
            {
                ShowStudentDetails(studentId);
            }
            else
            {
                ShowMessage("Invalid Student ID.", true);
            }
        }

        if (e.CommandName == "Remove")
        {
            int studentId;
            if (int.TryParse(e.CommandArgument.ToString(), out studentId))
            {
                RemoveStudent(studentId);
            }
            else
            {
                ShowMessage("Invalid Student ID.", true);
            }
        }
    }

    private void ShowStudentDetails(int studentId)
    {
        using (SqlConnection connection = new SqlConnection(GetConnectionString()))
        using (SqlCommand command = new SqlCommand("SELECT * FROM Student WHERE StudentID = @StudentID", connection))
        {
            command.Parameters.AddWithValue("@StudentID", studentId);

            try
            {
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                if (reader.Read())
                {
                    PopulateStudentDetails(reader);
                    MultiView1.ActiveViewIndex = 1;
                }
                else
                {
                    ShowMessage("Student details not found.", true);
                }
                reader.Close();
            }
            catch (Exception ex)
            {
                ShowMessage("Error: " + ex.Message, true);
            }
        }
    }

    private void PopulateStudentDetails(SqlDataReader reader)
    {
        lblSession.Text = reader["Session"] != DBNull.Value ? reader["Session"].ToString() : "N/A";
        lblRollNo.Text = reader["RollNo"] != DBNull.Value ? reader["RollNo"].ToString() : "N/A";
        lblRegNo.Text = reader["RegNo"] != DBNull.Value ? reader["RegNo"].ToString() : "N/A";
        lblRegYear.Text = reader["RegYear"] != DBNull.Value ? reader["RegYear"].ToString() : "N/A";
        lblFirstName.Text = reader["FirstName"] != DBNull.Value ? reader["FirstName"].ToString() : "N/A";
        lblMidName.Text = reader["MidName"] != DBNull.Value ? reader["MidName"].ToString() : string.Empty;
        lblLastName.Text = reader["LastName"] != DBNull.Value ? reader["LastName"].ToString() : "N/A";
        lblGen.Text = reader["Gender"] != DBNull.Value ? reader["Gender"].ToString() : "N/A";

        if (reader["dob"] != DBNull.Value)
        {
            DateTime dob;
            if (DateTime.TryParse(reader["dob"].ToString(), out dob))
            {
                lbldob.Text = dob.ToString("dd MMM yyyy");
            }
            else
            {
                lbldob.Text = "N/A";
            }
        }
        else
        {
            lbldob.Text = "N/A";
        }
    }

    private void RemoveStudent(int studentId)
    {
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            string query = "DELETE FROM Student WHERE StudentID = @StudentID";
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@StudentID", studentId);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }
        ShowMessage("Student removed successfully.", false);
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 0;
        ClearMessage();
    }

    protected void btnReset_Click(object sender, EventArgs e)
    {
        ddlSession.SelectedIndex = 0;
        rdRoll.Checked = true;
        txtsearch.Text = string.Empty;
    }
}
