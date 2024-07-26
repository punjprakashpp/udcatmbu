<%@ Page Title="" Language="C#" MasterPageFile="Site.master" AutoEventWireup="true"
    CodeFile="UpdateImportantDates.aspx.cs" Inherits="Admin_pages_UpdateFeeStructure" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <title>Update Fee Structure</title>
    <link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#txtAppStartDate, #txtAppEndDate, #txtMeritIDate, #txtAdmIStartDate, #txtAdmIEndDate, #txtMeritIIDate, #txtAdmIIStartDate, #txtAdmIIEndDate, #txtClassStartDate").datepicker({
                dateFormat: 'dd-mm-yy'
            });
        });
    </script>
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

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="container">
        <h2>Update Important Dates</h2>
        <table>
            <tr>
                <td>
                    <label for="txtAppStartDate">Online Application Start Date:</label>
                </td>
                <td>
                    <asp:TextBox ID="txtAppStartDate" runat="server" ClientIDMode="Static"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="txtAppEndDate">Online Application End Date:</label>
                </td>
                <td>
                    <asp:TextBox ID="txtAppEndDate" runat="server" ClientIDMode="Static"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="txtTMBUCandFee">Fee for TMBU Candidate:</label>
                </td>
                <td>
                    <asp:TextBox ID="txtTMBUCandFee" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="txtOthCandFee">Fee for Other Candidate:</label>
                </td>
                <td>
                    <asp:TextBox ID="txtOthCandFee" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="txtMeritIDate">Publication of Merit List-I Date:</label>
                </td>
                <td>
                    <asp:TextBox ID="txtMeritIDate" runat="server" ClientIDMode="Static"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="txtAdmIStartDate">Merit List-I Admission Start Date:</label>
                </td>
                <td>
                    <asp:TextBox ID="txtAdmIStartDate" runat="server" ClientIDMode="Static"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="txtAdmIEndDate">Merit List-I Admission End Date:</label>
                </td>
                <td>
                    <asp:TextBox ID="txtAdmIEndDate" runat="server" ClientIDMode="Static"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="txtMeritIIDate">Publication of Merit List-II Date:</label>
                </td>
                <td>
                    <asp:TextBox ID="txtMeritIIDate" runat="server" ClientIDMode="Static"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="txtAdmIIStartDate">Merit List-II Admission Start Date:</label>
                </td>
                <td>
                    <asp:TextBox ID="txtAdmIIStartDate" runat="server" ClientIDMode="Static"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="txtAdmIIEndDate">Merit List-II Admission End Date:</label>
                </td>
                <td>
                    <asp:TextBox ID="txtAdmIIEndDate" runat="server" ClientIDMode="Static"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="txtClassStartDate">Class Commencement/Start Date:</label>
                </td>
                <td>
                    <asp:TextBox ID="txtClassStartDate" runat="server" ClientIDMode="Static"></asp:TextBox>
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
                <td>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
