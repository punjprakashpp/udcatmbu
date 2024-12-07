<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="NewsGallery.aspx.cs" Inherits="NewsGallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="Content/gallery.css">
    <link rel="stylesheet" href="Content/pages.css">
    <script>
        // Function to display the image in the lightbox
        function displayImage(src) {
            var lightboxImage = document.getElementById('lightboxImage');
            var lightbox = document.getElementById('lightbox');
            lightboxImage.src = src; // Update the src of the lightbox image
            lightbox.style.display = 'block'; // Show the lightbox
        }

        // Event listener to close the lightbox when clicking outside the image
        window.onclick = function (event) {
            var lightbox = document.getElementById('lightbox');
            if (event.target === lightbox) {
                lightbox.style.display = "none"; // Close the modal if clicking outside the image
            }
        };

        // Event listener to close the lightbox when clicking the "close" button (span)
        document.addEventListener("DOMContentLoaded", function () {
            document.querySelector(".close").onclick = function () {
                var lightbox = document.getElementById('lightbox');
                lightbox.style.display = "none"; // Hide the lightbox
            };
        });
    </script>
</asp:Content>
<asp:Content ID="ContentBody" ContentPlaceHolderID="Content" runat="Server">
    <section class="py-5 bg-light">
        <div class="container bg-white rounded shadow-sm py-5 px-4">
            <div class="text-center bg-gradient-primary text-white p-4 rounded">
                <h1>News Gallery</h1>
            </div>
            <div class="row">
                <asp:Repeater ID="NewsRepeater" runat="server">
                    <ItemTemplate>
                        <div class="col col-lg-4 col-md-2 col-sm-1">
                            <div class="photo">
                                <a href="javascript:void(0);" onclick="displayImage('<%# Eval("ImagePath") %>')">
                                    <img class="thumbnail img-thumbnail" src='<%# Eval("ImagePath") %>' alt='<%# Eval("Title") %>'>
                                </a>
                                <div class="desc">
                                    <h2><%# Eval("Title")%></h2>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </section>
    <!-- Lightbox modal -->
    <div id="lightbox">
        <span class="close">&times;</span>
        <!-- Close button changed to span -->
        <img id="lightboxImage" src="" alt="Image Preview">
    </div>
</asp:Content>
