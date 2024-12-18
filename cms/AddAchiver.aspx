<%@ Page Title="Add Achiver" Language="C#" MasterPageFile="cms.master" AutoEventWireup="true" CodeFile="AddAchiver.aspx.cs" Inherits="AddAchiver" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="../Content/cropper.min.css">
    <link rel="stylesheet" href="../Content/flatpickr.min.css">
    <script type="text/javascript" src="../Scripts/cropper.js"></script>
    <script type="text/javascript" src="../Scripts/flatpickr.js"></script>
    <script type="text/javascript" src="../Scripts/jquery-3.7.1.min.js"></script>
    <style>
        .cropper-container {
            width: 300px;
            height: 300px;
            position: relative;
            overflow: hidden;
        }
    </style>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            // Initialize Flatpickr on the TextBox
            const fp = flatpickr('.flatpickr-input', {
                enableTime: false,       // Disable time
                dateFormat: "d-m-Y",     // Date format
                allowInput: true,        // Allow manual input
                clickOpens: false,       // Calendar opens on click
                disableMobile: true,     // Force Flatpickr on mobile
                maxDate: "today"         // today is maximum date
            });

            // Open the calendar when clicking on the calendar icon
            document.getElementById('calendar-icon').addEventListener('click', function () {
                fp.open();
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <section class="py-4 bg-light">
        <div class="container contain bg-white rounded shadow-sm p-4" style="max-width: 600px;">
            <div class="text-center text-primary p-4 rounded">
                <h1>Add Achiver</h1>
            </div>
            <table class="table table-bordered table-striped">
                <tr>
                    <td colspan="2">
                        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label></td>
                </tr>
            </table>
            <asp:Panel ID="FetchStudentPanel" runat="server" Visible="true">
                <table class="table table-bordered table-striped">
                    <tr>
                        <td></td>
                        <td>Step 1 : Fetch Student's Detail </td>
                    </tr>
                    <tr>
                        <td>Select Session:</td>
                        <td>
                            <asp:DropDownList ID="ddlSession" runat="server" CssClass="form-control">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvSession" runat="server" ControlToValidate="ddlSession"
                                InitialValue="" ErrorMessage="Session is required." ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Registration No:
                        </td>
                        <td>
                            <asp:TextBox ID="txtRegistrationNo" placeholder="e.g. 184630004" runat="server" CssClass="form-control"></asp:TextBox>
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
                            <asp:TextBox ID="txtRegistrationYear" placeholder="e.g. 2018" runat="server" CssClass="form-control"></asp:TextBox>
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
                            <asp:TextBox ID="txtRollNo" placeholder="e.g. 2210" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvRollNo" runat="server" ControlToValidate="txtRollNo"
                                ErrorMessage="Roll No is required." ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revRollNo" runat="server" ControlToValidate="txtRollNo"
                                ErrorMessage="Roll No should be only numerals." ForeColor="Red" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Date of Birth:</td>
                        <td>
                            <div class="input-group">
                                <asp:TextBox ID="txtDOB" placeholder="e.g. 08-07-2000" runat="server"
                                    CssClass="form-control flatpickr-input"></asp:TextBox>
                                <span class="input-group-text" id="calendar-icon">
                                    <i class="fa-solid fa-calendar"></i>
                                </span>
                            </div>
                            <asp:RequiredFieldValidator ID="rfvDOB" runat="server" ControlToValidate="txtDOB"
                                ErrorMessage="Date of Birth is required." ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:Button ID="btnFetch" runat="server" Text="Fetch" OnClick="btnFetch_Click" CssClass="btn btn-primary" />
                            <asp:Button ID="btnReset" runat="server" Text="Reset" OnClick="btnReset_Click" CssClass="btn btn-secondary ms-4"/></td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:Panel ID="AddAchiverPanel" runat="server" Visible="false">
                <table class="table table-bordered table-striped">
                    <tr>
                        <td></td>
                        <td>Step 2 : Add Achiver's Details </td>
                    </tr>
                    <tr>
                        <td>First Name:
                        </td>
                        <td>
                            <asp:TextBox ID="txtFirstName" placeholder="e.g. Saurabh" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="txtFirstName"
                                ErrorMessage="First Name is required." ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Middle Name (if have):
                        </td>
                        <td>
                            <asp:TextBox ID="txtMidName" placeholder="e.g. Kumar" runat="server" CssClass="form-control"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Last Name:
                        </td>
                        <td>
                            <asp:TextBox ID="txtLastName" placeholder="e.g. Suman" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ControlToValidate="txtLastName"
                                ErrorMessage="Last Name is required." ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Achivement:
                        </td>
                        <td>
                            <asp:TextBox ID="txtAchivement" placeholder="e.g. Qualified Net" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvAchivement" runat="server" ControlToValidate="txtAchivement"
                                ErrorMessage="Achivement is required." ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <!-- Image Upload -->
                    <tr>
                        <td>Upload Image:
                        </td>
                        <td>
                            <asp:FileUpload ID="fileUpload" runat="server" CssClass="form-control" />
                            <asp:Label ID="lblFileTypeError" runat="server" ForeColor="Red" Visible="false">Invalid file type. Only .jpg, .jpeg, .png files are allowed.</asp:Label>
                            <asp:RequiredFieldValidator ID="rfvFileUpload" runat="server" ControlToValidate="fileUpload"
                                ErrorMessage="Image upload is required." InitialValue="" ForeColor="Red"></asp:RequiredFieldValidator>
                            <div>
                                <asp:HiddenField ID="imagePreviewBase64" runat="server" />
                                <div id="cropperContainer" class="cropper-container" style="display: none;">
                                    <img id="cropperImage" src="#" alt="Image for cropping" />
                                </div>
                                <asp:Button ID="btnCrop" runat="server" Text="Crop" OnClientClick="return cropImage();"
                                    Style="display: none;" CssClass="btn btn-outline-primary" />
                                <div id="imagePreview" style="display: none;">
                                    <img id="previewImage" src="#" alt="Preview Image" style="max-width: 200px; max-height: 200px;" />
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>Phone No:
                        </td>
                        <td>
                            <asp:TextBox ID="txtPhone" placeholder="e.g. 9060311534  Don't add +91 or 0 before it" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="revPhoneNo" runat="server" ControlToValidate="txtPhone"
                                ErrorMessage="Phone No should be 10 digits." ForeColor="Red" ValidationExpression="^\d{10}$"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Email Id:
                        </td>
                        <td>
                            <asp:TextBox ID="txtEmail" placeholder="e.g. punjprakashpp@gmail.com" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
                                ErrorMessage="Invalid Email format." ForeColor="Red" ValidationExpression="^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Qualification:
                        </td>
                        <td>
                            <asp:TextBox ID="txtQualification" placeholder="e.g. MCA" runat="server" CssClass="form-control"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Occupation / Job:
                        </td>
                        <td>
                            <asp:TextBox ID="txtOccupation" placeholder="e.g. Full Stack Developer" runat="server" CssClass="form-control"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Work or Company Name with location :
                        </td>
                        <td>
                            <asp:TextBox ID="txtCompany" placeholder="e.g. Bhagalpur" runat="server" CssClass="form-control"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" CssClass="btn btn-primary" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
    </section>
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