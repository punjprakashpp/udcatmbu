<%@ Page Title="Upload Gallery Images" Language="C#" MasterPageFile="~/cms/cms.master" AutoEventWireup="true" CodeFile="UploadGalleryImage.aspx.cs" Inherits="cms_UploadGalleryImage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <div class="container">
        <div class="row">
            <div class="col col-md-6 m-auto">
                <h2 class="text-center">Upload Gallery Images</h2>
                <table class="table table-responsive">
                    <tr>
                        <td>Occasion: </td>
                        <td>
                            <asp:TextBox ID="txtOccasion" CssClass="form-control" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Select Images of Ocassion: </td>
                        <td>
                            <asp:FileUpload ID="fileUpload" CssClass="form-control" runat="server" AllowMultiple="true" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="btnDelete" runat="server" CssClass="form-control btn btn-secondary" Text="Delete Images" OnClick="btnDelete_Click" /></td>
                        <td>
                            <asp:Button ID="btnUpload" runat="server" CssClass="form-control btn btn-primary" Text="Upload Image" OnClick="btnUpload_Click" /></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</asp:Content>