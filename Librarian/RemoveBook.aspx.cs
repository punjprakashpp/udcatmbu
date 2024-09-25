using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class Librarian_RemoveStudent : System.Web.UI.Page
{
    private readonly string connectionString = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        lblmsg.Text = "";
        if (!IsPostBack)
        {
            MultiView1.ActiveViewIndex = -1;
        }
    }

    protected void btnsearch_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrWhiteSpace(txtsearch.Text))
        {
            DisplayError("Enter search criteria!");
            ClearGridView();
            return;
        }

        string searchCriteria = txtsearch.Text.Trim();
        string query = string.Empty;

        if (rdBookNo.Checked)
        {
            query = "SELECT BID, BookNo, BookName, Author, Publication, Price FROM Book WHERE BookNo LIKE @SearchParam";
        }
        else if (rdBookName.Checked)
        {
            query = "SELECT BID, BookNo, BookName, Author, Publication, Price FROM Book WHERE BookName LIKE @SearchParam";
        }
        else if (rdAuthor.Checked)
        { 
            query = "SELECT BID, BookNo, BookName, Author, Publication, Price FROM Book WHERE Author LIKE @SearchParam";
        }
        else if (rdPublication.Checked)
        { 
            query = "SELECT BID, BookNo, BookName, Author, Publication, Price FROM Book WHERE Publication LIKE @SearchParam";
        }

        using (SqlConnection connection = new SqlConnection(connectionString))
        using (SqlDataAdapter adapter = new SqlDataAdapter(query, connection))
        {
            adapter.SelectCommand.Parameters.AddWithValue("@SearchParam", "%" + searchCriteria + "%");
            DataTable studentTable = new DataTable();
            try
            {
                connection.Open();
                adapter.Fill(studentTable);
                GridView1.DataSource = studentTable;
                GridView1.DataBind();
                MultiView1.ActiveViewIndex = 0;
                lbl.Text = studentTable.Rows.Count + " Book(s) Found.";
            }
            catch (Exception ex)
            {
                DisplayError("Error searching Books: " + ex.Message);
                ClearGridView();
            }
        }
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Remove")
        {
            int bid = Convert.ToInt32(e.CommandArgument);
            using (SqlConnection connection = new SqlConnection(connectionString))
            using (SqlCommand command = new SqlCommand("DELETE FROM Book WHERE BID = @bid", connection))
            {
                command.Parameters.AddWithValue("@bid", bid);
                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                    lblmsg.Text = "Book removed successfully.";
                }
                catch (Exception ex)
                {
                    DisplayError("Error removing Book: " + ex.Message);
                }
            }
        }
    }

    protected void btnRemSem_Click(object sender, EventArgs e)
    {
        using (SqlConnection connection = new SqlConnection(connectionString))
        using (SqlCommand command = new SqlCommand("DELETE FROM Book", connection))
        {
            try
            {
                connection.Open();
                command.ExecuteNonQuery();
                lblmsg.Text = "All Books removed successfully.";
            }
            catch (Exception ex)
            {
                DisplayError("Error removing Books: " + ex.Message);
            }
        }
    }

    private void DisplayError(string message)
    {
        lblmsg.Text = message;
        lblmsg.ForeColor = System.Drawing.Color.Red;
    }

    private void ClearGridView()
    {
        GridView1.DataSource = null;
        GridView1.DataBind();
        MultiView1.ActiveViewIndex = -1;
    }
}
