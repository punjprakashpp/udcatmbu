﻿<%@ Page Title="Vice-Chancellor" Language="C#" MasterPageFile="Website.master" AutoEventWireup="true" CodeFile="ViceChancellor.aspx.cs" Inherits="About_Director" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" type="text/css" href="style/pages.css">
    <link rel="stylesheet" type="text/css" href="style/pdf.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content1" runat="Server">
    <div class="cont" align="center">
        <h1 class="title">Vice-Chancellor of TMBU</h1>
        <div class="dev">
            <div class="dev-img" align="center">
                <asp:Image ID="imgPerson" runat="server" /><br />
                <br />
                <h2 align="center" style="color: Red;">
                    <asp:Label ID="lblName" runat="server" /></h2>
                <p>
                    Phone No.:&nbsp;&nbsp;<b><asp:HyperLink ID="phoneLink" runat="server"><asp:Label ID="lblPhone" runat="server" /></asp:HyperLink></b><br />
                    E-Mail Id.:<b><asp:HyperLink ID="emailLink" runat="server">
                        <asp:Label ID="lblEmail" runat="server" /></asp:HyperLink></b>
                </p>
                <h5 align="left">To know more about VC <a href="#" id="openPdfLink">Click here</a></h5>
            </div>

            <div class="dev-des" align="right">
                <h2><b>Vice-Chancellor's Message</b></h2>
                <p>I'm thrilled to announce the upcoming launch of the University Department of Computer Applications' own website. It's truly inspiring to recognize the incredible work of our students who have developed it. This website will not only be a source of pride for our institution but also a valuable resource for the entire scientific community, especially benefiting our current computer course students.</p>
                <p>With this initiative, I am confident that our institution will continue to thrive, thanks to the sincere and dedicated efforts of our members. I envision this website becoming a landmark in the realm of computer science education, symbolizing our commitment to modernization and excellence.</p>
                <p>At UDCA, we believe in the transformative power of education. Our mission is to empower students with the knowledge and skills needed to thrive in a rapidly changing world. We offer a nurturing and inclusive environment where every student can explore, learn, and grow.</p>
            </div>
        </div>
        <div id="lightbox" class="lightbox">
            <div class="lightbox-content">
                <span class="close">&times;</span>
                <div id="pdf-viewer" data-url="docs/Profile/VCProfile.pdf">
                    <!-- Canvases will be dynamically added here -->
                </div>
            </div>
        </div>
        <script src="script/pdf.worker.min.js"></script>
        <script src="script/pdf.min.js"></script>
        <script src="script/pdf.js"></script>
    </div>
</asp:Content>
