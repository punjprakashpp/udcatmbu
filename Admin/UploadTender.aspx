﻿<%@ Page Title="Upload Tender" Language="C#" MasterPageFile="Admin.master" AutoEventWireup="true" CodeFile="UploadTender.aspx.cs" Inherits="Admin_pages_UploadTender" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <link rel="stylesheet" href="Styles/manage.css">
    <link href="Styles/jquery-ui.css" rel="stylesheet" />
    <script src="Script/jquery.js"></script>
    <script src="Script/jquery-ui.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#<%= txtLinkDate.ClientID %>").datepicker({
                dateFormat: 'dd-mm-yy'
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="container">
        <h2>Upload Tender PDF</h2>
        <asp:Label ID="lblLinkNo" runat="server" Text="Tender No.:"></asp:Label>
        <asp:TextBox ID="txtLinkNo" runat="server"></asp:TextBox><br />
        <br />
        <asp:Label ID="lblLinkText" runat="server" Text="Tender Title:"></asp:Label>
        <asp:TextBox ID="txtLinkText" runat="server"></asp:TextBox><br />
        <br />
        <asp:Label ID="lblLinkDate" runat="server" Text="Tender Date:"></asp:Label>
        <asp:TextBox ID="txtLinkDate" runat="server"></asp:TextBox><br />
        <br />
        <asp:Label ID="lblFileUpload" runat="server" Text="Tender PDF:"></asp:Label>
        <asp:FileUpload ID="fileUpload" runat="server" /><br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="ButtonLink" runat="server" Text="Manage Tender" OnClick="btnSubmit_Edit" /><br />
        <br />
        <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>
