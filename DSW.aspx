<%@ Page Title="" Language="C#" MasterPageFile="Root.master" AutoEventWireup="true" CodeFile="DSW.aspx.cs" Inherits="pages_Vice_Chancellor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>DSW</title>
    <link rel="stylesheet" type="text/css" href="style/pages.css">
    <link rel="stylesheet" type="text/css" href="style/PdfViewer.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="cont" align="center">
        <h1 class="title">Pro Vice-Chancellor of TMBU</h1>
        <div class="dev">
            <div class="dev-img" align="left">
                <asp:Image ID="imgPerson" runat="server" /><br /><br />
                <h2 align="center" style="color:Red;"><asp:Label ID="lblName" runat="server" /></h2>
                <h3 > DSW of <b>TMBU</b></h3>
                <p>Phone No.:&nbsp;&nbsp;<b>0641-2620125</b><br />E-Mail Id.:<b><a href="mailto:dsw@tmbuniv.ac.in" target="_blank">dsw@tmbuniv.ac.in</a></b></p>
                <h5 align="left">To know more about DSW <a href="#" id="openPdfLink">Click here</a></h5>
            </div> 
            <div class="dev-des" align="right">
                <h2><b>DSW's Message</b></h2>
                <p>I'm thrilled to announce the upcoming launch of the University Department of Computer Applications' own website. It's truly inspiring to recognize the incredible work of our students who have developed it. This website will not only be a source of pride for our institution but also a valuable resource for the entire scientific community, especially benefiting our current computer course students.</P>
                <p>With this initiative, I am confident that our institution will continue to thrive, thanks to the sincere and dedicated efforts of our members. I envision this website becoming a landmark in the realm of computer science education, symbolizing our commitment to modernization and excellence.</p>
                <p>At UDCA, we believe in the transformative power of education. Our mission is to empower students with the knowledge and skills needed to thrive in a rapidly changing world. We offer a nurturing and inclusive environment where every student can explore, learn, and grow.</p> 
            </div>   
        </div>
        <div id="lightbox" class="lightbox">
            <div class="lightbox-content">
                <span class="close">&times;</span>
                <div id="pdf-viewer" data-url="docs/Profile/DSWProfile.pdf">
                    <!-- Canvases will be dynamically added here -->
                </div>
            </div>
        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.9.359/pdf.min.js"></script>
        <script src="script/PdfViewer.js"></script>
    </div>
</asp:Content>

