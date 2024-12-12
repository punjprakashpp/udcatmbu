using Microsoft.AspNet.FriendlyUrls.Resolvers;
using System.Web;

public class CustomFriendlyUrlResolver : WebFormsFriendlyUrlResolver
{
    protected override bool TrySetMobileMasterPage(HttpContextBase httpContext, System.Web.UI.Page page, string mobileSuffix)
    {
        // Return false to indicate that no mobile master page is being set
        return false;
    }
}
