<%@ Page Title="" Language="C#" MasterPageFile="Site.master" AutoEventWireup="true" CodeFile="UpdateAdministration.aspx.cs" Inherits="Admin_pages_UpdateAdministration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <title>Manage Administration Person</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.5.12/cropper.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.5.12/cropper.min.css" rel="stylesheet"/>
    <style>
        .cropper-container {
            width: 300px;
            height: 300px;
            position: relative;
            overflow: hidden;
        }

        /* Table Styles */
        table {
            width: 100%;
            max-width: 600px;
            margin: 20px auto;
            border-collapse: collapse;
        }

        table td {
            padding: 10px;
            vertical-align: top;
            font-size:16px;
        }

        table td:first-child {
            width: 30%;
            font-weight: bold;
            color: #555;
        }

        /* Input and Button Styles */
        input[type="text"], select {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            margin-top: 6px;
            margin-bottom: 16px;
            resize: vertical;
        }

        input[type="file"] {
            padding: 6px 12px;
        }

        button, input[type="button"], input[type="submit"] {
            background-color: #007BFF;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-align: center;
            display: inline-block;
        }

        button:hover, input[type="button"]:hover, input[type="submit"]:hover {
            background-color: #0056b3;
        }

        /* Image and Cropper Styles */
        .my-img {
            max-width: 100%;
            height: auto;
            display: block;
        }

        .cropper-container {
            width: 300px;
            height: 300px;
            position: relative;
            overflow: hidden;
            margin: 20px auto;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        #currentImage {
            display: block;
            margin: 20px auto;
            max-width: 225px;
            max-height: 225px;
            border: 1px solid #ddd;
            padding: 5px;
            border-radius: 4px;
        }

        #cropperContainer {
            display: none;
        }

        #cropperImage {
            max-width: 100%;
        }

        #btnCrop {
            margin-top: 10px;
        }

        /* Error Message Styles */
        .error-message {
            color: red;
            font-weight: bold;
        }

        /* Hidden Field Styles */
        .hidden {
            display: none;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div>
        <h2>Update Administration Person</h2>
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Text=""></asp:Label>
        <asp:HiddenField ID="hfPersonID" runat="server" />
        <asp:HiddenField ID="hfCurrentImagePath" runat="server" />
        <table>
            <tr>
                <td>Type:</td>
                <td>
                    <asp:DropDownList ID="ddlType" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlType_SelectedIndexChanged">
                        <asp:ListItem Text="--- Select a Person ---" Value=""></asp:ListItem>
                        <asp:ListItem Text="Chancellor" Value="Chancellor"></asp:ListItem>
                        <asp:ListItem Text="Vice-Chancellor" Value="Vice-Chancellor"></asp:ListItem>
                        <asp:ListItem Text="Pro-Vice-Chancellor" Value="Pro-Vice-Chancellor"></asp:ListItem>
                        <asp:ListItem Text="Director" Value="Director"></asp:ListItem>
                        <asp:ListItem Text="DSW" Value="DSW"></asp:ListItem>
                        <asp:ListItem Text="CCDC" Value="CCDC"></asp:ListItem>
                        <asp:ListItem Text="Registrar" Value="Registrar"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>Name:</td>
                <td><asp:TextBox ID="txtName" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Image:</td>
                <td>
                    <asp:FileUpload ID="fileUpload" runat="server" />
                    <asp:Label ID="lblFileTypeError" runat="server" ForeColor="Red" Visible="false">Invalid file type. Only .jpg, .jpeg, .png files are allowed.</asp:Label>
                    <div>
                        <img class="my-img" id="currentImage" src="#" alt="Current Image" runat="server" style="display: none; max-width: 225px; max-height: 225px;" />
                        <asp:HiddenField ID="imagePreviewBase64" runat="server" />
                        <div id="cropperContainer" class="cropper-container" style="display: none;">
                            <img class="my-img" id="cropperImage" src="#" alt="Image for cropping"/>
                        </div>
                        <asp:Button ID="btnCrop" runat="server" Text="Crop" OnClientClick="return cropImage();" style="display: none;" />
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
                </td>
            </tr>
        </table>
    </div>

    <script>
        $(document).ready(function () {
            var cropper;
            var fileUpload = $("#<%= fileUpload.ClientID %>");
            var currentImage = $("#currentImage");
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
                        currentImage.attr("src", e.target.result).show();
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
                    currentImage.hide();
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
                currentImage.attr("src", base64String).show();
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
