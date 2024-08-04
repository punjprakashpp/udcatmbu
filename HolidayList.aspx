<%@ Page Title="Holiday List" MasterPageFile="Website.master" AutoEventWireup="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" type="text/css" href="style/site.css">
    <link rel="stylesheet" type="text/css" href="style/pdf.css">
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
            <h1 class="my-h1">TMBU Holiday List: <a class="dnld" style="color:lightseagreen;" href="docs/Uploads/HolidayList.pdf" download="HolidayList.pdf">Download PDF</a></h1>
            <div id="pdf-viewer" data-url="docs/Uploads/HolidayList.pdf">
                <!-- Canvases will be dynamically added here -->
            </div>
            <script src="script/pdf.worker.min.js"></script>
            <script src="script/pdf.min.js"></script>
            <script src="script/pdf.js"></script>
        </div>
    </div>
</asp:Content>
