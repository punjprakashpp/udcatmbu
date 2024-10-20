﻿using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Acedemic_FeeStructure : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGridView();
        }
    }

    private void BindGridView()
    {
        string connectionString = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            SqlCommand command = new SqlCommand("SELECT Semester, Admission, Academic, Computer, Miscellaneous, Examination, Total FROM [dbo].[Fee]", connection);
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataTable dataTable = new DataTable();
            adapter.Fill(dataTable);

            GridView1.DataSource = dataTable;
            GridView1.DataBind();
        }
    }
}