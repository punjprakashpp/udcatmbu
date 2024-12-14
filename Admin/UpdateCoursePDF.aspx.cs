using System;
using System.Web.UI.WebControls;

public partial class Admin_pages_UpdateOtherPDF : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnCalender_Click(object sender, EventArgs e)
    {
        UploadPDF(fileUploadCalender, "AcademicCalender.pdf");
    }

    protected void btnProspectus_Click(object sender, EventArgs e)
    {
        UploadPDF(fileUploadProspectus, "Prospectus.pdf");
    }

    protected void btnTimeTable_Click(object sender, EventArgs e)
    {
        UploadPDF(fileUploadTimeTable, "TimeTable.pdf");
    }

    protected void btnHolidayList_Click(object sender, EventArgs e)
    {
        UploadPDF(fileUploadHolidayList, "HolidayList.pdf");
    }

    protected void btnCourseStructure_Click(object sender, EventArgs e)
    {
        UploadPDF(fileUploadCourseStructure, "CourseStructure.pdf");
    }

    protected void btnCourseSyllabus_Click(object sender, EventArgs e)
    {
        UploadPDF(fileUploadCourseSyllabus, "CourseSyllabus.pdf");
    }

    private void UploadPDF(FileUpload fileUpload, string fileName)
    {
        if (fileUpload.HasFile)
        {
            if (fileUpload.PostedFile.ContentType == "application/pdf")
            {
                try
                {
                    string savePath = Server.MapPath("~/Uploads/docs/") + fileName;
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
