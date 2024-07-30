﻿<%@ Page Title="" Language="C#" MasterPageFile="Root.master" AutoEventWireup="true" CodeFile="CCDC.aspx.cs" Inherits="pages_Vice_Chancellor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Pro Vice-Chancellor</title>
    <link rel="stylesheet" type="text/css" href="style/pages.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="cont" align="center">
        <h1 class="title">CCDC of TMBU</h1>
        <div class="dev">
            <div class="dev-img" align="left">
                <asp:Image ID="imgPerson" runat="server" /><br /><br />
                <h2 align="center" style="color:Red;"><asp:Label ID="lblName" runat="server" /></h2>
                <p>Phone No.:&nbsp;&nbsp;<b>not available</b><br />E-Mail Id.:<b><a href="mailto:ccdc@tmbuniv.ac.in" target="_blank">ccdc@tmbuniv.ac.in</a></b></p>
                <h5 align="left">To know more about CCDC <a href="#" id="openPdfLink">Click here</a></h5>
            </div> 
            <div class="dev-des" align="right">
                <h2><b>CCDC's Message</b></h2>
                <p>I'm thrilled to announce the upcoming launch of the University Department of Computer Applications' own website. It's truly inspiring to recognize the incredible work of our students who have developed it. This website will not only be a source of pride for our institution but also a valuable resource for the entire scientific community, especially benefiting our current computer course students.</P>
                <p>With this initiative, I am confident that our institution will continue to thrive, thanks to the sincere and dedicated efforts of our members. I envision this website becoming a landmark in the realm of computer science education, symbolizing our commitment to modernization and excellence.</p>
                <p>At UDCA, we believe in the transformative power of education. Our mission is to empower students with the knowledge and skills needed to thrive in a rapidly changing world. We offer a nurturing and inclusive environment where every student can explore, learn, and grow.</p> 
            </div>   
        </div>
        <div id="lightbox" class="lightbox">
            <div class="lightbox-content">
                <span class="close">&times;</span>
                <div id="pdf-viewer" data-url="docs/Profile/CCDCProfile.pdf">
                    <!-- Canvases will be dynamically added here -->
                </div>
            </div>
        </div>
    </div>
</asp:Content>
