<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site.master" AutoEventWireup="true"
    CodeFile="UploadGalleryImage.aspx.cs" Inherits="Admin_pages_UploadGalleryImage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <title>Upload Images</title>
    <link rel="stylesheet" type="text/css" href="../Styles/gallery.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="upload-container">
            <h2>Upload Gallery Images</h2>
            <div class="form-group">
                <label for="txtOccasion">Occasion:</label>
                <asp:TextBox ID="txtOccasion" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="fileUpload">Select Images:</label>
                <asp:FileUpload ID="fileUpload" runat="server" AllowMultiple="true" />
            </div>
            <div class="form-group">
                <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnEdit" runat="server" Text="Delete Images" OnClick="btnEdit_Click" />
            </div>
            <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
        </div>
</asp:Content>
