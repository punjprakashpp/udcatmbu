<%@ Page Title="" Language="C#" MasterPageFile="Admin.master" AutoEventWireup="true"
    CodeFile="UpdateImportantDates.aspx.cs" Inherits="Admin_pages_UpdateFeeStructure" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <title>Update Fee Structure</title>
    <link rel="stylesheet" href="Styles/manage.css">
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
                <td>&nbsp;</td>
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
</asp:Content>
