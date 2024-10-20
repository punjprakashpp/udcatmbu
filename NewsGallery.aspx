<%@ Page Title="News Gallery" Language="C#" MasterPageFile="Website.master" AutoEventWireup="true" CodeFile="NewsGallery.aspx.cs" Inherits="pages_VideoGallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="style/gallery.css">
    <style>
        .thumb {
            cursor: pointer;
            display: block;
            border: 2px solid #ccc;
            transition: transform 0.3s, box-shadow 0.3s;
            width: -webkit-fill-available;
            height: -webkit-fill-available;
        }

            .thumb:hover {
                transform: scale(1.05);
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
            }

        #lightbox {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1000; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgba(0, 0, 0, 0.8); /* Black with opacity */
            text-align: center;
        }

            #lightbox img {
                margin-top: 5%; /* Add a bit of space at the top */
                max-width: 80%;
                max-height: 80%;
                border: 1px solid #ccc;
                padding: 10px;
                background: white;
            }

        .close {
            position: absolute;
            top: 50px;
            right: 35px;
            color: grey;
            font-size: 40px;
            font-weight: bold;
            cursor: pointer;
            transition: 0.3s;
        }

            .close:hover,
            .close:focus {
                color: red;
            }

        @media(max-width:768px) {
            #lightbox img {
                margin-top: 25%;
            }
        }
    </style>
    <script>
        // Function to display the image in the lightbox
        function displayImage(src) {
            var lightboxImage = document.getElementById('lightboxImage');
            var lightbox = document.getElementById('lightbox');
            lightboxImage.src = src; // Update the src of the lightbox image
            lightbox.style.display = 'block'; // Show the lightbox
        }

        // Event listener to close the lightbox when clicking outside the image
        window.onclick = function(event) {
            var lightbox = document.getElementById('lightbox');
            if (event.target === lightbox) {
                lightbox.style.display = "none"; // Close the modal if clicking outside the image
            }
        };

        // Event listener to close the lightbox when clicking the "close" button (span)
        document.addEventListener("DOMContentLoaded", function() {
            document.querySelector(".close").onclick = function() {
                var lightbox = document.getElementById('lightbox');
                lightbox.style.display = "none"; // Hide the lightbox
            };
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content1" runat="Server">
    <h1 class="my-h1">News Gallery</h1>
    <div class="cont">
        <asp:Repeater ID="NewsRepeater" runat="server">
            <ItemTemplate>
                <div class="video">
                    <!-- Clicking this image will display it in the lightbox -->
                    <a href="javascript:void(0);" onclick="displayImage('<%# Eval("ImagePath") %>')">
                        <img class="thumb" src='<%# Eval("ImagePath") %>' alt='<%# Eval("Title") %>'>
                    </a>
                    <div class="desc">
                        <h2><%# Eval("Title")%></h2>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>

    <!-- Lightbox modal -->
    <div id="lightbox">
        <span class="close">&times;</span> <!-- Close button changed to span -->
        <img id="lightboxImage" src="" alt="Image Preview">
    </div>
</asp:Content>