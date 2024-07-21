using System;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_pages_UpdateOtherPDF : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnVCProfile_Click(object sender, EventArgs e)
    {
        UploadPDF(fileUploadVCProfile, "VCProfile.pdf");
    }

    protected void btnPVCProfile_Click(object sender, EventArgs e)
    {
        UploadPDF(fileUploadPVCProfile, "PVCProfile.pdf");
    }

    protected void btnDirectorProfile_Click(object sender, EventArgs e)
    {
        UploadPDF(fileUploadDirectorProfile, "DirectorProfile.pdf");
    }

    protected void btnDSWProfile_Click(object sender, EventArgs e)
    {
        UploadPDF(fileUploadDSWProfile, "DSWProfile.pdf");
    }

    protected void btnCCDCProfile_Click(object sender, EventArgs e)
    {
        UploadPDF(fileUploadCCDCProfile, "CCDCProfile.pdf");
    }

    protected void btnRegistrarProfile_Click(object sender, EventArgs e)
    {
        UploadPDF(fileUploadRegistrarProfile, "RegistrarProfile.pdf");
    }

    private void UploadPDF(FileUpload fileUpload, string fileName)
    {
        if (fileUpload.HasFile)
        {
            if (fileUpload.PostedFile.ContentType == "application/pdf")
            {
                try
                {
                    string savePath = Server.MapPath("~/docs/Profile/") + fileName;
                    fileUpload.SaveAs(savePath);
                    lblMessage.Text = "File uploaded successfully: " + fileName;
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "File could not be uploaded. Error: " + ex.Message;
                }
            }
            else
            {
                lblMessage.Text = "Only PDF files are allowed.";
            }
        }
        else
        {
            lblMessage.Text = "Please select a file to upload.";
        }
    }
}
