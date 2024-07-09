<%@ Page Title="" Language="C#" MasterPageFile="Site.master" AutoEventWireup="true" CodeFile="AddHomeButton.aspx.cs" Inherits="Admin_pages_UploadMarqueeLinks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <title>Add Buttons</title>
    <link rel="stylesheet" href="Styles/notice.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div>
        <h2>Add HOME Buttons</h2>
        <asp:Label ID="lblLinkText" runat="server" Text="Button Label:"></asp:Label>
        <asp:TextBox ID="txtLinkText" runat="server"></asp:TextBox><br /><br />
        <asp:Label ID="lblLinkURL" runat="server" Text="Link URL:"></asp:Label>
        <asp:TextBox ID="txtLinkURL" runat="server"></asp:TextBox><br /><br />
        
        <asp:Label ID="lblLinkPicker" runat="server" Text="Choose a available link:"></asp:Label>
        <asp:DropDownList ID="ddlLinkPicker" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlLinkPicker_SelectedIndexChanged">
        </asp:DropDownList><br /><br />
        
        <asp:Button ID="ButtonLink" runat="server" Text="Manage Buttons" OnClick="btnSubmit_Edit" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" /><br /><br />
        <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>
