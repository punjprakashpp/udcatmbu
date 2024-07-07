<%@ Page Title="" Language="C#" MasterPageFile="~/Root.master" AutoEventWireup="true" CodeFile="Downloads.aspx.cs" Inherits="Downloads" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Download Center</title>
    <link rel="stylesheet" href="style/table.css">
    <link rel="stylesheet" href="style/download.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="download-container">
        <h1 style=" text-align: center; padding: 20px 0; background-color: #369; color: white; font-size: 1.8em; font-weight: bold; text-align: center; text-transform: uppercase; margin-bottom: 20px; border-top-left-radius: 10px; border-top-right-radius: 10px;">
            Download Files
        </h1>
        <div class="form-row">
            <div class="part">
                <asp:Label ID="Label1" runat="server" Text="Download Type: "></asp:Label>
                <asp:DropDownList ID="ddlDownloadType" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlDownloadType_SelectedIndexChanged">
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
            <div class="part">
                <asp:Label ID="Label2" runat="server" Text="Semester: "></asp:Label>
                <asp:DropDownList ID="ddlSemester" runat="server"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvSemester" runat="server" ControlToValidate="ddlSemester" InitialValue="--- Select Semester ---" ErrorMessage="Please select a semester." ForeColor="Red" Display="Dynamic" />
            </div>
            <div class="part">
                <asp:Label ID="Label3" runat="server" Text="Session: "></asp:Label>
                <asp:DropDownList ID="ddlSession" runat="server"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvSession" runat="server" ControlToValidate="ddlSession" InitialValue="--- Select Session ---" ErrorMessage="Please select a session." ForeColor="Red" Display="Dynamic" />
            </div>
            <div class="part">
                <asp:Button ID="btnShowFiles" runat="server" Text="Show Files" OnClick="btnShowFiles_Click" OnClientClick="return validateForm();" />
            </div>
        </div>
        <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
        <div class="grid-view-container">
            <asp:GridView ID="GridViewFiles" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" OnRowCommand="GridViewFiles_RowCommand">
                <Columns>
                    <asp:BoundField DataField="FileName" HeaderText="File Name" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkDownload" runat="server" CommandName="Download" CommandArgument='<%# Eval("Id") %>'>Download</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>

