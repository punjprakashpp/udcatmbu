<%@ Page Title="" Language="C#" MasterPageFile="Root.master" AutoEventWireup="true" CodeFile="HolidayList.aspx.cs" Inherits="pages_Holiday" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Holiday List | UDCA</title>
    <link rel="stylesheet" type="text/css" href="style/syllabus.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="cont">
        <div class="container">
            <h1 style="text-align: center; padding: 20px 0; background-color: #369; color: white; font-size: 1.8em; font-weight: bold; text-align: center; text-transform: uppercase; margin-bottom: 20px; border-top-left-radius: 10px; border-top-right-radius: 10px;">UDCA Classes Holiday List:</h1>
            <iframe id="pdf-viewer" src="doc/Uploads/HolidayList.pdf" type="application/pdf" style="height: 100vh; width: 100%;"></iframe>
        </div>
    </div>
</asp:Content>

