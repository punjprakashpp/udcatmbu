using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

public partial class Librarian_RemoveStudent : System.Web.UI.Page
{
    private string connectionString = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadSessionDropdown();
        }
    }

    private void LoadSessionDropdown()
    {
        ddlSession.Items.Clear();
        ddlSession.Items.Add(new ListItem("--- Select Session ---", string.Empty));

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
                }
            }
        }
    }

    protected void btnRemSem_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(ddlSession.SelectedValue))
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM Student WHERE Session = @Session";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Session", ddlSession.SelectedValue);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    lblmsg.Text = "Session deleted successfully.";
                }
            }
            LoadSessionDropdown();
        }
    }

    protected void btnsearch_Click(object sender, EventArgs e)
    {
        SearchStudent();
    }

    private void SearchStudent()
    {
        string searchQuery = rdRoll.Checked ? "RollNo" : "FirstName";
        string searchValue = txtsearch.Text.Trim();

        using (SqlConnection con = new SqlConnection(connectionString))
        {
            string query = string.Format("SELECT StudentID, Session, RollNo, FirstName, MidName, LastName FROM Student WHERE {0} = @SearchValue", searchQuery);
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@SearchValue", searchValue);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);
                GridView1.DataSource = dataTable;
                GridView1.DataBind();
                MultiView1.SetActiveView(View1);
            }
        }
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Remove")
        {
            int studentId = Convert.ToInt32(e.CommandArgument);
            RemoveStudent(studentId);
            SearchStudent();
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
        lblmsg.Text = "Student removed successfully.";
    }
}
