<%@ Page Title="" Language="C#" MasterPageFile="Admin.master" AutoEventWireup="true"
    CodeFile="UploadGalleryImage.aspx.cs" Inherits="Admin_pages_UploadGalleryImage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <title>Upload Images</title>
    <link rel="stylesheet" type="text/css" href="Styles/manage.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="container">
        <h2>Upload Gallery Images</h2>
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
        <table>
            <tr>
                <td>Occasion:</td>
                <td>
                    <asp:TextBox ID="txtOccasion" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Select Images:</td>
                <td>
                    <asp:FileUpload ID="fileUpload" runat="server" AllowMultiple="true" /></td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnEdit" runat="server" Text="Delete Images" OnClick="btnEdit_Click" /></td>
                <td>
                    <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" /></td>
            </tr>
        </table>
    </div>
</asp:Content>
