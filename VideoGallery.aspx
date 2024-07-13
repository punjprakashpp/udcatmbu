<%@ Page Title="" Language="C#" MasterPageFile="Root.master" AutoEventWireup="true" CodeFile="VideoGallery.aspx.cs" Inherits="pages_VideoGallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Video Gallery | UDCA</title>
    <link rel="stylesheet" href="style/video.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1 style="text-align: center; padding: 20px 0; background-color: #369; color: white; font-size: 1.8em; font-weight: bold; text-align: center; text-transform: uppercase; margin-top: 20px; margin-bottom: 20px; border-top-left-radius: 10px; border-top-right-radius: 10px;">Video Gallery</h1>
    <div class="cont">
        <asp:Repeater ID="linksRepeater" runat="server">
            <ItemTemplate>
                <div class="video">
                    <iframe width="560" height="315" src='<%# "https://www.youtube.com/embed/" + Eval("LinkURL") %>' title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
                    <h2><%# Eval("LinkText") %></h2>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>

