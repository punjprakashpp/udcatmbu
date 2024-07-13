using System;
using System.IO;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_pages_UploadAffReg : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_Edit(object sender, EventArgs e)
    {
        Response.Redirect("ManageAffReg.aspx");
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string affregTitle = txtLinkText.Text.Trim();
        DateTime affregDate;
        string filePath = null;

        if (!string.IsNullOrEmpty(affregTitle) && DateTime.TryParse(txtLinkDate.Text.Trim(), out affregDate))
        {
            if (fileUpload.HasFile)
            {
                string fileExtension = Path.GetExtension(fileUpload.FileName).ToLower();
                if (fileExtension == ".pdf")
                {
                    try
                    {
                        string fileName = Path.GetFileName(fileUpload.FileName);
                        string uploadFolder = Server.MapPath("../doc/affreg/");
                        if (!Directory.Exists(uploadFolder))
                        {
                            Directory.CreateDirectory(uploadFolder);
                        }
                        filePath = Path.Combine(uploadFolder, fileName);
                        fileUpload.SaveAs(filePath);

                        // Store the relative path to the database
                        string relativeFilePath = "doc/affreg/" + fileName;

                        string connStr = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;
                        using (SqlConnection conn = new SqlConnection(connStr))
                        {
                            string query = "INSERT INTO Board (Type, Title, Date, Important, FilePath) VALUES (@Type, @Title, @AffRegDate, @Important, @FilePath)";
                            using (SqlCommand cmd = new SqlCommand(query, conn))
                            {
                                cmd.Parameters.AddWithValue("@Type", "AffReg");
                                cmd.Parameters.AddWithValue("@Title", affregTitle);
                                cmd.Parameters.AddWithValue("@AffRegDate", affregDate);
                                cmd.Parameters.AddWithValue("@Important", "no");
                                cmd.Parameters.AddWithValue("@FilePath", relativeFilePath);

                                conn.Open();
                                cmd.ExecuteNonQuery();
                                lblMessage.Text = "uploaded successfully!";
                                lblMessage.ForeColor = System.Drawing.Color.Green;

                                // Clear form fields
                                txtLinkText.Text = string.Empty;
                                txtLinkDate.Text = string.Empty;
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
            lblMessage.Text = "Please enter valid Title and Date.";
            lblMessage.ForeColor = System.Drawing.Color.Red;
        }
    }
}