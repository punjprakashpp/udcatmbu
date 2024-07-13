<%@ Page Title="" Language="C#" MasterPageFile="Root.master" AutoEventWireup="true"
    CodeFile="NewsGallery.aspx.cs" Inherits="pages_VideoGallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>News Gallery | UDCA</title>
    <link rel="stylesheet" href="style/video.css">
    <style>
        .video
        {
            flex: 1 1 calc(20% - 40px);
            margin: 20px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
            background-color: #fff;
        }
        
        @media (max-width: 768px)
        {
            .video
            {
                flex: 1 1 100%;
            }
        }
        div.gallery
        {
            margin: 5px;
            border: 1px solid #ccc;
            float: left;
            width: 180px;
        }
        
        div.gallery:hover
        {
            border: 1px solid #777;
        }
        
        div.gallery img
        {
            width: 100%;
            height: auto;
        }
        
        div.desc
        {
            padding: 15px;
            text-align: center;
        }
        
        #lightbox
        {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1000; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgba(0,0,0,0.8); /* Black with opacity */
            text-align: center;
        }
        
        #lightbox img
        {
            margin-top: 5%; /* Add a bit of space at the top */
            max-width: 80%;
            max-height: 80%;
            border: 1px solid #ccc;
            padding: 10px;
            background: white;
        }
        
        #lightbox:target
        {
            display: block; /* Show lightbox when targeted */
        }
        
        .close
        {
            position: absolute;
            top: 20px;
            right: 35px;
            color: #fff;
            font-size: 40px;
            font-weight: bold;
            text-decoration: none;
            transition: 0.3s;
        }
        
        .close:hover, .close:focus
        {
            color: #bbb;
            text-decoration: none;
            cursor: pointer;
        }
    </style>
    <script>
        function displayImage(src) {
            var lightboxImage = document.getElementById('lightboxImage');
            lightboxImage.src = src; // Update the src of the lightbox image
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1 style="text-align: center; padding: 20px 0; background-color: #369; color: white;
        font-size: 1.8em; font-weight: bold; text-align: center; text-transform: uppercase;
        margin-top: 20px; margin-bottom: 20px; border-top-left-radius: 10px; border-top-right-radius: 10px;">
        News Gallery</h1>
    <div class="cont">
        <asp:Repeater ID="NewsRepeater" runat="server">
            <ItemTemplate>
                <div class="gallery video">
                    <a href="#lightbox" onclick="displayImage('<%# Eval("ImagePath") %>')">
                        <img src='<%# Eval("ImagePath") %>' alt="Cinque Terre" width="600" height="400">
                    </a>
                    <div class="desc">
                        <h2>
                            <%# Eval("Title")%></h2>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <div id="lightbox">
        <a href="#" class="close">&times;</a>
        <img id="lightboxImage" src="" alt="">
    </div>
</asp:Content>
