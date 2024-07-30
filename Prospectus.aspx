<%@ Page MasterPageFile="Root.master" AutoEventWireup="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Prospectus | UDCA</title>
    <link rel="stylesheet" type="text/css" href="style/site.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="cont">
        <div class="container">
            <h1 class="my-h1">UDCA TMBU Prospectus:</h1>
            <div id="pdf-viewer" data-url="docs/Uploads/Prospectus.pdf">
                <!-- Canvases will be dynamically added here -->
            </div>
        </div>
    </div>
</asp:Content>
