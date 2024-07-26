﻿<%@ Page Title="" Language="C#" MasterPageFile="Site.master" AutoEventWireup="true" CodeFile="UpdateFeeStructure.aspx.cs" Inherits="Admin_pages_UpdateFeeStructure" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <title>Update Fee Structure</title>
    <style>
        /* Base Styles */
        .container {
            max-width: 1200px; /* Set a max-width for better layout control on large screens */
            margin: 0 auto;
            padding: 0 15px;
        }

            .container h2 {
                font-size: 1.5rem; /* Use relative units for scalability */
                margin: 0 0 1rem 0; /* Combine margin properties for shorthand */
                text-align: center;
            }

            .container table {
                width: 50%;
                border-collapse: collapse;
                margin-bottom: 1.5rem; /* Add space below the table */
            }

            .container th,
            .container td {
                border: 1px solid #ddd; /* Softer border color */
                padding: 12px 15px; /* Increase padding for better spacing */
                font-size: 1rem;
                text-align: left;
            }

            .container th {
                background-color: #f9f9f9; /* Add background to table headers */
                font-weight: bold;
            }

            .container td a {
                text-decoration: none;
                color: #007bff; /* Use a more visible link color */
                font-weight: 500;
            }

                .container td a:hover {
                    text-decoration: underline;
                }

        @media (max-width: 767px) {
            .container table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 1.5rem; /* Add space below the table */
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="container">
    <h2>Update Fee Structure</h2>
    <table>
        <tr>
            <td>
                <label for="ddlSemester">Semester:</label>
            </td>
            <td>
                <asp:DropDownList ID="ddlSemester" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlSemester_SelectedIndexChanged">
                <asp:ListItem Text="Semester 1" Value="Semester-1"></asp:ListItem>
                <asp:ListItem Text="Semester 2" Value="Semester-2"></asp:ListItem>
                <asp:ListItem Text="Semester 3" Value="Semester-3"></asp:ListItem>
                <asp:ListItem Text="Semester 4" Value="Semester-4"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <label for="txtAdmission">Admission Fee:</label>
            </td>
            <td>
                <asp:TextBox ID="txtAdmission" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <label for="txtAcademic">Academic Fee:</label>
            </td>
            <td>
                <asp:TextBox ID="txtAcademic" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <label for="txtComputer">Computer Lab Fee:</label>
            </td>
            <td>
                <asp:TextBox ID="txtComputer" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <label for="txtMiscellaneous">Miscellaneous Fee:</label>
            </td>
            <td>
                <asp:TextBox ID="txtMiscellaneous" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <label for="txtExamination">Examination Fee:</label>
            </td>
            <td>
                <asp:TextBox ID="txtExamination" runat="server" oninput="calculateTotal()"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <label for="txtTotal">Total Fee:</label>
            </td>
            <td>
                <asp:TextBox ID="txtTotal" runat="server" ReadOnly="true"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
            </td>
            <td></td>
        </tr>
    </table>
</div>
        <script>
            function calculateTotal() {
                var admission = parseFloat(document.getElementById("txtAdmission").value) || 0;
                var academic = parseFloat(document.getElementById("txtAcademic").value) || 0;
                var computer = parseFloat(document.getElementById("txtComputer").value) || 0;
                var miscellaneous = parseFloat(document.getElementById("txtMiscellaneous").value) || 0;
                var examination = parseFloat(document.getElementById("txtExamination").value) || 0;

                var total = admission + academic + computer + miscellaneous + examination;
                document.getElementById("txtTotal").value = total.toFixed(2);
            }
    </script>
</asp:Content>

