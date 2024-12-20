using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI.WebControls;

public partial class ManageAlumni : System.Web.UI.Page
{
    private string connectionString = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;

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
            LoadSessionDropdown();
            MultiView1.ActiveViewIndex = -1;
        }
        ClearMessage();
    }

    private void LoadSessionDropdown()
    {
        ddlSession.Items.Clear();
        ddlSessionUpdate.Items.Clear();
        ddlSession.Items.Add(new ListItem("--- Select Session ---", string.Empty));
        ddlSessionUpdate.Items.Add(new ListItem("--- Select Session ---", string.Empty));

        using (SqlConnection con = new SqlConnection(connectionString))
        {
            string query = "SELECT DISTINCT Session FROM Alumni ORDER BY Session";
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                con.Open();
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        string sessionValue = reader["Session"].ToString();
                        ddlSession.Items.Add(new ListItem(sessionValue, sessionValue));
                        ddlSessionUpdate.Items.Add(new ListItem(sessionValue, sessionValue));
                    }
                }
            }
        }
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

        string session = ddlSession.SelectedValue;
        string searchCriteria = txtsearch.Text.Trim() + "%";

        string query = "SELECT StudentID, Session, FirstName, MidName, LastName " +
                       "FROM Alumni WHERE Session = @Session AND FirstName LIKE @SearchParam";

        using (SqlConnection connection = new SqlConnection(connectionString))
        using (SqlDataAdapter adapter = new SqlDataAdapter(query, connection))
        {
            adapter.SelectCommand.Parameters.AddWithValue("@Session", session);
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

    private void BindGridData(DataTable studentTable)
    {
        GridView1.DataSource = studentTable;
        GridView1.DataBind();

        if (studentTable.Rows.Count > 0)
        {
            MultiView1.ActiveViewIndex = 0;
            ShowMessage(String.Format("{0} Alumni(s) Found.", studentTable.Rows.Count), false);
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
        if (e.CommandName == "Manage")
        {
            ClearMessage();

            int studentId;
            if (int.TryParse(e.CommandArgument.ToString(), out studentId))
            {
                StudentID = studentId.ToString();
                ShowStudentDetails(studentId);
            }
            else
            {
                ShowMessage("Invalid Alumni ID.", true);
            }
        }
    }

    private void ShowStudentDetails(int studentId)
    {
        string query = "SELECT * FROM Alumni WHERE StudentID = @StudentID";

        using (SqlConnection connection = new SqlConnection(connectionString))
        using (SqlCommand command = new SqlCommand(query, connection))
        {
            command.Parameters.AddWithValue("@StudentID", studentId);

            try
            {
                connection.Open();
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        ddlSessionUpdate.SelectedValue = reader["Session"].ToString();
                        txtFirstName.Text = reader["FirstName"].ToString();
                        txtMidName.Text = reader["MidName"].ToString();
                        txtLastName.Text = reader["LastName"].ToString();
                        txtQualification.Text = reader["Qualification"].ToString();
                        txtOccupation.Text = reader["Occupation"].ToString();
                        txtCompany.Text = reader["Company"].ToString();
                        txtPhone.Text = reader["Phone"].ToString();
                        txtEmail.Text = reader["Email"].ToString();
                        MultiView1.ActiveViewIndex = 1;
                    }
                    else
                    {
                        ShowMessage("Alumni details not found.", true);
                    }
                }
            }
            catch (Exception ex)
            {
                ShowMessage("Error: " + ex.Message, true);
            }
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            string query = @"
            UPDATE Alumni
            SET 
                Session = @Session,
                FirstName = @FirstName,
                MidName = @MidName,
                LastName = @LastName,
                Qualification = @Qualification,
                Occupation = @Occupation,
                Company = @Company,
                Phone = @Phone,
                Email = @Email
            WHERE StudentID = @StudentID";

            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@Session", ddlSessionUpdate.SelectedValue);
                cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text.Trim());
                cmd.Parameters.AddWithValue("@MidName", txtMidName.Text.Trim());
                cmd.Parameters.AddWithValue("@LastName", txtLastName.Text.Trim());
                cmd.Parameters.AddWithValue("@Qualification", txtQualification.Text.Trim());
                cmd.Parameters.AddWithValue("@Occupation", txtOccupation.Text.Trim());
                cmd.Parameters.AddWithValue("@Company", txtCompany.Text.Trim());
                cmd.Parameters.AddWithValue("@Phone", txtPhone.Text.Trim());
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@StudentID", Convert.ToInt32(StudentID));

                try
                {
                    con.Open();
                    int rowsAffected = cmd.ExecuteNonQuery();
                    if (rowsAffected > 0)
                    {
                        ShowMessage("Alumni details updated successfully.", false);
                    }
                    else
                    {
                        ShowMessage("No changes were made.", true);
                    }
                }
                catch (Exception ex)
                {
                    ShowMessage("Error updating student details: " + ex.Message, true);
                }
            }
        }
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        string filePath = null;

        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            string query = "SELECT FilePath FROM Alumni WHERE StudentID = @StudentID";
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@StudentID", StudentID);
                conn.Open();
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        filePath = reader["FilePath"].ToString();
                    }
                }
            }
        }

        string deleteQuery = "DELETE FROM Alumni WHERE StudentID = @StudentID";

        using (SqlConnection con = new SqlConnection(connectionString))
        using (SqlCommand cmd = new SqlCommand(deleteQuery, con))
        {
            cmd.Parameters.AddWithValue("@StudentID", StudentID);

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                ShowMessage("Alumni removed successfully.", false);
            }
            catch (Exception ex)
            {
                ShowMessage("Error: " + ex.Message, true);
            }
        }

        if (!string.IsNullOrEmpty(filePath))
        {
            string fullPath = Server.MapPath("~/" + filePath);
            if (File.Exists(fullPath))
            {
                File.Delete(fullPath);
            }
        }
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 0;
        ClearMessage();
    }

    protected void btnReset_Click(object sender, EventArgs e)
    {
        ddlSession.SelectedIndex = 0;
        txtsearch.Text = string.Empty;
    }
}
