using System;
using System.Web;
using System.Web.Security;
using System.Web.UI.WebControls;

public partial class cms_master : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Unnamed_LoggingOut(object sender, LoginCancelEventArgs e)
    {
        // Sign out the user
        FormsAuthentication.SignOut();

        // Clear the authentication cookie
        HttpCookie authCookie = new HttpCookie(FormsAuthentication.FormsCookieName, "");
        authCookie.Expires = DateTime.Now.AddYears(-1);
        Response.Cookies.Add(authCookie);
    }
}
