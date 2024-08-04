using System;
using System.IO;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_pages_UploadNotice : System.Web.UI.Page
{

    protected void btnSubmit_Edit(object sender, EventArgs e)
    {
        Response.Redirect("ManageNotice.aspx");
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string noticeNo = txtLinkNo.Text.Trim();
        string noticeTitle = txtLinkText.Text.Trim();
        DateTime noticeDate;
        string important = "no";
        string filePath = null;

        if (!string.IsNullOrEmpty(noticeTitle) && DateTime.TryParse(txtLinkDate.Text.Trim(), out noticeDate))
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
                            important = "yes";
                        }
                        string fileName = Path.GetFileName(fileUpload.FileName);
                        string uploadFolder = Server.MapPath("~/docs/notice/");
                        if (!Directory.Exists(uploadFolder))
                        {
                            Directory.CreateDirectory(uploadFolder);
                        }
                        filePath = Path.Combine(uploadFolder, fileName);
                        fileUpload.SaveAs(filePath);

                        // Store the relative path to the database
                        string relativeFilePath = "docs/notice/" + fileName;

                        string connStr = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;
                        using (SqlConnection conn = new SqlConnection(connStr))
                        {
                            string query = "INSERT INTO Docs (Type, No, Title, Date, Important, FilePath) VALUES (@Type, @No, @Title, @Date, @Important, @FilePath)";
                            using (SqlCommand cmd = new SqlCommand(query, conn))
                            {
                                cmd.Parameters.AddWithValue("@Type", "Notice");
                                cmd.Parameters.AddWithValue("@No", noticeNo);
                                cmd.Parameters.AddWithValue("@Title", noticeTitle);
                                cmd.Parameters.AddWithValue("@Date", noticeDate);
                                cmd.Parameters.AddWithValue("@Important", important);
                                cmd.Parameters.AddWithValue("@FilePath", relativeFilePath);

                                conn.Open();
                                cmd.ExecuteNonQuery();
                                lblMessage.Text = "Notice uploaded successfully!";
                                lblMessage.ForeColor = System.Drawing.Color.Green;

                                // Clear form fields
                                ImpChkbox.Checked = false;
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
            lblMessage.Text = "Please enter valid Notice Title and Notice Date.";
            lblMessage.ForeColor = System.Drawing.Color.Red;
        }
    }
}
