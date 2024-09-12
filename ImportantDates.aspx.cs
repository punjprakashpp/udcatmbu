using System;
using System.Data.SqlClient;
using System.Configuration;

public partial class Acedemic_ImpDates : System.Web.UI.Page
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
                        lblAppStartDate.Text = Convert.ToDateTime(reader["Date"]).ToString("dd-MM-yyyy");
                        break;
                    case "Application End Date":
                        lblAppEndDate.Text = Convert.ToDateTime(reader["Date"]).ToString("dd-MM-yyyy");
                        break;
                    case "Fee for TMBU Candidate":
                        lblTMBUCandFee.Text = reader["Value"].ToString();
                        break;
                    case "Fee for Other Candidate":
                        lblOthCandFee.Text = reader["Value"].ToString();
                        break;
                    case "Merit List-I Date":
                        lblMeritIDate.Text = Convert.ToDateTime(reader["Date"]).ToString("dd-MM-yyyy");
                        break;
                    case "Merit List-I Admission Start Date":
                        lblAdmIStartDate.Text = Convert.ToDateTime(reader["Date"]).ToString("dd-MM-yyyy");
                        break;
                    case "Merit List-I Admission End Date":
                        lblAdmIEndDate.Text = Convert.ToDateTime(reader["Date"]).ToString("dd-MM-yyyy");
                        break;
                    case "Merit List-II Date":
                        lblMeritIIDate.Text = Convert.ToDateTime(reader["Date"]).ToString("dd-MM-yyyy");
                        break;
                    case "Merit List-II Admission Start Date":
                        lblAdmIIStartDate.Text = Convert.ToDateTime(reader["Date"]).ToString("dd-MM-yyyy");
                        break;
                    case "Merit List-II Admission End Date":
                        lblAdmIIEndDate.Text = Convert.ToDateTime(reader["Date"]).ToString("dd-MM-yyyy");
                        break;
                    case "Class Start Date":
                        lblClassStartDate.Text = Convert.ToDateTime(reader["Date"]).ToString("dd-MM-yyyy");
                        break;
                }
            }
        }
    }
}
