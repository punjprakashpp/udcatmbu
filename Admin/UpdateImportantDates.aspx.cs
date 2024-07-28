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
            SqlCommand command = new SqlCommand("SELECT * FROM [dbo].[Dates] WHERE DateID = 1", connection);
            SqlDataReader reader = command.ExecuteReader();
            if (reader.Read())
            {
                txtAppStartDate.Text = Convert.ToDateTime(reader["AppStartDate"]).ToString("dd-MM-yyyy");
                txtAppEndDate.Text = Convert.ToDateTime(reader["AppEndDate"]).ToString("dd-MM-yyyy");
                txtTMBUCandFee.Text = reader["TMBUCandFee"].ToString();
                txtOthCandFee.Text = reader["OthCandFee"].ToString();
                txtMeritIDate.Text = Convert.ToDateTime(reader["MeritIDate"]).ToString("dd-MM-yyyy");
                txtAdmIStartDate.Text = Convert.ToDateTime(reader["AdmIStartDate"]).ToString("dd-MM-yyyy");
                txtAdmIEndDate.Text = Convert.ToDateTime(reader["AdmIEndDate"]).ToString("dd-MM-yyyy");
                txtMeritIIDate.Text = Convert.ToDateTime(reader["MeritIIDate"]).ToString("dd-MM-yyyy");
                txtAdmIIStartDate.Text = Convert.ToDateTime(reader["AdmIIStartDate"]).ToString("dd-MM-yyyy");
                txtAdmIIEndDate.Text = Convert.ToDateTime(reader["AdmIIEndDate"]).ToString("dd-MM-yyyy");
                txtClassStartDate.Text = Convert.ToDateTime(reader["ClassStartDate"]).ToString("dd-MM-yyyy");
            }
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            SqlCommand checkCommand = new SqlCommand("SELECT COUNT(*) FROM [dbo].[Dates] WHERE DateID = 1", connection);
            int count = (int)checkCommand.ExecuteScalar();

            if (count > 0)
            {
                // Update existing data
                SqlCommand updateCommand = new SqlCommand("UPDATE [dbo].[Dates] SET AppStartDate = @AppStartDate, AppEndDate = @AppEndDate, TMBUCandFee = @TMBUCandFee, OthCandFee = @OthCandFee, MeritIDate = @MeritIDate, AdmIStartDate = @AdmIStartDate, AdmIEndDate = @AdmIEndDate, MeritIIDate = @MeritIIDate, AdmIIStartDate = @AdmIIStartDate, AdmIIEndDate = @AdmIIEndDate, ClassStartDate = @ClassStartDate WHERE DateID = 1", connection);
                updateCommand.Parameters.AddWithValue("@AppStartDate", DateTime.ParseExact(txtAppStartDate.Text, "dd-MM-yyyy", null));
                updateCommand.Parameters.AddWithValue("@AppEndDate", DateTime.ParseExact(txtAppEndDate.Text, "dd-MM-yyyy", null));
                updateCommand.Parameters.AddWithValue("@TMBUCandFee", txtTMBUCandFee.Text);
                updateCommand.Parameters.AddWithValue("@OthCandFee", txtOthCandFee.Text);
                updateCommand.Parameters.AddWithValue("@MeritIDate", DateTime.ParseExact(txtMeritIDate.Text, "dd-MM-yyyy", null));
                updateCommand.Parameters.AddWithValue("@AdmIStartDate", DateTime.ParseExact(txtAdmIStartDate.Text, "dd-MM-yyyy", null));
                updateCommand.Parameters.AddWithValue("@AdmIEndDate", DateTime.ParseExact(txtAdmIEndDate.Text, "dd-MM-yyyy", null));
                updateCommand.Parameters.AddWithValue("@MeritIIDate", DateTime.ParseExact(txtMeritIIDate.Text, "dd-MM-yyyy", null));
                updateCommand.Parameters.AddWithValue("@AdmIIStartDate", DateTime.ParseExact(txtAdmIIStartDate.Text, "dd-MM-yyyy", null));
                updateCommand.Parameters.AddWithValue("@AdmIIEndDate", DateTime.ParseExact(txtAdmIIEndDate.Text, "dd-MM-yyyy", null));
                updateCommand.Parameters.AddWithValue("@ClassStartDate", DateTime.ParseExact(txtClassStartDate.Text, "dd-MM-yyyy", null));

                updateCommand.ExecuteNonQuery();
                lblMessage.Text = "Important dates updated successfully!";
                lblMessage.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                // Insert new data
                SqlCommand insertCommand = new SqlCommand("INSERT INTO [dbo].[Dates] (AppStartDate, AppEndDate, TMBUCandFee, OthCandFee, MeritIDate, AdmIStartDate, AdmIEndDate, MeritIIDate, AdmIIStartDate, AdmIIEndDate, ClassStartDate) VALUES (@AppStartDate, @AppEndDate, @TMBUCandFee, @OthCandFee, @MeritIDate, @AdmIStartDate, @AdmIEndDate, @MeritIIDate, @AdmIIStartDate, @AdmIIEndDate, @ClassStartDate)", connection);
                insertCommand.Parameters.AddWithValue("@AppStartDate", DateTime.ParseExact(txtAppStartDate.Text, "dd-MM-yyyy", null));
                insertCommand.Parameters.AddWithValue("@AppEndDate", DateTime.ParseExact(txtAppEndDate.Text, "dd-MM-yyyy", null));
                insertCommand.Parameters.AddWithValue("@TMBUCandFee", txtTMBUCandFee.Text);
                insertCommand.Parameters.AddWithValue("@OthCandFee", txtOthCandFee.Text);
                insertCommand.Parameters.AddWithValue("@MeritIDate", DateTime.ParseExact(txtMeritIDate.Text, "dd-MM-yyyy", null));
                insertCommand.Parameters.AddWithValue("@AdmIStartDate", DateTime.ParseExact(txtAdmIStartDate.Text, "dd-MM-yyyy", null));
                insertCommand.Parameters.AddWithValue("@AdmIEndDate", DateTime.ParseExact(txtAdmIEndDate.Text, "dd-MM-yyyy", null));
                insertCommand.Parameters.AddWithValue("@MeritIIDate", DateTime.ParseExact(txtMeritIIDate.Text, "dd-MM-yyyy", null));
                insertCommand.Parameters.AddWithValue("@AdmIIStartDate", DateTime.ParseExact(txtAdmIIStartDate.Text, "dd-MM-yyyy", null));
                insertCommand.Parameters.AddWithValue("@AdmIIEndDate", DateTime.ParseExact(txtAdmIIEndDate.Text, "dd-MM-yyyy", null));
                insertCommand.Parameters.AddWithValue("@ClassStartDate", DateTime.ParseExact(txtClassStartDate.Text, "dd-MM-yyyy", null));

                insertCommand.ExecuteNonQuery();
                lblMessage.Text = "Important dates inserted successfully!";
                lblMessage.ForeColor = System.Drawing.Color.Green;
            }
        }
    }

}
