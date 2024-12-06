using System;
using System.Web;

public partial class ErrorPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Exception exception = Server.GetLastError();
        if (exception != null)
        {
            // Log the error (you can log this to a database or a file)
            LogError(exception);
        }
    }

    private void LogError(Exception ex)
    {
        // Log the error details (example using a text file or database)
        string filePath = Server.MapPath("~/App_Data/ErrorLog.txt");
        string errorMessage = string.Format("Error occurred at {0}:\n{1}\n{2}\n\n", DateTime.Now, ex.Message, ex.StackTrace);
        System.IO.File.AppendAllText(filePath, errorMessage);
    }
}
