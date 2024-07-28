using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

public partial class pages_Default : System.Web.UI.Page
{
    private int currentPage;
    private int recordsPerPage;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ViewState["CurrentPage"] = 0;
            ViewState["RecordsPerPage"] = 10;
            LoadFacultyDetails();
            PopulateSessionDropdown();
        }
        else
        {
            currentPage = (int)ViewState["CurrentPage"];
            recordsPerPage = (int)ViewState["RecordsPerPage"];
        }
    }

    private void PopulateSessionDropdown()
    {
        ddlSession.Items.Add(new ListItem("-Select-Session-",string.Empty));
        int currentYear = DateTime.Now.Year;
        for (int year = 2002; year <= currentYear; year++)
        {
            if (year <= 2018)
                ddlSession.Items.Add(new ListItem(year.ToString() + " - " + (year + 3).ToString(), year.ToString()));
            else if (year > 2018 && year <= currentYear - 2)
                ddlSession.Items.Add(new ListItem(year.ToString() + " - " + (year + 2).ToString(), year.ToString()));
        }
    }

    private void LoadFacultyDetails()
    {
        string connStr = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            string query = @"SELECT Name, RollNo, Session, Qualification, Occupation, Company, Phone, Email, ImagePath, LinkedIn, Facebook, Instagram, Twitter 
                             FROM Alumni 
                             WHERE (@Session IS NULL OR Session = @Session) 
                             AND (@RollNo IS NULL OR RollNo = @RollNo)";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@Session", string.IsNullOrEmpty(ddlSession.SelectedValue) ? (object)DBNull.Value : ddlSession.SelectedItem.ToString());
            cmd.Parameters.AddWithValue("@RollNo", string.IsNullOrEmpty(txtRollNo.Text) ? (object)DBNull.Value : txtRollNo.Text);

            conn.Open();
            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                DataTable dt = new DataTable();
                dt.Load(reader);

                PagedDataSource pds = new PagedDataSource();
                pds.DataSource = dt.DefaultView;
                pds.AllowPaging = true;
                pds.PageSize = recordsPerPage;
                pds.CurrentPageIndex = currentPage;

                ViewState["TotalPages"] = pds.PageCount;

                btnPrevious.Enabled = !pds.IsFirstPage;
                btnNext.Enabled = !pds.IsLastPage;

                facultyRepeater.DataSource = pds;
                facultyRepeater.DataBind();
            }
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        ViewState["CurrentPage"] = 0;
        LoadFacultyDetails();
    }

    protected void btnPrevious_Click(object sender, EventArgs e)
    {
        currentPage = (int)ViewState["CurrentPage"] - 1;
        ViewState["CurrentPage"] = currentPage;
        LoadFacultyDetails();
    }

    protected void btnNext_Click(object sender, EventArgs e)
    {
        currentPage = (int)ViewState["CurrentPage"] + 1;
        ViewState["CurrentPage"] = currentPage;
        LoadFacultyDetails();
    }

    protected void ddlRecordsPerPage_SelectedIndexChanged(object sender, EventArgs e)
    {
        ViewState["RecordsPerPage"] = int.Parse(ddlRecordsPerPage.SelectedValue);
        LoadFacultyDetails();
    }
}