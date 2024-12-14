<%@ Page Title="Image Gallery" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="ImageGallery.aspx.cs" Inherits="ImageGallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" type="text/css" href="Styles/gallery.css">
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

    <script type="text/javascript" src="Scripts/gallery.js"></script>
</asp:Content>
