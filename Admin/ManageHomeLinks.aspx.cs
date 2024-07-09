using System;
using System.Data;
using System.IO;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_pages_EditDeleteMarqueeLinks : System.Web.UI.Page
{
    private int PageSize
    {
        get { return int.Parse(ddlRecordsPerPage.SelectedValue); }
    }

    private int CurrentPage
    {
        get { return ViewState["CurrentPage"] != null ? (int)ViewState["CurrentPage"] : 0; }
        set { ViewState["CurrentPage"] = value; }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGridView();
        }
    }

    private void BindGridView()
    {
        string connStr = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            string query = "SELECT * FROM " +
                           "(SELECT ROW_NUMBER() OVER (ORDER BY LinkID) AS RowNum, LinkID, LinkText, LinkURL " +
                           "FROM Links";
            string whereClause = "";
            if (!string.IsNullOrEmpty(txtSearchLinkText.Text))
            {
                whereClause = " WHERE LinkText LIKE @SearchText";
            }

            query += whereClause + ") AS RowConstrainedResult WHERE RowNum >= @StartRow AND RowNum < @EndRow ORDER BY RowNum";

            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                if (!string.IsNullOrEmpty(txtSearchLinkText.Text))
                {
                    cmd.Parameters.AddWithValue("@SearchText", "%" + txtSearchLinkText.Text + "%");
                }

                int startRow = CurrentPage * PageSize + 1;
                int endRow = startRow + PageSize;

                cmd.Parameters.AddWithValue("@StartRow", startRow);
                cmd.Parameters.AddWithValue("@EndRow", endRow);

                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
            }
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        CurrentPage = 0;
        BindGridView();
    }

    protected void ddlRecordsPerPage_SelectedIndexChanged(object sender, EventArgs e)
    {
        CurrentPage = 0;
        BindGridView();
    }

    protected void btnPrevious_Click(object sender, EventArgs e)
    {
        if (CurrentPage > 0)
        {
            CurrentPage--;
            BindGridView();
        }
    }

    protected void btnNext_Click(object sender, EventArgs e)
    {
        CurrentPage++;
        BindGridView();
    }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        BindGridView();
    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow row = GridView1.Rows[e.RowIndex];
        int linkID = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);

        TextBox txtLinkText = (TextBox)row.FindControl("txtLinkText");
        TextBox txtLinkURL = (TextBox)row.FindControl("txtLinkURL");
        DropDownList ddlLinkPicker = (DropDownList)row.FindControl("ddlLinkPicker");

        string linkText = txtLinkText.Text;
        string linkURL = txtLinkURL.Text;

        if (ddlLinkPicker.SelectedValue != string.Empty)
        {
            linkURL = ddlLinkPicker.SelectedValue;
        }

        string connStr = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            string query = "UPDATE Links SET LinkText=@LinkText, LinkURL=@LinkURL WHERE LinkID=@LinkID";
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@LinkText", linkText);
                cmd.Parameters.AddWithValue("@LinkURL", linkURL);
                cmd.Parameters.AddWithValue("@LinkID", linkID);

                conn.Open();
                cmd.ExecuteNonQuery();
                GridView1.EditIndex = -1;
                BindGridView();
            }
        }
    }

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        BindGridView();
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int linkID = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);

        string connStr = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            string query = "DELETE FROM Links WHERE LinkID=@LinkID";
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@LinkID", linkID);
                conn.Open();
                cmd.ExecuteNonQuery();
                BindGridView();
            }
        }
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow && (e.Row.RowState & DataControlRowState.Edit) > 0)
        {
            DropDownList ddlLinkPicker = (DropDownList)e.Row.FindControl("ddlLinkPicker");
            if (ddlLinkPicker != null)
            {
                ddlLinkPicker.Items.Insert(0, new ListItem("--Select Link--", string.Empty));

                string[] filePaths = Directory.GetFiles(Server.MapPath("~/"), "*.aspx", SearchOption.TopDirectoryOnly);
                foreach (string filePath in filePaths)
                {
                    string relativePath = filePath.Replace(Server.MapPath("~/"), "").Replace("\\", "/");
                    string fileName = Path.GetFileNameWithoutExtension(filePath);
                    ddlLinkPicker.Items.Add(new ListItem(fileName, relativePath));
                }

                string currentLinkURL = DataBinder.Eval(e.Row.DataItem, "LinkURL").ToString();
                ListItem selectedItem = ddlLinkPicker.Items.FindByValue(currentLinkURL);
                if (selectedItem != null)
                {
                    ddlLinkPicker.ClearSelection();
                    selectedItem.Selected = true;
                }
            }
        }
    }
}
