<%@ Page Title="Add Faculty Members" Language="C#" MasterPageFile="cms.master" AutoEventWireup="true" CodeFile="AddFacultyMember.aspx.cs" Inherits="Admin_pages_AddFaculty" %>

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
    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-lg-8 col-md-10">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <h2 class="card-title text-center mb-4">Add Faculty Members</h2>
                        <asp:Label ID="lblMessage" runat="server" ForeColor="Red" CssClass="d-block mb-3"></asp:Label>
                        <div class="mb-3">
                            <label for="ddlType" class="form-label">Faculty Type:</label>
                            <asp:DropDownList ID="ddlType" runat="server" CssClass="form-select">
                                <asp:ListItem Text="Faculty Member" Value="Faculty"></asp:ListItem>
                                <asp:ListItem Text="Guest Faculty" Value="Guest"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="mb-3">
                            <label for="ddlStatus" class="form-label">Faculty Status:</label>
                            <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-select">
                                <asp:ListItem Text="Current" Value="Current"></asp:ListItem>
                                <asp:ListItem Text="Former" Value="Former"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="mb-3">
                            <label for="txtName" class="form-label">Name:</label>
                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <label for="txtQualification" class="form-label">Qualification:</label>
                            <asp:TextBox ID="txtQualification" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <label for="txtPosition" class="form-label">Position:</label>
                            <asp:TextBox ID="txtPosition" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <label for="txtPhone" class="form-label">Phone:</label>
                            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <label for="txtEmail" class="form-label">Email:</label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <label for="fileUpload" class="form-label">Image:</label>
                            <asp:FileUpload ID="fileUpload" runat="server" CssClass="form-control" />
                            <asp:Label ID="lblFileTypeError" runat="server" ForeColor="Red" CssClass="d-block mt-2" Visible="false">Invalid file type. Only .jpg, .jpeg, .png files are allowed.</asp:Label>
                            <div class="mt-3">
                                <asp:HiddenField ID="imagePreviewBase64" runat="server" />
                                <div id="cropperContainer" class="cropper-container" style="display: none;">
                                    <img id="cropperImage" src="#" alt="Image for cropping" class="img-fluid" />
                                </div>
                                <asp:Button ID="btnCrop" runat="server" Text="Crop" OnClientClick="return cropImage();" CssClass="btn btn-secondary mt-2" Style="display: none;" />
                            </div>
                        </div>
                        <div class="d-flex justify-content-between">
                            <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" CssClass="btn btn-primary" />
                            <asp:Button ID="btnEdit" runat="server" Text="Manage" OnClick="btnEdit_Click" CssClass="btn btn-secondary" />
                        </div>
                    </div>
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
