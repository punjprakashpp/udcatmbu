<%@ Page Title="Upload Newspaper" Language="C#" MasterPageFile="Admin.master" AutoEventWireup="true" CodeFile="UploadNewspaper.aspx.cs" Inherits="Admin_pages_AddFaculty" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link rel="stylesheet" href="Styles/manage.css">
    <link rel="stylesheet" href="Styles/cropper.css">
    <script src="Script/cropper.js"></script>
    <script src="Script/jquery.js"></script>
    <style>
        .cropper-container
        {
            width: 300px;
            height: 225px;
            position: relative;
            overflow: hidden;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="container">
        <h2>
            Upload Newspaper Image</h2>
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
        <table>
            <tr>
                <td>
                    News Description:
                </td>
                <td>
                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    News Image:
                </td>
                <td>
                    <asp:FileUpload ID="fileUpload" runat="server" />
                    <asp:Label ID="lblFileTypeError" runat="server" ForeColor="Red" Visible="false">Invalid file type. Only .jpg, .jpeg, .png files are allowed.</asp:Label>
                    <div>
                        <asp:HiddenField ID="imagePreviewBase64" runat="server" />
                        <div id="cropperContainer" class="cropper-container" style="display: none;">
                            <img id="cropperImage" src="#" alt="Image for cropping" />
                        </div>
                        <asp:Button ID="btnCrop" runat="server" Text="Crop" OnClientClick="return cropImage();"
                            Style="display: none;" />
                    </div>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:Button ID="btnSave" runat="server" Text="Upload" OnClick="btnSave_Click" />
                    <asp:Button ID="btnEdit" runat="server" Text="Delete Images" OnClick="btnEdit_Click" />
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
                    // Calculate aspect ratio dynamically based on the uploaded image
                    var img = new Image();
                    img.src = e.target.result;
                    img.onload = function() {
                        var aspectRatio = img.width / img.height;
                        cropper = new Cropper(cropperImage[0], {
                            aspectRatio: 0,
                            viewMode: 1,
                            autoCropArea: 1,
                        });
                    };
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
