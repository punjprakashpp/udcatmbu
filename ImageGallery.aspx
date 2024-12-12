<%@ Page Title="Image Gallery" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="ImageGallery.aspx.cs" Inherits="ImageGallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        /* Lightbox for the gallery */
        .lightbox {
            display: none;
            position: fixed;
            z-index: 1030;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.8);
            text-align: center;
            overflow: auto;
        }

            .lightbox .gallery {
                display: flex;
                justify-content: center;
                flex-wrap: wrap;
                padding: 20px;
                margin: 5px;
                margin-top: 100px;
                border: 1px solid #ccc;
                float: left;
                width: 300px;
            }

                .lightbox .gallery img {
                    width: 100%;
                    height: auto;
                    margin: 10px;
                    cursor: pointer;
                    border: 2px solid #ddd;
                    transition: transform 0.3s, box-shadow 0.3s;
                }

                    .lightbox .gallery img:hover {
                        border: 1px solid #777;
                        transform: scale(1.1);
                        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
                    }

        /* Lightbox for displaying clicked images */
        #lightbox {
            display: none;
            position: fixed;
            z-index: 1031;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.8);
            text-align: center;
        }

            #lightbox img {
                margin-top: 5%;
                max-width: 80%;
                max-height: 80%;
                border: 1px solid #ccc;
                padding: 10px;
                display: inline-block;
            }

        .close {
            position: absolute;
            top: 50px;
            right: 35px;
            color: grey;
            font-size: 40px;
            font-weight: bold;
            cursor: pointer;
            transition: color 0.3s;
        }

            .close:hover {
                color: red;
            }

        /* Responsive Layout */
        @media (max-width: 768px) {
            .lightbox .gallery {
                width: 200px;
            }

            #lightbox img {
                margin-top: 25%;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <section class="py-4 bg-light">
        <div class="container bg-white rounded shadow-sm p-4">
            <h1 class="text-center text-primary border-bottom pb-3">Image Gallery</h1>

            <!-- Message Section -->
            <asp:Label ID="lblMessage" runat="server" CssClass="d-block alert text-center"></asp:Label>

            <div class="row g-4 mt-4">
                <asp:Repeater ID="ThumbnailRepeater" runat="server">
                    <ItemTemplate>
                        <div class="col-lg-4 col-md-6 col-sm-12">
                            <div class="card h-100 shadow-sm">
                                <img src='<%# Eval("ImagePath") %>' class="card-img-top img-thumbnail" alt='<%# Eval("Title") %>' onclick="openLightbox('<%# Eval("Title") %>')">
                                <div class="card-body">
                                    <h5 class="card-title text-center text-dark"><%# Eval("Title") %></h5>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </section>

    <!-- Lightbox for the gallery -->
    <div id="galleryLightbox" class="lightbox" style="display: none;">
        <button type="button" class="btn-close btn-close-white position-absolute top-0 end-0 m-4" aria-label="Close" onclick="closeGalleryLightbox()"></button>
        <div class="d-flex flex-wrap justify-content-center align-items-center gallery"></div>
    </div>

    <!-- Lightbox for displaying clicked images -->
    <div id="lightbox" style="display: none;">
        <button type="button" class="btn-close btn-close-white position-absolute top-0 end-0 m-4" aria-label="Close" onclick="closeLightbox()"></button>
        <div class="d-flex justify-content-center align-items-center vh-100">
            <img id="lightboxImage" class="img-fluid border border-light shadow" src="" alt="Expanded Image">
        </div>
    </div>

    <script>
        function openLightbox(title) {
            document.getElementById('galleryLightbox').style.display = 'block';
            loadGalleryImages(title);
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

        window.onclick = function (event) {
            const lightbox = document.getElementById('lightbox');
            const galleryLightbox = document.getElementById('galleryLightbox');
            if (event.target === lightbox) {
                lightbox.style.display = 'none';
            } else if (event.target === galleryLightbox) {
                galleryLightbox.style.display = 'none';
            }
        };

        function loadGalleryImages(title) {
            const xhr = new XMLHttpRequest();
            xhr.open("GET", "ImageGallery.aspx?Title=" + encodeURIComponent(title), true);
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    const galleryContainer = document.getElementById('galleryLightbox').getElementsByClassName('gallery')[0];
                    galleryContainer.innerHTML = xhr.responseText;
                }
            };
            xhr.send();
        }
    </script>
</asp:Content>
