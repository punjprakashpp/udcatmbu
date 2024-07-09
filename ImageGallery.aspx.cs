using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Web.UI;

public partial class pages_VideoGallery : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGallery();
        }

        if (!string.IsNullOrEmpty(Request.QueryString["occasion"]))
        {
            string occasion = Request.QueryString["occasion"];
            Response.Clear();
            Response.Write(GetModalContent(occasion));
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
                        Occasion, 
                        ImagePath,
                        ROW_NUMBER() OVER(PARTITION BY Occasion ORDER BY ImagePath) AS RowNum
                    FROM 
                        Gallery
                )
                SELECT 
                    Occasion,
                    ImagePath
                FROM 
                    GalleryCTE
                WHERE 
                    RowNum = 1";

            SqlDataAdapter da = new SqlDataAdapter(query, conn);
            DataTable dt = new DataTable();
            da.Fill(dt);

            GalleryRepeater.DataSource = dt;
            GalleryRepeater.DataBind();
        }
    }

    private string GetModalContent(string occasion)
    {
        string connStr = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            string query = "SELECT ImagePath FROM Gallery WHERE Occasion = @Occasion";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@Occasion", occasion);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            string modalContent = "";
            foreach (DataRow row in dt.Rows)
            {
                modalContent += "<div class='mySlides'><img src='../" + row["ImagePath"].ToString() + "' class='modal-img'></div>";
            }
            return modalContent;
        }
    }
}
