<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site.master" AutoEventWireup="true"
    CodeFile="UploadFiles.aspx.cs" Inherits="Admin_pages_UploadFiles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <title>File Upload</title>
    <link rel="stylesheet" type="text/css" href="../Styles/upload.css" />
    <script type="text/javascript">
        function toggleSessionDropdown() {
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

        window.onload = function () {
            toggleSessionDropdown(); // Initial check
        };
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="cont">
        <h2>Upload File</h2>
        <table class="upload-table">
            <tr>
                <td><asp:Label ID="Label1" runat="server" Text="Upload Type: "></asp:Label></td>
                <td>
                    <asp:DropDownList ID="ddlDownloadType" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlDownloadType_SelectedIndexChanged">
                        <asp:ListItem>Syllabus</asp:ListItem>
                        <asp:ListItem>Projects</asp:ListItem>
                        <asp:ListItem>Assignment</asp:ListItem>
                        <asp:ListItem>Internal-Questions</asp:ListItem>
                        <asp:ListItem>Model-Questions</asp:ListItem>
                        <asp:ListItem>Previous-Year-Questions</asp:ListItem>
                        <asp:ListItem>Other</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td><asp:Label ID="Label2" runat="server" Text="Semester: "></asp:Label></td>
                <td>
                    <asp:DropDownList ID="ddlSemester" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td><asp:Label ID="Label3" runat="server" Text="Session: "></asp:Label></td>
                <td><asp:DropDownList ID="ddlSession" runat="server"></asp:DropDownList></td>
            </tr>
            <tr>
                <td></td>
                <td colspan="2"><asp:FileUpload ID="FileUpload1" runat="server" /></td>
            </tr>
            <tr>
                <td></td>
                <td colspan="2">
                    <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnDelete" runat="server" Text="Delete Files" OnClick="btnDelete_Click" />
                </td>
            </tr>
            <tr>
                <td></td>
                <td colspan="2">
                    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>


