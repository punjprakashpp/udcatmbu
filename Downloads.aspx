<%@ Page Title="Download Files" Language="C#" MasterPageFile="~/Website.master" AutoEventWireup="true" CodeFile="Downloads.aspx.cs" Inherits="Downloads" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="style/site.css">
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
    <style>
        /* Container Styles */
        .cont .container {
            max-width:1200px;
        }
        /* Form Styles */
        .download-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin: 20px;
            width: 100%;
        }

            .download-container h1 {
                width: 100%;
            }

        .form-row {
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            justify-content: center;
            margin-top: 10px;
            margin-bottom: 20px;
            gap: 10px;
        }

            .form-row span,
            .form-row select,
            .form-row input {
                font-size: 16px;
            }

                .form-row select,
                .form-row input[type="submit"] {
                    padding: 8px 12px;
                    font-size: 16px;
                    border: 1px solid #ccc;
                    border-radius: 4px;
                }

                .form-row input[type="submit"] {
                    background-color: #007bff;
                    color: white;
                    cursor: pointer;
                    border: none;
                }

                    .form-row input[type="submit"]:hover {
                        background-color: #0056b3;
                    }

        /* Table Styles */
        .grid-view-container {
            width: 75%;
            overflow-x: auto;
            margin: 0 auto;
        }

            .grid-view-container table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }

            .grid-view-container th,
            .grid-view-container td {
                padding: 10px;
                text-align: left;
                border: 1px solid #ddd;
            }

            .grid-view-container th {
                background-color: #007bff;
                color: white;
                font-weight: bold;
            }

            .grid-view-container tr:nth-child(even) {
                background-color: #f9f9f9;
            }

            .grid-view-container a {
                color: #007bff;
                text-decoration: none;
            }

                .grid-view-container a:hover {
                    text-decoration: underline;
                }

        /* Error Message Styles */
        #Content1_lblMessage {
            color: red;
            margin-top: 20px;
        }

        /* Mobile Styles */
        @media (max-width: 768px) {
            .download {
                margin: 10px;
                padding: 10px;
            }

            .download-container {
                width: auto;
            }

                .download-container h1 {
                    width: 90%;
                }

            .title h2 {
                font-size: 20px;
            }

            .form-row {
                flex-direction: column;
                gap: 5px;
            }

                .form-row select,
                .form-row input[type="submit"] {
                    width: 100%;
                    padding: 10px;
                    font-size: 14px;
                }

            .grid-view-container {
                width: 100%;
            }

                .grid-view-container th,
                .grid-view-container td {
                    padding: 8px;
                    font-size: 14px;
                }

                .grid-view-container table {
                    margin-top: 10px;
                }

                .grid-view-container a {
                    font-size: 14px;
                }

            .part {
                display: block;
                width: 100%;
                text-align: left;
                margin-bottom: 10px;
            }
        }

        @media (max-width: 480px) {
            .download {
                margin: 5px;
                padding: 5px;
            }

            .title h2 {
                font-size: 18px;
            }

            .form-row {
                gap: 3px;
            }

                .form-row select,
                .form-row input[type="submit"] {
                    padding: 8px;
                    font-size: 12px;
                }

            .grid-view-container th,
            .grid-view-container td {
                padding: 5px;
                font-size: 12px;
            }

            .grid-view-container a {
                font-size: 12px;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content1" runat="Server">
    <div class="cont">
        <div class="container download-container">
            <h1>Download Files</h1>
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
                <asp:GridView ID="GridViewFiles" runat="server" AutoGenerateColumns="False" DataKeyNames="FilesID" OnRowCommand="GridViewFiles_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="FileName" HeaderText="File Name" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkDownload" runat="server" CommandName="Download" CommandArgument='<%# Eval("FilesID") %>'>Download</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>

