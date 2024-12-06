<%@ Page Language="C#" AutoEventWireup="true" CodeFile="404.aspx.cs" Inherits="_404" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Page Not Found - 404 Error</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f8f8f8; padding: 20px; }
        .error-container { text-align: center; padding: 50px; background-color: #fff; border: 1px solid #ddd; border-radius: 10px; }
        h1 { color: #e74c3c; }
        p { font-size: 18px; color: #555; }
        .btn { background-color: #3498db; color: white; padding: 10px 20px; text-decoration: none; border-radius: 5px; }
        .btn:hover { background-color: #2980b9; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
     <div class="error-container">
        <h1>404 - Page Not Found</h1>
        <p>The page you're looking for doesn't exist or has been moved.</p>
        <a href="/" class="btn">Go to Homepage</a>
    </div>
    </form>
</body>
</html>
