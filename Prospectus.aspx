<%@ Page Title="Prospectus" MasterPageFile="Website.master" AutoEventWireup="true" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" type="text/css" href="style/site.css">
</asp:Content>
<asp:Content ID="ContentBody" ContentPlaceHolderID="Content" runat="Server">
    <div class="cont">
        <div class="container">
            <h1 class="my-h1">UDCA TMBU Prospectus: <a class="dnld" style="color:lightseagreen;" href="docs/Uploads/Prospectus.pdf" download="Prospectus.pdf">Download PDF</a></h1>
            <iframe src = "/pdfjs/web/viewer.html?file=/docs/Uploads/Prospectus.pdf" allowfullscreen webkitallowfullscreen></iframe>
        </div>
    </div>
</asp:Content>
