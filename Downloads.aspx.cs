using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI.WebControls;
using System.Configuration;

public partial class Downloads : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            PopulateSessionDropDown();
            populateSemesterDropdown();
        }
    }

    private void populateSemesterDropdown()
    {
        ddlSemester.Items.Add(new ListItem("--- Select-Semester ---", string.Empty));
        ddlSemester.Items.Add(new ListItem("Semester 1", "Semester-1"));
        ddlSemester.Items.Add(new ListItem("Semester 2", "Semester-2"));
        ddlSemester.Items.Add(new ListItem("Semester 3", "Semester-3"));
        ddlSemester.Items.Add(new ListItem("Semester 4", "Semester-4"));
    }

    private void PopulateSessionDropDown()
    {
        ddlSession.Items.Add(new ListItem("--- Select-Session ---", string.Empty));
        int currentYear = DateTime.Now.Year;
        for (int year = 2019; year <= currentYear; year++)
        {
            if (year > 2018 && year <= currentYear - 2)
                ddlSession.Items.Add(new ListItem(year.ToString() + " - " + (year + 2).ToString(), year.ToString() + "-" + (year + 2).ToString()));
        }
    }

    protected void ddlDownloadType_SelectedIndexChanged(object sender, EventArgs e)
    {
        toggleSessionDropdown();
    }

    private void toggleSessionDropdown()
    {
        if (ddlDownloadType.SelectedValue == "Syllabus")
        {
            ddlSession.Enabled = false;
            ddlSession.SelectedIndex = 0; // Reset to default value
            ddlSemester.Enabled = true;
        }
        else if (ddlDownloadType.SelectedValue == "Other")
        {
            ddlSession.Enabled = false;
            ddlSemester.Enabled = false;
        }
        else
        {
            ddlSession.Enabled = true;
            ddlSemester.Enabled = true;
        }
        ddlSession.SelectedIndex = 0; // Reset to default value
        ddlSemester.SelectedIndex = 0; // Reset to default value
    }

    protected void btnShowFiles_Click(object sender, EventArgs e)
    {
        string fileType = ddlDownloadType.SelectedValue;
        string semester = ddlSemester.SelectedValue;
        string session = ddlSession.SelectedValue;

        string connectionString = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            string query = "SELECT Id, FileName FROM Files WHERE FileType = @FileType";

            if (ddlSemester.SelectedValue != string.Empty)
            {
                query += " AND Semester = @Semester";
            }

            if (ddlSession.Enabled & (ddlSession.SelectedValue != string.Empty))
            {
                query += " AND Session = @Session";
            }

            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@FileType", fileType);
                cmd.Parameters.AddWithValue("@Semester", semester);
                if (ddlSession.Enabled)
                {
                    cmd.Parameters.AddWithValue("@Session", session);
                }

                conn.Open();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GridViewFiles.DataSource = dt;
                GridViewFiles.DataBind();
                conn.Close();
            }
        }
    }

    protected void GridViewFiles_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Download")
        {
            int id = Convert.ToInt32(e.CommandArgument);
            string connectionString = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT FilePath FROM Files WHERE Id = @Id";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Id", id);

                    conn.Open();
                    string filePath = cmd.ExecuteScalar().ToString();
                    conn.Close();

                    string fullPath = Server.MapPath("~/" + filePath);
                    if (File.Exists(fullPath))
                    {
                        try
                        {
                            Response.Clear();
                            Response.ContentType = "application/octet-stream";
                            Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(fullPath));
                            Response.TransmitFile(fullPath);
                            Response.End();
                        }
                        catch (Exception ex)
                        {
                            lblMessage.Text = "Error in file download: " + ex.Message;
                            lblMessage.ForeColor = System.Drawing.Color.Red;
                        }
                    }
                    else
                    {
                        // Handle file not found scenario
                        lblMessage.Text = "File not found!";
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                    }
                }
            }
        }
    }
}

