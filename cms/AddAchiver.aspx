<%@ Page Title="Add Achiver" Language="C#" MasterPageFile="cms.master" AutoEventWireup="true" CodeFile="AddAchiver.aspx.cs" Inherits="AddAchiver" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <section class="py-4 bg-light">
        <div class="container contain bg-white rounded shadow-sm p-4">
            <h1 class="text-center text-primary p-4 rounded">Add Achiver</h1>
            <table class="table">
                <tr>
                    <td>
                        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label></td>
                </tr>
            </table>
            <asp:Panel ID="pnlSearch" runat="server" Visible="true">
                <table class="table table-bordered table-striped">
                    <tr>
                        <td>
                            <label for="ddlSession" class="form-label">Select Session:</label>
                            <asp:DropDownList ID="ddlSession" runat="server" CssClass="form-control"></asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvSession" runat="server" ControlToValidate="ddlSession"
                                InitialValue="" ErrorMessage="Session is required." ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <label for="SearchCriteria" class="form-label">Search for Student via:</label>
                            <div class="form-control">
                            <asp:RadioButton ID="rdRoll" runat="server" Text="Roll No." GroupName="SearchCriteria" AutoPostBack="True" />
                            <asp:RadioButton ID="rdName" runat="server" Text="First Name" GroupName="SearchCriteria" AutoPostBack="True" />
                        </div>
                                </td>
                        <td>
                            <label for="txtsearch" class="form-label">Enter Search Text:</label>
                            <asp:TextBox ID="txtsearch" runat="server" CssClass="form-control" placeholder="Enter search term"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-primary" OnClick="btnSearch_Click" Text="Search" />
                            <asp:Button ID="btnReset" runat="server" Text="Reset" OnClick="btnReset_Click" CssClass="btn btn-secondary ms-4" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:MultiView ID="MultiViewStudent" runat="server">
                <asp:View ID="ViewSelectStudent" runat="server">
                    <div class="row">
                        <asp:Label ID="lbl" CssClass="mt-10 mb-10 text-center label" runat="server"></asp:Label>
                        <div class="col col-12">
                            <asp:GridView ID="GridViewStudent" runat="server" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow"
                                BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None"
                                OnRowCommand="GridViewStudent_RowCommand" CssClass="table text-center">
                                <AlternatingRowStyle BackColor="PaleGoldenrod" />
                                <Columns>
                                    <asp:BoundField DataField="Session" HeaderText="Session" />
                                    <asp:BoundField DataField="RollNo" HeaderText="Roll No" />
                                    <asp:BoundField DataField="FirstName" HeaderText="First Name" ReadOnly="True" SortExpression="FirstName" />
                                    <asp:BoundField DataField="MidName" HeaderText="Middle Name" ReadOnly="True" SortExpression="MidName" />
                                    <asp:BoundField DataField="LastName" HeaderText="Last Name" ReadOnly="True" SortExpression="LastName" />
                                    <asp:TemplateField HeaderText="Select">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkview" runat="server" CommandArgument='<%# Eval("StudentID") %>' CommandName="View" CssClass="lnk" Text="View"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <FooterStyle BackColor="Tan" />
                                <HeaderStyle BackColor="#FF6600" Font-Bold="True" />
                                <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                                <SortedAscendingCellStyle BackColor="#FAFAE7" />
                                <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                                <SortedDescendingCellStyle BackColor="#E1DB9C" />
                                <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                            </asp:GridView>
                        </div>
                    </div>
                </asp:View>
                <asp:View ID="ViewAddAchiver" runat="server">
                    <table class="table table-bordered table-striped">
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
                                <asp:TextBox ID="txtAchivement" TextMode="MultiLine" placeholder="e.g. Qualified Net" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvAchivement" runat="server" ControlToValidate="txtAchivement"
                                    ErrorMessage="Achivement is required." ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
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
                </asp:View>
            </asp:MultiView>
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
