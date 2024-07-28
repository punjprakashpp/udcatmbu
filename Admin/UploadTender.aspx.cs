using System;
using System.IO;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_pages_UploadTender : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_Edit(object sender, EventArgs e)
    {
        Response.Redirect("ManageTender.aspx");
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string tenderTitle = txtLinkText.Text.Trim();
        DateTime tenderDate;
        string imp = "no";
        string filePath = null;

        // Check if the title is not empty and the date is valid
        if (!string.IsNullOrEmpty(tenderTitle) && DateTime.TryParse(txtLinkDate.Text.Trim(), out tenderDate))
        {
            if (fileUpload.HasFile)
            {
                string fileExtension = Path.GetExtension(fileUpload.FileName).ToLower();
                if (fileExtension == ".pdf")
                {
                    try
                    {
                        if (ImpChkbox.Checked)
                        {
                            imp = "yes";
                        }

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
                            string query = "INSERT INTO Board (Type, Title, Date, Important, FilePath) VALUES (@Type, @Title, @Date, @Important, @FilePath)";
                            using (SqlCommand cmd = new SqlCommand(query, conn))
                            {
                                cmd.Parameters.AddWithValue("@Type", "Tender");
                                cmd.Parameters.AddWithValue("@Title", tenderTitle);
                                cmd.Parameters.AddWithValue("@Date", tenderDate);
                                cmd.Parameters.AddWithValue("@Important", imp);
                                cmd.Parameters.AddWithValue("@FilePath", relativeFilePath);

                                conn.Open();
                                cmd.ExecuteNonQuery();
                                lblMessage.Text = "Tender uploaded successfully!";
                                lblMessage.ForeColor = System.Drawing.Color.Green;

                                // Clear form fields
                                txtLinkText.Text = string.Empty;
                                txtLinkDate.Text = string.Empty;
                                // fileUpload control cannot be programmatically cleared
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
            lblMessage.Text = "Please enter a valid Tender Title and Tender Date.";
            lblMessage.ForeColor = System.Drawing.Color.Red;
        }
    }
}