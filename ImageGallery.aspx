<%@ Page Title="" Language="C#" MasterPageFile="Website.master" AutoEventWireup="true"
    CodeFile="ImageGallery.aspx.cs" Inherits="pages_VideoGallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Image Gallery | UDCA</title>
    <link rel="stylesheet" href="style/gallery.css">
    <style>
        /* Modal styles */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            padding-top: 50px;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.9);
        }

        .modal-content {
            margin: auto;
            display: block;
            width: 80%;
            max-width: 700px;
            position: relative;
        }

        .mySlides {
            display: none;
        }

        .modal-img {
            width: 100%;
            height: auto;
        }

        .close {
            position: absolute;
            top: 20px;
            right: 35px;
            color: grey;
            font-size: 40px;
            font-weight: bold;
            transition: 0.3s;
            cursor: pointer;
        }

        .close:hover,
        .close:focus {
            color: red;
            text-decoration: none;
            cursor: pointer;
        }

        .prev, .next {
            cursor: pointer;
            position: absolute;
            top: 50%;
            width: auto;
            padding: 16px;
            color: white;
            font-weight: bold;
            font-size: 20px;
            transition: 0.6s ease;
            user-select: none;
            -webkit-user-select: none;
        }

        .prev {
            left: 0;
        }

        .next {
            right: 0;
        }

        .prev:hover, .next:hover {
            background-color: rgba(0, 0, 0, 0.8);
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content1" runat="Server">
    <h1 class="my-h1">Image Gallery</h1>
    <div class="cont">
        <asp:Repeater ID="GalleryRepeater" runat="server">
            <ItemTemplate>
                <div class="gallery video" width="600" height="400px">
                    <a class="openModal" href="#" data-title='<%# Eval("Title") %>' data-index='<%# Container.ItemIndex %>'>
                        <img class="thumb" src='<%# Eval("ImagePath") %>' alt='<%# Eval("Title") %>' width="600" height="400">
                    </a>
                    <div class="desc">
                        <h2><%# Eval("Title") %></h2>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>

    <!-- The Modal -->
    <div id="myModal" class="modal">
        <span class="close">&times;</span>

        <!-- Slideshow content -->
        <div class="modal-content" id="modalContent">
            <!-- Navigation buttons -->
            <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
            <a class="next" onclick="plusSlides(1)">&#10095;</a>
        </div>
    </div>

    <script>
        let slideIndex = 1;

        function showSlides(n) {
            let slides = document.getElementsByClassName("mySlides");
            if (slides.length === 0) return; // Ensure there are slides

            if (n > slides.length) { slideIndex = 1 }
            if (n < 1) { slideIndex = slides.length }
            for (let i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
            }
            slides[slideIndex - 1].style.display = "block";
        }

        function plusSlides(n) {
            showSlides(slideIndex += n);
        }

        function currentSlide(n) {
            showSlides(slideIndex = n);
        }

        document.addEventListener("DOMContentLoaded", function () {
            const modal = document.getElementById("myModal");
            const closeModal = document.querySelector(".close");

            document.querySelectorAll('.openModal').forEach(function (element) {
                element.onclick = function (event) {
                    event.preventDefault();
                    const Title = element.getAttribute('data-Title');
                    const index = element.getAttribute('data-index');
                    fetchModalContent(Title, index);
                };
            });

            closeModal.onclick = function () {
                modal.style.display = "none";
            };

            window.onclick = function (event) {
                if (event.target === modal) {
                    modal.style.display = "none";
                }
            };
        });

        function fetchModalContent(Title, index) {
            const modalContent = document.getElementById("modalContent");
            const xhr = new XMLHttpRequest();
            xhr.open("GET", "ImageGallery.aspx?Title=" + encodeURIComponent(Title), true);
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    modalContent.innerHTML = xhr.responseText + modalContent.innerHTML;
                    currentSlide(1);
                    document.getElementById("myModal").style.display = "block";
                }
            };
            xhr.send();
        }
    </script>
</asp:Content>
