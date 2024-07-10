<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site.master" AutoEventWireup="true" CodeFile="RemoveOtherUser.aspx.cs" Inherits="Admin_RemoveOtherUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <title>Remove User</title>
    <style>
        .bg {
    background-color: #ffffff;
    border: 1px solid #ddd;
    border-radius: 4px;
    padding: 20px;
    max-width: 500px;
    margin: 50px auto;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h2 {
    color: #333;
    text-align: center;
    margin-bottom: 20px;
}

table {
    width: 100%;
    border-collapse: collapse;
}

td {
    padding: 10px;
    vertical-align: middle;
}

select, input[type="submit"] {
    width: 100%;
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 16px;
}

select {
    background-color: #fff;
}

input[type="submit"] {
    background-color: #007bff;
    color: #fff;
    border: none;
    cursor: pointer;
    font-size: 16px;
}

input[type="submit"]:hover {
    background-color: #0056b3;
}

span {
    display: block;
    margin-top: 10px;
    font-size: 14px;
}

span.error {
    color: #ff0000;
}

span.success {
    color: #28a745;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="bg">
        <h2>Remove Other User(s)</h2>
        <table>
            <tr>
                <td>User Name:</td>
                <td>
                    <asp:DropDownList ID="ddlUserNames" runat="server"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="btnRemoveUser" runat="server" Text="Remove User" OnClick="btnRemoveUser_Click" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
