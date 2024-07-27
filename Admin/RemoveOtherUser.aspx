<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site.master" AutoEventWireup="true" CodeFile="RemoveOtherUser.aspx.cs" Inherits="Admin_RemoveOtherUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <title>Remove Other User</title>
    <link rel="stylesheet" type="text/css" href="Styles/account.css" />
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
