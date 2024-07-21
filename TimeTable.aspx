<%@ Page MasterPageFile="Root.master" AutoEventWireup="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Time Table | UDCA</title>
    <link rel="stylesheet" type="text/css" href="style/syllabus.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="cont">
        <div class="container">
            <h1 class="my-h1">Time Table:</h1>
            <div id="pdf-viewer" data-url="docs/Uploads/TimeTable.pdf">
                <!-- Canvases will be dynamically added here -->
            </div>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.9.359/pdf.min.js"></script>
            <script src="script/PdfViewer.js"></script>
        </div>
    </div>
</asp:Content>

