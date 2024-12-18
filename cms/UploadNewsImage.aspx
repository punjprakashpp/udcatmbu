<%@ Page Title="Upload News Image" Language="C#" MasterPageFile="~/cms/cms.master" AutoEventWireup="true" CodeFile="UploadNewsImage.aspx.cs" Inherits="cms_UploadNewspaperImage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="../Content/Cropper.min.css">
    <script type="text/javascript" src="../Scripts/jquery-3.7.1.js"></script>
    <script type="text/javascript" src="../Scripts/cropper.js"></script>
    <style>
        .cropper-container {
            width: 300px;
            height: 225px;
            position: relative;
            overflow: hidden;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <div class="container">
        <div class="row">
            <div class="col col-md-6 m-auto">
                <h2 class="text-center">Upload News Image</h2>
                <div class=" table-responsive">
                    <table class="table">
                        <tr>
                            <td>News Description: </td>
                            <td>
                                <asp:TextBox ID="txtDescription" CssClass="form-control" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>Select Newspaper Image: </td>
                            <td>
                                <asp:FileUpload ID="fileUpload" runat="server" CssClass="form-control" />
                                <asp:Label ID="lblFileTypeError" runat="server" ForeColor="Red" Visible="false">Invalid file type. Only .jpg, .jpeg, .png files are allowed.</asp:Label>
                                <div>
                                    <asp:HiddenField ID="imagePreviewBase64" runat="server" />
                                    <div id="cropperContainer" class="cropper-container" style="display: none;">
                                        <img id="cropperImage" src="#" alt="Image for cropping" />
                                    </div>
                                    <asp:Button ID="btnCrop" runat="server" CssClass="form-control btn btn-secondary" Text="Crop" OnClientClick="return cropImage();" Style="display: none;" />
                                </div>
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
                            aspectRatio: 0,
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
                var canvas = cropper.getCroppedCanvas({ width: 600, height: 400 });
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
