<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="AddAchivers.aspx.cs" Inherits="Admin_AddAchivers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link rel="stylesheet" href="Styles/cropper.css">
    <script src="Script/cropper.js"></script>
    <script src="Script/jquery.js"></script>
    <style>
        .cropper-container {
            width: 300px;
            height: 300px;
            position: relative;
            overflow: hidden;
        }

        /* General Styles */
        .cont {
            display: flex;
            flex-direction: column;
            align-items: center;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
            transition: box-shadow 0.3s ease;
        }

            .cont:hover {
                box-shadow: 0 0 30px rgba(0, 0, 0, 0.2);
            }

            .cont .container {
                background-color: #fff;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                margin-top: 20px;
                width: 90%;
                max-width: 720px;
            }

            .cont .center {
                color: white;
                text-align: center;
                background-color: #001f44;
            }

                .cont .center img {
                    width: 300px;
                }

            .cont h1, .cont h2 {
                margin: 0;
                padding: 20px 0;
                text-align: center;
            }

            .cont h1 {
                background-color: #369;
                color: #fff;
                font-size: 1.8em;
                font-weight: bold;
                text-transform: uppercase;
                border-radius: 10px 10px 0 0;
            }

            .cont h2 {
                color: #369;
                transition: color 0.3s ease;
            }

                .cont h2:hover {
                    color: #266b94;
                }

            .cont ul {
                list-style: none;
                padding: 0;
                margin: 0;
            }

            .cont li {
                margin-bottom: 10px;
            }

            .cont a {
                color: blue;
                text-decoration: none;
                transition: color 0.3s ease;
            }

                .cont a:hover {
                    text-decoration: underline;
                }

            .cont .related-links a {
                display: inline-block;
                margin: 10px;
                padding: 10px 20px;
                color: #fff;
                background-color: #369;
                border-radius: 5px;
                text-decoration: none;
                transition: background-color 0.3s ease;
            }

                .cont .related-links a:hover {
                    background-color: #266b94;
                }

            .cont .effect {
                transition: transform 0.3s ease, color 0.3s ease;
            }

                .cont .effect:hover {
                    transform: scale(1.05);
                    color: #333;
                }

            .cont .note {
                color: red;
                font-style: italic;
            }

            /* Table Styles */
            .cont table {
                width: 100%;
                border-collapse: collapse;
            }

            .cont th,
            .cont td {
                border: 1px solid #ddd;
                padding: 10px;
                text-align: left;
            }

            .cont th {
                background-color: #f2f2f2;
            }

            .cont td a {
                text-decoration: none;
                color: blue;
            }

                .cont td a:hover {
                    text-decoration: underline;
                }

            .cont table tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            .cont table tr:hover {
                background-color: #ddd;
            }

        /* Input Styles */
        input[type="text"],
        select,
        textarea {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            margin-top: 5px;
            resize: vertical;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

            input[type="submit"]:hover {
                background-color: #45a049;
            }

        .error-message {
            color: red;
            margin-bottom: 10px;
        }

        .image-preview {
            margin-top: 10px;
        }

            .image-preview img {
                max-width: 100%;
                max-height: 200px;
            }

        /* Media Queries */
        @media (max-width: 880px) {
            .cont .container {
                width: 100%;
                padding: 10px;
            }

            .cont h2 {
                font-size: 20px;
            }
        }

        @media (max-width: 767px) {
            .cont table {
                font-size: 14px;
            }

            .cont th,
            .cont td {
                padding: 6px;
            }
        }

        @media (max-width: 600px) {
            .cont,
            input[type="text"],
            input[type="submit"],
            select,
            textarea {
                width: 100%;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="cont">
        <div class="container">
            <div class="center">
                <img src="logo/logo-head.png" />
                <h2>Add Achivers</h2>
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
                    <td>Achivement:
                    </td>
                    <td>
                        <asp:TextBox ID="txtAchivement" placeholder="e.g. NET Qualified for Assistant Professor" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvAchivement" runat="server" ControlToValidate="txtAchivement"
                            ErrorMessage="Achivement is required." ForeColor="Red"></asp:RequiredFieldValidator>
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
