﻿<%@ Page Title="Upload Student Data" Language="C#" MasterPageFile="Admin.master" AutoEventWireup="true" CodeFile="UploadStudentData.aspx.cs" Inherits="UploadStudentData" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link rel="stylesheet" href="Styles/manage.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="container">
        <h2>Upload Student Data</h2>
        <asp:FileUpload ID="fileUpload" runat="server" CssClass="txt" />
        <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" CssClass="btn" /><br />
        <asp:Label ID="lblmsg" runat="server"></asp:Label>
    </div>
</asp:Content>

