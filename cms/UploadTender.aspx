<%@ Page Title="Upload Tender" Language="C#" MasterPageFile="~/cms/cms.master" AutoEventWireup="true" CodeFile="UploadTender.aspx.cs" Inherits="cms_UploadTender" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
   <link rel="stylesheet" href="../Content/flatpickr.min.css">
    <script type="text/javascript" src="../Scripts/flatpickr.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            // Initialize Flatpickr on the TextBox
            const fp = flatpickr('.flatpickr-input', {
                enableTime: false,       // Disable time
                dateFormat: "d-m-Y",     // Date format
                allowInput: true,        // Allow manual input
                clickOpens: true,       // Calendar opens on click
                disableMobile: true     // Force Flatpickr on mobile
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <div class="container">
        <div class="row">
            <div class="col col-md-5 m-auto">
                <h2 class="text-center">Upload Tender Image/PDF</h2>
                <table class="table table-responsive">
                    <tr>
                        <td>Tender No.: </td>
                        <td>
                            <asp:TextBox ID="txtNoticeNo" ToolTip="Tender No." CssClass="form-control" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Tender Date: </td>
                        <td>
                            <asp:TextBox ID="txtNoticeDate" ToolTip="Tender Date" CssClass="form-control flatpickr-input" runat="server" /></td>
                        </tr>
                    <tr>
                        <td>Tender Title: </td>
                        <td>
                            <asp:TextBox ID="txtNoticeText" ToolTip="Tender Text" CssClass="form-control" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Select Tender Image/PDF: </td>
                        <td>
                            <asp:FileUpload ID="fileUpload" ToolTip="Tender File" CssClass="form-control" runat="server" /></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="btnManage" CssClass="form-control btn btn-secondary" runat="server" Text="Manage Tender" OnClick="btnManage_Click" /></td>
                        <td>
                            <asp:Button ID="btnSubmit" CssClass="form-control btn btn-primary" runat="server" Text="Submit" OnClick="btnSubmit_Click" /></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
