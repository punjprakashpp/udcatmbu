<%@ Page Title="Campus Map" MasterPageFile="Website.master" AutoEventWireup="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" type="text/css" href="style/site.css">
    <link rel="stylesheet" type="text/css" href="style/pdf.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content1" runat="Server">
    <div class="cont">
        <div class="container">
            <h1 class="my-h1">Campus Map:</h1>
            <div id="pdf-viewer" data-url="docs/Uploads/CampusMap.pdf">
                <!-- Canvases will be dynamically added here -->
            </div>
            <script src="script/pdf.worker.min.js"></script>
            <script src="script/pdf.min.js"></script>
            <script src="script/pdf.js"></script>
        </div>
    </div>
</asp:Content>
