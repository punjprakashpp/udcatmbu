<%@ Page Title="" Language="C#" MasterPageFile="Website.master" AutoEventWireup="true"
    CodeFile="NewsGallery.aspx.cs" Inherits="pages_VideoGallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>News Gallery | UDCA</title>
    <link rel="stylesheet" href="style/gallery.css">
    <style>
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
            color: grey;
            font-size: 40px;
            font-weight: bold;
            text-decoration: none;
            transition: 0.3s;
        }

        .close:hover,
        .close:focus {
            color: red;
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
<asp:Content ID="Content2" ContentPlaceHolderID="Content1" runat="Server">
    <h1 class="my-h1">News Gallery</h1>
    <div class="cont">
        <asp:Repeater ID="NewsRepeater" runat="server">
            <ItemTemplate>
                <div class="gallery video">
                    <a href="#lightbox" onclick="displayImage('<%# Eval("ImagePath") %>')">
                        <img class="thumb" src='<%# Eval("ImagePath") %>' alt="Cinque Terre" width="600" height="400">
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
