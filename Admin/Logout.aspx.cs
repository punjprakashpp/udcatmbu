using System;
using System.Web;
using System.Web.Security;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Logout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Sign out the user
        FormsAuthentication.SignOut();
        
        // Clear the authentication cookie
        HttpCookie authCookie = new HttpCookie(FormsAuthentication.FormsCookieName, "");
        authCookie.Expires = DateTime.Now.AddYears(-1);
        Response.Cookies.Add(authCookie);

        // Redirect to login page
        Response.Redirect("~/Login.aspx");
    }
}