﻿using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_AffReg : System.Web.UI.Page
{
    private int PageSize
    {
        get
        {
            return int.Parse(ddlRecordsPerPage.SelectedValue);
        }
    }

    private int PageIndex
    {
        get
        {
            return ViewState["PageIndex"] != null ? (int)ViewState["PageIndex"] : 0;
        }
        set
        {
            ViewState["PageIndex"] = value;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            PageIndex = 0;
            BindGridView();
        }
    }

    private void BindGridView()
    {
        string connStr = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            string query = @"
                WITH AffReg_CTE AS (
                    SELECT 
                        AffRegID, 
                        Title, 
                        AffRegDate, 
                        FilePath,
                        ROW_NUMBER() OVER (ORDER BY AffRegDate DESC) AS RowNum
                    FROM 
                        AffReg
                    WHERE
                        (@AffRegDate IS NULL OR CONVERT(VARCHAR, AffRegDate, 105) = @AffRegDate)
                )
                SELECT * FROM AffReg_CTE
                WHERE RowNum BETWEEN @StartRow AND @EndRow
                ORDER BY AffRegDate DESC";

            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                if (!string.IsNullOrEmpty(txtSearchDate.Text))
                {
                    cmd.Parameters.AddWithValue("@AffRegDate", txtSearchDate.Text);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@AffRegDate", DBNull.Value);
                }

                int startRow = PageIndex * PageSize + 1;
                int endRow = startRow + PageSize - 1;

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
        PageIndex = 0;
        BindGridView();
    }

    protected void ddlRecordsPerPage_SelectedIndexChanged(object sender, EventArgs e)
    {
        PageIndex = 0;
        BindGridView();
    }

    protected void btnPrevious_Click(object sender, EventArgs e)
    {
        if (PageIndex > 0)
        {
            PageIndex--;
            BindGridView();
        }
    }

    protected void btnNext_Click(object sender, EventArgs e)
    {
        PageIndex++;
        BindGridView();
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            // Optionally, you can add custom logic here for each row
        }
    }
}