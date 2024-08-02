<%@ Page MasterPageFile="Website.master" AutoEventWireup="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Holiday List | UDCA</title>
    <link rel="stylesheet" type="text/css" href="style/site.css">
    <link rel="stylesheet" type="text/css" href="style/PdfViewer.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content1" runat="Server">
    <div class="cont">
        <div class="container">
            <h1 class="my-h1">TMBU Holiday List:</h1>
            <div id="pdf-viewer" data-url="docs/Uploads/HolidayList.pdf">
                <!-- Canvases will be dynamically added here -->
            </div>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.9.359/pdf.min.js"></script>
            <script src="script/PdfViewer.js"></script>
        </div>
    </div>
</asp:Content>
