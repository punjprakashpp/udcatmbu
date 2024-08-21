using System;
using System.IO;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_pages_UploadEvent : System.Web.UI.Page
{

    protected void btnSubmit_Edit(object sender, EventArgs e)
    {
        Response.Redirect("ManageEvents.aspx");
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string eventTitle = txtLinkText.Text.Trim();
        DateTime eventDate;
        string important = "no";
        string filePath = null;

        if (!string.IsNullOrEmpty(eventTitle))
        {
            // Parse the date using the specific format 'dd-MM-yyyy'
            try
            {
                eventDate = DateTime.ParseExact(txtLinkDate.Text.Trim(), "dd-MM-yyyy", null);

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
                            string uploadFolder = Server.MapPath("~/docs/event/");
                            if (!Directory.Exists(uploadFolder))
                            {
                                Directory.CreateDirectory(uploadFolder);
                            }
                            filePath = Path.Combine(uploadFolder, fileName);
                            fileUpload.SaveAs(filePath);

                            // Store the relative path to the database
                            string relativeFilePath = "docs/event/" + fileName;

                            string connStr = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;
                            using (SqlConnection conn = new SqlConnection(connStr))
                            {
                                string query = "INSERT INTO Docs (Type, No, Title, Date, Important, FilePath) VALUES (@Type, @No, @Title, @Date, @Important, @FilePath)";
                                using (SqlCommand cmd = new SqlCommand(query, conn))
                                {
                                    cmd.Parameters.AddWithValue("@Type", "Event");
                                    cmd.Parameters.AddWithValue("@No", string.Empty);
                                    cmd.Parameters.AddWithValue("@Title", eventTitle);
                                    cmd.Parameters.AddWithValue("@Date", eventDate);
                                    cmd.Parameters.AddWithValue("@Important", important);
                                    cmd.Parameters.AddWithValue("@FilePath", relativeFilePath);

                                    conn.Open();
                                    cmd.ExecuteNonQuery();
                                    lblMessage.Text = "Event uploaded successfully!";
                                    lblMessage.ForeColor = System.Drawing.Color.Green;

                                    // Clear form fields
                                    ImpChkbox.Checked = false;
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
            catch (FormatException)
            {
                lblMessage.Text = "Please enter a valid date in the format dd-MM-yyyy.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }
        else
        {
            lblMessage.Text = "Please enter valid Event Title and Event Date.";
            lblMessage.ForeColor = System.Drawing.Color.Red;
        }
    }
}
