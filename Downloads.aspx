<%@ Page Title="Download Files" Language="C#" MasterPageFile="Site.master" AutoEventWireup="true" CodeFile="Downloads.aspx.cs" Inherits="Downloads" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="Styles/pages.css">
    <script type="text/javascript" src="Scripts/jquery-3.7.1.min.js"></script>
    <script type="text/javascript">
        function toggleSessionDropdown() {
            var ddlDownloadType = document.getElementById('<%= ddlDownloadType.ClientID %>');
            var ddlSession = document.getElementById('<%= ddlSession.ClientID %>');
            var ddlSemester = document.getElementById('<%= ddlSemester.ClientID %>');
            if (ddlDownloadType.value === "Syllabus") {
                ddlSession.disabled = true;
                ddlSession.selectedIndex = 0; // Reset to default value
            } else if (ddlDownloadType.value === "Other") {
                ddlSession.disabled = true;
                ddlSemester.disabled = true;
                ddlSession.selectedIndex = 0; // Reset to default value
                ddlSemester.selectedIndex = 0;
            } else {
                ddlSession.disabled = false;
                ddlSemester.disabled = false;
                ddlSession.selectedIndex = 0; // Reset to default value
                ddlSemester.selectedIndex = 0;
            }
        }

        function validateForm() {
            var ddlDownloadType = document.getElementById('<%= ddlDownloadType.ClientID %>');
            var ddlSemester = document.getElementById('<%= ddlSemester.ClientID %>');
            var ddlSession = document.getElementById('<%= ddlSession.ClientID %>');
            var isValid = true;

            if (!ddlSession.disabled && ddlSession.selectedIndex === 0) {
                alert("Please select a session.");
                isValid = false;
            }
            if (!ddlSemester.disabled && ddlSemester.selectedIndex === 0) {
                alert("Please select a semester.");
                isValid = false;
            }
            return isValid;
        }
    </script>
    <style>
        .contain {
            max-width:840px;
        }
    </style>
</asp:Content>

<asp:Content ID="ContentBody" ContentPlaceHolderID="Content" runat="Server">
    <section class="py-5 bg-light">
        <div class="container contain bg-white rounded shadow-sm py-5 px-4">
            <h1 class="text-center text-white bg-gradient-primary rounded-top p-4 mb-4">Download Files</h1>
            
            <!-- Download Type Selection Section -->
            <div class="mb-4">
                <div class="row">
                    <div class="col-md-3">
                        <asp:Label ID="Label1" runat="server" Text="Download Type: " class="form-label"></asp:Label>
                        <asp:DropDownList ID="ddlDownloadType" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlDownloadType_SelectedIndexChanged" class="form-select" onchange="toggleSessionDropdown()">
                            <asp:ListItem>--- Select Type ---</asp:ListItem>
                            <asp:ListItem>Syllabus</asp:ListItem>
                            <asp:ListItem>Projects</asp:ListItem>
                            <asp:ListItem>Assignment</asp:ListItem>
                            <asp:ListItem>Internal-Questions</asp:ListItem>
                            <asp:ListItem>Model-Questions</asp:ListItem>
                            <asp:ListItem>Previous-Year-Questions</asp:ListItem>
                            <asp:ListItem>Other</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvDownloadType" runat="server" ControlToValidate="ddlDownloadType" InitialValue="--- Select Type ---" ErrorMessage="Please select a download type." ForeColor="Red" Display="Dynamic" />
                    </div>

                    <div class="col-md-3">
                        <asp:Label ID="Label2" runat="server" Text="Semester: " class="form-label"></asp:Label>
                        <asp:DropDownList ID="ddlSemester" runat="server" class="form-select"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvSemester" runat="server" ControlToValidate="ddlSemester" InitialValue="--- Select Semester ---" ErrorMessage="Please select a semester." ForeColor="Red" Display="Dynamic" />
                    </div>

                    <div class="col-md-3">
                        <asp:Label ID="Label3" runat="server" Text="Session: " class="form-label"></asp:Label>
                        <asp:DropDownList ID="ddlSession" runat="server" class="form-select"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvSession" runat="server" ControlToValidate="ddlSession" InitialValue="--- Select Session ---" ErrorMessage="Please select a session." ForeColor="Red" Display="Dynamic" />
                    </div>

                    <div class="col-md-3 text-center mt-2">
                        <asp:Button ID="btnShowFiles" runat="server" Text="Show Files" OnClick="btnShowFiles_Click" OnClientClick="return validateForm();" CssClass="btn btn-primary" />
                    </div>
                </div>
            </div>

            <!-- Message Section -->
            <asp:Label ID="lblMessage" runat="server" Text="" class="d-block mb-4"></asp:Label>

            <!-- Files Grid Section -->
            <div class="table-responsive">
                <asp:GridView ID="GridViewFiles" runat="server" AutoGenerateColumns="False" DataKeyNames="FilesID" OnRowCommand="GridViewFiles_RowCommand" CssClass="table table-bordered table-striped">
                    <Columns>
                        <asp:BoundField DataField="FileName" HeaderText="File Name" />
                        <asp:TemplateField HeaderText="File">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkDownload" runat="server" CommandName="Download" CommandArgument='<%# Eval("FilesID") %>' class="btn btn-link">Download</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </section>
</asp:Content>
