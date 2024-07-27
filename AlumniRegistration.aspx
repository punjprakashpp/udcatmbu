<%@ Page Title="" Language="C#" MasterPageFile="Root.master" AutoEventWireup="true" CodeFile="AlumniRegistration.aspx.cs" Inherits="pages_AlumniRegister" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Alumni Registration</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.5.12/cropper.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.5.12/cropper.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link rel="stylesheet" href="style/site.css">
    <link rel="stylesheet" href="style/alumni.css">
    <style>
        .cropper-container {
            width: 300px;
            height: 300px;
            position: relative;
            overflow: hidden;
        }

        .cont .container {
            max-width: 720px;
        }

        .cont .center {
            color: white; 
            text-align:center;
            background-color: #001f44;
        }

        .cont .center img {
            width: 80px;
        }

        .cont .center h2 {
            color:white;
            padding:0;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="cont">
        <div class="container">
            <div class="center">
                <img src="img/other/white.png"/>
                <h2>Alumni Registration</h2>
            </div>
            <table>
                <tr>
                    <td></td>
                    <td>
                        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label></td>
                </tr>
                <tr>
                    <td>Session:
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlSession" runat="server">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvSession" runat="server" ControlToValidate="ddlSession"
                            InitialValue="" ErrorMessage="Session is required." ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>Registration No:
                    </td>
                    <td>
                        <asp:TextBox ID="txtRegistrationNo" placeholder="e.g. 184630004" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvRegistrationNo" runat="server" ControlToValidate="txtRegistrationNo"
                            ErrorMessage="Registration No is required." ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revRegistrationNo" runat="server" ControlToValidate="txtRegistrationNo"
                            ErrorMessage="Registration No should be only numerals." ForeColor="Red" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>Registration Year:
                    </td>
                    <td>
                        <asp:TextBox ID="txtRegistrationYear" placeholder="e.g. 2018" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvRegistrationYear" runat="server" ControlToValidate="txtRegistrationYear"
                            ErrorMessage="Registration Year is required." ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revRegistrationYear" runat="server" ControlToValidate="txtRegistrationYear"
                            ErrorMessage="Invalid year format." ForeColor="Red" ValidationExpression="^\d{4}$"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>Roll No:
                    </td>
                    <td>
                        <asp:TextBox ID="txtRollNo" placeholder="e.g. 2210" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvRollNo" runat="server" ControlToValidate="txtRollNo"
                            ErrorMessage="Roll No is required." ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revRollNo" runat="server" ControlToValidate="txtRollNo"
                            ErrorMessage="Roll No should be only numerals." ForeColor="Red" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>Name:
                    </td>
                    <td>
                        <asp:TextBox ID="txtName" placeholder="e.g. Punj Prakash" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName"
                            ErrorMessage="Name is required." ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>Qualification:
                    </td>
                    <td>
                        <asp:TextBox ID="txtQualification" placeholder="e.g. MCA" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Occupation / Job:
                    </td>
                    <td>
                        <asp:TextBox ID="txtOccupation" placeholder="e.g. Full Stack Developer" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Work Location / Company:
                    </td>
                    <td>
                        <asp:TextBox ID="txtCompany" placeholder="e.g. Bhagalpur" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Phone No:
                    </td>
                    <td>
                        <asp:TextBox ID="txtPhone" placeholder="e.g. 9060311534  Don't add +91 or 0 before it" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="revPhoneNo" runat="server" ControlToValidate="txtPhone"
                            ErrorMessage="Phone No should be 10 digits." ForeColor="Red" ValidationExpression="^\d{10}$"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>Email Id:
                    </td>
                    <td>
                        <asp:TextBox ID="txtEmail" placeholder="e.g. punjprakashpp@gmail.com" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
                            ErrorMessage="Invalid Email format." ForeColor="Red" ValidationExpression="^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>Linkedin Id: @
                    </td>
                    <td>
                        <asp:TextBox ID="txtLinkedIn" placeholder="e.g. punjprakashpp" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Facebook Id: @
                    </td>
                    <td>
                        <asp:TextBox ID="txtFacebook" placeholder="e.g. punjprakashop" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Instagram Id: @
                    </td>
                    <td>
                        <asp:TextBox ID="txtInstagram" placeholder="e.g. punjprakashpp" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Twitter / X Id: @
                    </td>
                    <td>
                        <asp:TextBox ID="txtTwitter" placeholder="e.g. punjprakashpp" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <!-- Image Upload -->
                <tr>
                    <td>Upload Image:
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
                    <td></td>
                    <td>
                        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
                        <asp:CustomValidator ID="cvDuplicateCheck" runat="server" ErrorMessage="User already exists."
                            ForeColor="Red" OnServerValidate="cvDuplicateCheck_ServerValidate"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Label ID="lblmsg" runat="server" ForeColor="Green"></asp:Label></td>
                </tr>
            </table>
        </div>
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
