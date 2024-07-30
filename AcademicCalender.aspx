<%@ Page MasterPageFile="Root.master" AutoEventWireup="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Academic Calender | UDCA</title>
    <link rel="stylesheet" type="text/css" href="style/site.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="cont">
        <div class="container">
            <h1 class="my-h1">UDCA Academic Calender:</h1>
            <div id="pdf-viewer" data-url="docs/Uploads/AcademicCalender.pdf">
                <canvas id="pdf-canvas"></canvas>
            </div>
        </div>
    </div>
</asp:Content>
