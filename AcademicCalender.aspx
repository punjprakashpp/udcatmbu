<%@ Page Title="Academic Calender" MasterPageFile="Website.master" AutoEventWireup="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" type="text/css" href="style/site.css">
    <style>
        .dnld {
            text-align: center;
            text-decoration: none;
            display: inline-block;
            cursor: pointer;
            border: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content1" runat="Server">
    <div class="cont">
        <div class="container">
            <h1 class="my-h1">UDCA Academic Calender: <a class="dnld" style="color:lightseagreen;" href="docs/Uploads/AcademicCalender.pdf" download="AcademicCalender.pdf">Download PDF</a></h1>
            <iframe style="width:100%;" src = "/ViewerJS/#../docs/Uploads/AcademicCalender.pdf" width='' height='768' allowfullscreen webkitallowfullscreen></iframe>
        </div>
    </div>
</asp:Content>
