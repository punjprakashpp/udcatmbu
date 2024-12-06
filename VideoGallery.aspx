<%@ Page Title="Video Gallery" Language="C#" MasterPageFile="Site.master" AutoEventWireup="true" CodeFile="VideoGallery.aspx.cs" Inherits="pages_VideoGallery" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="style/gallery.css">
</asp:Content>
<asp:Content ID="ContentBody" ContentPlaceHolderID="Content" runat="Server">
    <h1 class="my-h1">Video Gallery</h1>
    <div class="cont">
        <asp:Repeater ID="linksRepeater" runat="server">
            <ItemTemplate>
                <div class="video">
                    <iframe width="560" height="315" src='<%# Eval("LinkURL") %>' title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
                    <h2><%# Eval("LinkText") %></h2>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
