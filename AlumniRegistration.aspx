<%@ Page Title="" Language="C#" MasterPageFile="Root.master" AutoEventWireup="true"
    CodeFile="AlumniRegistration.aspx.cs" Inherits="pages_AlumniRegister" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Alumni Registration</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.5.12/cropper.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.5.12/cropper.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link rel="stylesheet" href="style/alumni-reg.css">
    <style>
        .cropper-container
        {
            width: 300px;
            height: 300px;
            position: relative;
            overflow: hidden;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="cont">
        <center style="color: white; background-color: #001f44;">
            <img src="../img/other/white.png" style="width:100px;" />
            <h2>Alumni Registration</h2>
        </center>
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
        <table>
            <tr>
                <td>
                    Session:
                </td>
                <td>
                    <asp:DropDownList ID="ddlSession" runat="server">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvSession" runat="server" ControlToValidate="ddlSession"
                        InitialValue="" ErrorMessage="Session is required." ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Registration No:
                </td>
                <td>
                    <asp:TextBox ID="txtRegistrationNo" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvRegistrationNo" runat="server" ControlToValidate="txtRegistrationNo"
                        ErrorMessage="Registration No is required." ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Registration Year:
                </td>
                <td>
                    <asp:TextBox ID="txtRegistrationYear" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvRegistrationYear" runat="server" ControlToValidate="txtRegistrationYear"
                        ErrorMessage="Registration Year is required." ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revRegistrationYear" runat="server" ControlToValidate="txtRegistrationYear"
                        ErrorMessage="Invalid year format." ForeColor="Red" ValidationExpression="^\d{4}$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Roll No:
                </td>
                <td>
                    <asp:TextBox ID="txtRollNo" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvRollNo" runat="server" ControlToValidate="txtRollNo"
                        ErrorMessage="Roll No is required." ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Name:
                </td>
                <td>
                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName"
                        ErrorMessage="Name is required." ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Qualification:
                </td>
                <td>
                    <asp:TextBox ID="txtQualification" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Occupation / Job:
                </td>
                <td>
                    <asp:TextBox ID="txtOccupation" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Work Location / Company:
                </td>
                <td>
                    <asp:TextBox ID="txtCompany" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Phone No:
                </td>
                <td>
                    <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Email Id:
                </td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Linkedin Id: @
                </td>
                <td>
                    <asp:TextBox ID="txtLinkedIn" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Facebook Id: @
                </td>
                <td>
                    <asp:TextBox ID="txtFacebook" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Instagram Id: @
                </td>
                <td>
                    <asp:TextBox ID="txtInstagram" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Twitter / X Id: @
                </td>
                <td>
                    <asp:TextBox ID="txtTwitter" runat="server"></asp:TextBox>
                </td>
            </tr>
            <!-- Image Upload -->
            <tr>
                <td>
                    Upload Image:
                </td>
                <td>
                    <asp:FileUpload ID="fileUpload" runat="server" />
                    <asp:Label ID="lblFileTypeError" runat="server" ForeColor="Red" Visible="false">Invalid file type. Only .jpg, .jpeg, .png files are allowed.</asp:Label>
                    <asp:RequiredFieldValidator ID="rfvFileUpload" runat="server" ControlToValidate="fileUpload"
                        ErrorMessage="Image upload is required." InitialValue="" ForeColor="Red"></asp:RequiredFieldValidator>
                    <div>
                        <asp:HiddenField ID="imagePreviewBase64" runat="server" />
                        <div id="cropperContainer" class="cropper-container" style="display: none;">
                            <img id="cropperImage" src="#" alt="Image for cropping" />
                        </div>
                        <asp:Button ID="btnCrop" runat="server" Text="Crop" OnClientClick="return cropImage();"
                            Style="display: none;" />
                        <div id="imagePreview" style="display: none;">
                            <img id="previewImage" src="#" alt="Preview Image" style="max-width: 200px; max-height: 200px;" />
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
                    <asp:CustomValidator ID="cvDuplicateCheck" runat="server" ErrorMessage="User already exists." 
                        ForeColor="Red" OnServerValidate="cvDuplicateCheck_ServerValidate"></asp:CustomValidator>
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
            var previewImage = $("#previewImage");
            var fileTypeError = $("#<%= lblFileTypeError.ClientID %>");
            var btnCrop = $("#<%= btnCrop.ClientID %>");

            fileUpload.change(function (e) {
                var file = e.target.files[0];
                if (file && (file.type === "image/jpeg" || file.type === "image/png")) {
                    fileTypeError.hide();
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        imagePreview.hide();
                        previewImage.attr("src", e.target.result).show();
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
                previewImage.attr("src", base64String).show();
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
