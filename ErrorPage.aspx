<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ErrorPage.aspx.cs" Inherits="ErrorPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Error - Something Went Wrong</title>
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
        <h1>Oops! Something Went Wrong.</h1>
        <p>Sorry for the inconvenience. An unexpected error occurred. Please try again later.</p>
        <a href="/" class="btn">Return to Home</a>
    </div>
    </form>
</body>
</html>
