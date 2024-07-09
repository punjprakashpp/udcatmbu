<%@ Page Title="" Language="C#" MasterPageFile="Site.master" AutoEventWireup="true" CodeFile="AddVideoLinks.aspx.cs" Inherits="Admin_pages_UploadMarqueeVideos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <title>Add Video Links</title>
    <link rel="stylesheet" href="Styles/notice.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div>
        <h2>Add Video Link for Video Gallery</h2>
        <asp:Label ID="lblVideoText" runat="server" Text="Video Label:"></asp:Label>
        <asp:TextBox ID="txtVideoText" runat="server"></asp:TextBox><br />
        <br />
        <asp:Label ID="lblVideoURL" runat="server" Text="Video Link URL:"></asp:Label>
        <asp:TextBox ID="txtVideoURL" runat="server"></asp:TextBox><br />
        <br />
        <asp:Button ID="ButtonVideo" runat="server" Text="Manage Links" OnClick="btnSubmit_Edit" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" /><br />
        <br />
        <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>
