<%@ Page Title="Image Gallery" Language="C#" MasterPageFile="Website.master" AutoEventWireup="true" CodeFile="ImageGallery.aspx.cs" Inherits="pages_ImageGallery" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="style/image.css">
    <link rel="stylesheet" href="style/gallery.css">
</asp:Content>

<asp:Content ID="ContentBody" ContentPlaceHolderID="Content" runat="Server">
    <h1 class="my-h1">Image Gallery</h1>
    <div class="cont">
        <asp:Repeater ID="ThumbnailRepeater" runat="server">
            <ItemTemplate>
                <div class="video">
                    <img src='<%# Eval("ImagePath") %>' class="thumbnail" alt='<%# Eval("Title") %>' onclick="openLightbox('<%# Eval("Title") %>')">
                    <div class="desc">
                        <h2><%# Eval("Title") %></h2>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>

    <!-- The lightbox for displaying the gallery -->
    <div id="galleryLightbox" class="lightbox" style="display: none;">
        <span class="close" onclick="closeGalleryLightbox()">&times;</span>
        <div class="gallery">
            <!-- Gallery images will be loaded here dynamically -->
        </div>
    </div>

    <!-- The lightbox for displaying clicked images -->
    <div id="lightbox" style="display: none;">
        <span class="close" onclick="closeLightbox()">&times;</span>
        <img id="lightboxImage" src="" alt="Expanded Image">
    </div>
    <script>
        function openLightbox(title) {
            document.getElementById('galleryLightbox').style.display = 'block';
            loadGalleryImages(title); // Load images corresponding to the clicked thumbnail
        }

        function closeGalleryLightbox() {
            document.getElementById('galleryLightbox').style.display = 'none';
        }

        function displayImage(src) {
            document.getElementById('lightboxImage').src = src;
            document.getElementById('lightbox').style.display = 'block';
        }

        function closeLightbox() {
            document.getElementById('lightbox').style.display = 'none';
        }

        // Event listener to close the lightbox when clicking outside of the image
        window.onclick = function (event) {
            const lightbox = document.getElementById('lightbox');
            const galleryLightbox = document.getElementById('galleryLightbox');
            if (event.target === lightbox) {
                lightbox.style.display = 'none'; // Hide the image lightbox
            } else if (event.target === galleryLightbox) {
                galleryLightbox.style.display = 'none'; // Hide the gallery lightbox
            }
        };

        function loadGalleryImages(title) {
            const xhr = new XMLHttpRequest();
            xhr.open("GET", "ImageGallery.aspx?Title=" + encodeURIComponent(title), true);
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    const galleryContainer = document.getElementById('galleryLightbox').getElementsByClassName('gallery')[0];
                    galleryContainer.innerHTML = xhr.responseText; // Populate gallery images
                }
            };
            xhr.send();
        }
    </script>
</asp:Content>
