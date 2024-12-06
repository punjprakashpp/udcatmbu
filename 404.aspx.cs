using System;

public partial class _404 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Optionally, you can log this 404 event as well
        LogError("404 - Page Not Found");
    }

    private void LogError(string message)
    {
        // Log the 404 error (example logging to a text file or database)
        string filePath = Server.MapPath("~/App_Data/ErrorLog.txt");
        string errorMessage = string.Format("Error occurred at {0}: {1}\n\n", DateTime.Now, message);
        System.IO.File.AppendAllText(filePath, errorMessage);
    }
}
