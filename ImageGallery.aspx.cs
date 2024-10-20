using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class pages_ImageGallery : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGallery();
        }

        if (!string.IsNullOrEmpty(Request.QueryString["Title"]))
        {
            string title = Request.QueryString["Title"];
            Response.Clear();
            Response.Write(GetModalContent(title));
            Response.End();
        }
    }

    private void BindGallery()
    {
        string connStr = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            string query = @"
                WITH GalleryCTE AS (
                    SELECT 
                        Title, 
                        ImagePath,
                        ROW_NUMBER() OVER(PARTITION BY Title ORDER BY ImagePath) AS RowNum
                    FROM 
                        Image 
                    WHERE 
                        Type = 'Gallery'
                )
                SELECT 
                    Title,
                    ImagePath
                FROM 
                    GalleryCTE
                WHERE 
                    RowNum = 1";

            SqlDataAdapter da = new SqlDataAdapter(query, conn);
            DataTable dt = new DataTable();
            da.Fill(dt);

            ThumbnailRepeater.DataSource = dt;
            ThumbnailRepeater.DataBind();
        }
    }

    private string GetModalContent(string title)
    {
        string connStr = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            string query = "SELECT ImagePath FROM Image WHERE Title = @Title AND Type = 'Gallery'";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@Title", title);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            string modalContent = "";
            foreach (DataRow row in dt.Rows)
            {
                modalContent += "<img src='" + row["ImagePath"].ToString() + "' alt='" + title + "' onclick=\"displayImage('" + row["ImagePath"].ToString() + "')\">";
            }
            return modalContent;
        }
    }
}
