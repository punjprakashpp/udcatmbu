using System;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_pages_UpdateFeeStructure : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadImportantDates();
        }
    }

    private void LoadImportantDates()
    {
        string connectionString = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();
            SqlCommand command = new SqlCommand("SELECT * FROM [dbo].[Dates] WHERE Title IN ('Application Start Date', 'Application End Date', 'Fee for TMBU Candidate', 'Fee for Other Candidate', 'Merit List-I Date', 'Merit List-I Admission Start Date', 'Merit List-I Admission End Date', 'Merit List-II Date', 'Merit List-II Admission Start Date', 'Merit List-II Admission End Date', 'Class Start Date')", connection);
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                switch (reader["Title"].ToString())
                {
                    case "Application Start Date":
                        txtAppStartDate.Text = Convert.ToDateTime(reader["Date"]).ToString("dd-MM-yyyy");
                        break;
                    case "Application End Date":
                        txtAppEndDate.Text = Convert.ToDateTime(reader["Date"]).ToString("dd-MM-yyyy");
                        break;
                    case "Fee for TMBU Candidate":
                        txtTMBUCandFee.Text = reader["Value"].ToString();
                        break;
                    case "Fee for Other Candidate":
                        txtOthCandFee.Text = reader["Value"].ToString();
                        break;
                    case "Merit List-I Date":
                        txtMeritIDate.Text = Convert.ToDateTime(reader["Date"]).ToString("dd-MM-yyyy");
                        break;
                    case "Merit List-I Admission Start Date":
                        txtAdmIStartDate.Text = Convert.ToDateTime(reader["Date"]).ToString("dd-MM-yyyy");
                        break;
                    case "Merit List-I Admission End Date":
                        txtAdmIEndDate.Text = Convert.ToDateTime(reader["Date"]).ToString("dd-MM-yyyy");
                        break;
                    case "Merit List-II Date":
                        txtMeritIIDate.Text = Convert.ToDateTime(reader["Date"]).ToString("dd-MM-yyyy");
                        break;
                    case "Merit List-II Admission Start Date":
                        txtAdmIIStartDate.Text = Convert.ToDateTime(reader["Date"]).ToString("dd-MM-yyyy");
                        break;
                    case "Merit List-II Admission End Date":
                        txtAdmIIEndDate.Text = Convert.ToDateTime(reader["Date"]).ToString("dd-MM-yyyy");
                        break;
                    case "Class Start Date":
                        txtClassStartDate.Text = Convert.ToDateTime(reader["Date"]).ToString("dd-MM-yyyy");
                        break;
                }
            }
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            string[] titles = {
                "Application Start Date", "Application End Date", "Fee for TMBU Candidate",
                "Fee for Other Candidate", "Merit List-I Date", "Merit List-I Admission Start Date",
                "Merit List-I Admission End Date", "Merit List-II Date", "Merit List-II Admission Start Date",
                "Merit List-II Admission End Date", "Class Start Date"
            };

            string[] dates = {
                txtAppStartDate.Text, txtAppEndDate.Text, "", "",
                txtMeritIDate.Text, txtAdmIStartDate.Text, txtAdmIEndDate.Text,
                txtMeritIIDate.Text, txtAdmIIStartDate.Text, txtAdmIIEndDate.Text, txtClassStartDate.Text
            };

            string[] values = {
                "", "", txtTMBUCandFee.Text, txtOthCandFee.Text,
                "", "", "", "", "", "", ""
            };

            for (int i = 0; i < titles.Length; i++)
            {
                SqlCommand checkCommand = new SqlCommand("SELECT COUNT(*) FROM [dbo].[Dates] WHERE Title = @Title", connection);
                checkCommand.Parameters.AddWithValue("@Title", titles[i]);
                int count = (int)checkCommand.ExecuteScalar();

                if (count > 0)
                {
                    // Update existing data
                    SqlCommand updateCommand = new SqlCommand("UPDATE [dbo].[Dates] SET Date = @Date, Value = @Value WHERE Title = @Title", connection);
                    updateCommand.Parameters.AddWithValue("@Date", string.IsNullOrEmpty(dates[i]) ? (object)DBNull.Value : DateTime.ParseExact(dates[i], "dd-MM-yyyy", null));
                    updateCommand.Parameters.AddWithValue("@Value", string.IsNullOrEmpty(values[i]) ? (object)DBNull.Value : values[i]);
                    updateCommand.Parameters.AddWithValue("@Title", titles[i]);

                    updateCommand.ExecuteNonQuery();
                }
                else
                {
                    // Insert new data
                    SqlCommand insertCommand = new SqlCommand("INSERT INTO [dbo].[Dates] (Title, Date, Value) VALUES (@Title, @Date, @Value)", connection);
                    insertCommand.Parameters.AddWithValue("@Title", titles[i]);
                    insertCommand.Parameters.AddWithValue("@Date", string.IsNullOrEmpty(dates[i]) ? (object)DBNull.Value : DateTime.ParseExact(dates[i], "dd-MM-yyyy", null));
                    insertCommand.Parameters.AddWithValue("@Value", string.IsNullOrEmpty(values[i]) ? (object)DBNull.Value : values[i]);

                    insertCommand.ExecuteNonQuery();
                }
            }

            lblMessage.Text = "Important dates updated successfully!";
            lblMessage.ForeColor = System.Drawing.Color.Green;
        }
    }
}
