﻿using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Redirect to default page if session variable "aid" is not set
        if (Session["aid"] == null)
        {
            Response.Redirect("../Default.aspx", false);
            HttpContext.Current.ApplicationInstance.CompleteRequest();
            return;
        }

        if (!IsPostBack)
        {
            // Display user name or "Guest" if Session["name"] is null
            lblname.Text = Session["name"] != null ? Session["name"].ToString() : "Guest";

            // Call the function to insert penalties if not already inserted
            InsertPenaltyIfNotExists();

            // Call the function to insert dummy data into Rent table
            InsertDummyDataIntoRentTable();
        }
    }

    protected void btnLogOut_Click(object sender, EventArgs e)
    {
        // Clear session variables and redirect to default page
        Session.Clear();
        Response.Redirect("../Default.aspx", false);
        HttpContext.Current.ApplicationInstance.CompleteRequest();
    }

    // Function to update penalty records in the Rent table if they don't already exist
    private void InsertPenaltyIfNotExists()
    {
        string connectionString = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string query = @"
            UPDATE Rent
            SET Penalty = 1, Amount = @Amount, Detail = 'Return Date Passed', EntryDate = GETDATE()
            WHERE Status = 1
            AND DATEDIFF(day, ReturnDate, GETDATE()) > 0 
            AND Penalty IS NULL"; // Ensures no duplicate penalty records are inserted

            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@Amount", Convert.ToDouble(100.00));

            connection.Open();
            command.ExecuteNonQuery();  
        }
    }

    // Function to insert dummy data into Rent table
    private void InsertDummyDataIntoRentTable()
    {
        string connectionString = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string query = @"
            INSERT INTO Rent (SID, BID, IssueDate, ReturnDate, Status, Penalty, Amount, Detail, EntryDate)
            SELECT 0 AS SID, BID, @IssueDate AS IssueDate, @ReturnDate AS ReturnDate, 0 AS Status, 
                   0 AS Penalty, 0.0 AS Amount, 'No Penalty' AS Detail, NULL AS EntryDate
            FROM Book
            WHERE BID NOT IN (SELECT BID FROM Rent)";

            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@IssueDate", DateTime.Now);
            command.Parameters.AddWithValue("@ReturnDate", DateTime.Now.AddMonths(1));

            connection.Open();
            command.ExecuteNonQuery();
        }
    }
}
