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
            SqlCommand command = new SqlCommand("SELECT AppStartDate, AppEndDate, TMBUCandFee, OthCandFee, MeritIDate, AdmIStartDate, AdmIEndDate, MeritIIDate, AdmIIStartDate, AdmIIEndDate, ClassStartDate FROM [dbo].[Dates] WHERE DateID = 1", connection);
            SqlDataReader reader = command.ExecuteReader();
            if (reader.Read())
            {
                lblAppStartDate.Text = Convert.ToDateTime(reader["AppStartDate"]).ToString("dd-MM-yyyy");
                lblAppEndDate.Text = Convert.ToDateTime(reader["AppEndDate"]).ToString("dd-MM-yyyy");
                lblTMBUCandFee.Text = reader["TMBUCandFee"].ToString();
                lblOthCandFee.Text = reader["OthCandFee"].ToString();
                lblMeritIDate.Text = Convert.ToDateTime(reader["MeritIDate"]).ToString("dd-MM-yyyy");
                lblAdmIStartDate.Text = Convert.ToDateTime(reader["AdmIStartDate"]).ToString("dd-MM-yyyy");
                lblAdmIEndDate.Text = Convert.ToDateTime(reader["AdmIEndDate"]).ToString("dd-MM-yyyy");
                lblMeritIIDate.Text = Convert.ToDateTime(reader["MeritIIDate"]).ToString("dd-MM-yyyy");
                lblAdmIIStartDate.Text = Convert.ToDateTime(reader["AdmIIStartDate"]).ToString("dd-MM-yyyy");
                lblAdmIIEndDate.Text = Convert.ToDateTime(reader["AdmIIEndDate"]).ToString("dd-MM-yyyy");
                lblClassStartDate.Text = Convert.ToDateTime(reader["ClassStartDate"]).ToString("dd-MM-yyyy");
            }
        }
    }
}
