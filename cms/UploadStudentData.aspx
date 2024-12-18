<%@ Page Title="Upload Student Data" Language="C#" MasterPageFile="cms.master" AutoEventWireup="true" CodeFile="UploadStudentData.aspx.cs" Inherits="UploadStudentData" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="Styles/manage.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <div class="container">
        <h2>Upload Student Data</h2>
        <asp:FileUpload ID="fileUpload" runat="server" CssClass="txt" />
        <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" CssClass="btn" /><br />
        <asp:Label ID="lblmsg" runat="server"></asp:Label>
        <asp:HyperLink ID="HyperLink1" NavigateUrl="~/Admin/StudentReport.aspx" runat="server">Click here to view Student Report</asp:HyperLink>
    </div>
</asp:Content>

