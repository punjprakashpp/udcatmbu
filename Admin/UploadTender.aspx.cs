﻿using System;
using System.IO;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_pages_UploadTender : System.Web.UI.Page
{

    protected void btnSubmit_Edit(object sender, EventArgs e)
    {
        Response.Redirect("ManageTender.aspx");
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string TenderNo = txtLinkNo.Text.Trim();
        string TenderTitle = txtLinkText.Text.Trim();
        DateTime TenderDate;
        string filePath = null;

        if (!string.IsNullOrEmpty(TenderTitle) && DateTime.TryParse(txtLinkDate.Text.Trim(), out TenderDate))
        {
            if (fileUpload.HasFile)
            {
                string fileExtension = Path.GetExtension(fileUpload.FileName).ToLower();
                if (fileExtension == ".pdf")
                {
                    try
                    {
                        string fileName = Path.GetFileName(fileUpload.FileName);
                        string uploadFolder = Server.MapPath("~/docs/tender/");
                        if (!Directory.Exists(uploadFolder))
                        {
                            Directory.CreateDirectory(uploadFolder);
                        }
                        filePath = Path.Combine(uploadFolder, fileName);
                        fileUpload.SaveAs(filePath);

                        // Store the relative path to the database
                        string relativeFilePath = "docs/tender/" + fileName;

                        string connStr = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;
                        using (SqlConnection conn = new SqlConnection(connStr))
                        {
                            string query = "INSERT INTO Docs (Type, No, Title, Date, Important, FilePath) VALUES (@Type, @No, @Title, @Date, @Important, @FilePath)";
                            using (SqlCommand cmd = new SqlCommand(query, conn))
                            {
                                cmd.Parameters.AddWithValue("@Type", "Tender");
                                cmd.Parameters.AddWithValue("@No", TenderNo);
                                cmd.Parameters.AddWithValue("@Title", TenderTitle);
                                cmd.Parameters.AddWithValue("@Date", TenderDate);
                                cmd.Parameters.AddWithValue("@Important", "no");
                                cmd.Parameters.AddWithValue("@FilePath", relativeFilePath);

                                conn.Open();
                                cmd.ExecuteNonQuery();
                                lblMessage.Text = "Tender uploaded successfully!";
                                lblMessage.ForeColor = System.Drawing.Color.Green;

                                // Clear form fields
                                txtLinkNo.Text = string.Empty;
                                txtLinkText.Text = string.Empty;
                                txtLinkDate.Text = string.Empty;
                                // Clear the file upload control
                                fileUpload.Attributes.Clear();
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        lblMessage.Text = "Error: " + ex.Message;
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                    }
                }
                else
                {
                    lblMessage.Text = "Only PDF files are allowed.";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
            else
            {
                lblMessage.Text = "Please upload a PDF file.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }
        else
        {
            lblMessage.Text = "Please enter valid Tender Title and Tender Date.";
            lblMessage.ForeColor = System.Drawing.Color.Red;
        }
    }
}
