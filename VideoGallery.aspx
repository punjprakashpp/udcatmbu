<%@ Page Title="Video Gallery" Language="C#" MasterPageFile="Site.master" AutoEventWireup="true" CodeFile="VideoGallery.aspx.cs" Inherits="pages_VideoGallery" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="Content/gallery.css">
    <link rel="stylesheet" href="Content/pages.css">
</asp:Content>
<asp:Content ID="ContentBody" ContentPlaceHolderID="Content" runat="Server">
    <section class="py-5 bg-light">
        <div class="container bg-white rounded shadow-sm py-5 px-4">
            <div class="text-center bg-gradient-primary text-white p-4 rounded">
                <h1>Video Gallery</h1>
            </div>
            <div class="row">
                <asp:Repeater ID="linksRepeater" runat="server">
                    <ItemTemplate>
                        <div class="col col col-lg-4 col-md-2 col-sm-1">
                            <div class="video">
                                <iframe width="560" height="315" src='<%# Eval("LinkURL") %>' title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
                                <h2><%# Eval("LinkText") %></h2>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </section>
</asp:Content>
