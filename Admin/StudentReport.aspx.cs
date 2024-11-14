using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class Studenteport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            MultiView1.ActiveViewIndex = -1;
        }
        ClearMessage();
    }

    private string GetConnectionString()
    {
        return ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;
    }

    private void ShowMessage(string message, bool isError = false)
    {
        lblmsg.Text = message;
        lblmsg.ForeColor = isError ? System.Drawing.Color.Red : System.Drawing.Color.Green;
    }

    private void ClearMessage()
    {
        lblmsg.Text = string.Empty;
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
            ShowMessage(studentTable.Rows.Count + " Student(s) Found.");
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
        lblMidName.Text = reader["MidName"] != DBNull.Value ? reader["MidName"].ToString() : "";
        lblLastName.Text = reader["LastName"] != DBNull.Value ? reader["LastName"].ToString() : "N/A";
        lblGen.Text = reader["Gender"] != DBNull.Value ? reader["Gender"].ToString() : "N/A";

        if (reader["dob"] != DBNull.Value)
        {
            DateTime dob = Convert.ToDateTime(reader["dob"]);
            lbldob.Text = dob.ToString("dd MMM yyyy");
        }
        else
        {
            lbldob.Text = "N/A";
        }
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 0;
        ClearMessage();
    }
}