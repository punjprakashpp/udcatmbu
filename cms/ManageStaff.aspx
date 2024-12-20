﻿<%@ Page Title="Manage Staff" Language="C#" MasterPageFile="cms.master" AutoEventWireup="true" CodeFile="ManageStaff.aspx.cs" Inherits="Admin_pages_EditFaculty" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="Styles/manage.css">
    <link rel="stylesheet" href="Content/Cropper.min.css">
    <script src="Script/cropper.js"></script>
    <script src="Script/jquery.js"></script>
    <style>
        .cropper-container {
            width: 300px;
            height: 300px;
            position: relative;
            overflow: hidden;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <div class="container">
        <h2>Manage Staff</h2>
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
        <table>
            <tr>
                <td>Select Staff:</td>
                <td>
                    <asp:DropDownList ID="ddlFaculties" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlFaculties_SelectedIndexChanged"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>Staff Type:</td>
                <td>
                    <asp:DropDownList ID="ddlType" runat="server">
                        <asp:ListItem Text="Office Staff" Value="Office"></asp:ListItem>
                        <asp:ListItem Text="Supporting Staff" Value="Support"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>Name:</td>
                <td><asp:TextBox ID="txtName" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Qualification:</td>
                <td><asp:TextBox ID="txtQualification" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Position:</td>
                <td><asp:TextBox ID="txtPosition" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Phone:</td>
                <td><asp:TextBox ID="txtPhone" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Email:</td>
                <td><asp:TextBox ID="txtEmail" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Image:</td>
                <td>
                    <asp:FileUpload ID="fileUpload" runat="server" />
                    <asp:Label ID="lblFileTypeError" runat="server" ForeColor="Red" Visible="false">Invalid file type. Only .jpg, .jpeg, .png files are allowed.</asp:Label>
                    <div>
                        <img id="currentImage" src="#" alt="Current Image" runat="server" style="display: none; max-width: 225px; max-height: 225px;" />
                        <asp:HiddenField ID="imagePreviewBase64" runat="server" />
                        <div id="cropperContainer" class="cropper-container" style="display: none;">
                            <img id="cropperImage" src="#" alt="Image for cropping"/>
                        </div>
                        <asp:Button ID="btnCrop" runat="server" Text="Crop" OnClientClick="return cropImage();" style="display: none;" />
                    </div>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" />
                </td>
            </tr>
        </table>
    </div>

    <script>
        $(document).ready(function () {
            var cropper;
            var fileUpload = $("#<%= fileUpload.ClientID %>");
            var imagePreview = $("#imagePreview");
            var cropperContainer = $("#cropperContainer");
            var cropperImage = $("#cropperImage");
            var fileTypeError = $("#<%= lblFileTypeError.ClientID %>");
            var btnCrop = $("#<%= btnCrop.ClientID %>");

            fileUpload.change(function (e) {
                var file = e.target.files[0];
                if (file && (file.type === "image/jpeg" || file.type === "image/png")) {
                    fileTypeError.hide();
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        imagePreview.attr("src", e.target.result).show();
                        cropperImage.attr("src", e.target.result);
                        cropperContainer.show();
                        btnCrop.show();

                        if (cropper) {
                            cropper.destroy();
                        }
                        cropper = new Cropper(cropperImage[0], {
                            aspectRatio: 1,
                            viewMode: 1,
                            autoCropArea: 1,
                        });
                    }
                    reader.readAsDataURL(file);
                } else {
                    fileTypeError.show();
                    imagePreview.hide();
                    cropperContainer.hide();
                    btnCrop.hide();
                    if (cropper) {
                        cropper.destroy();
                    }
                }
            });

            window.cropImage = function () {
                var canvas = cropper.getCroppedCanvas({ width: 225, height: 225 });
                var base64String = canvas.toDataURL();
                $("#<%= imagePreviewBase64.ClientID %>").val(base64String); // Set the base64 string to the hidden field
                imagePreview.attr("src", base64String).show();
                cropperContainer.hide();
                btnCrop.hide();
                if (cropper) {
                    cropper.destroy();
                }
                return false;
            }
        });
    </script>
</asp:Content>
