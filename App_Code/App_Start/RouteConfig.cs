using System.Web.Routing;
using Microsoft.AspNet.FriendlyUrls;

public static class RouteConfig
{
    public static void RegisterRoutes(RouteCollection routes)
    {
        var settings = new FriendlyUrlSettings
        {
            AutoRedirectMode = RedirectMode.Permanent
        };

        // Use the custom resolver
        routes.EnableFriendlyUrls(settings, new CustomFriendlyUrlResolver());
    }
}
