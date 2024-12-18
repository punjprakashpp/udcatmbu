<%@ Page Title="Upload Notice" Language="C#" MasterPageFile="~/cms/cms.master" AutoEventWireup="true" CodeFile="UploadNotice.aspx.cs" Inherits="cms_UploadNotice" %>

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
                <h2 class="text-center">Upload Notice Image/PDF</h2>
                <table class="table table-responsive">
                    <tr>
                        <td>Notice No.: </td>
                        <td>
                            <asp:TextBox ID="txtNoticeNo" ToolTip="Notice No." CssClass="form-control" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Notice Date: </td>
                        <td>
                            <asp:TextBox ID="txtNoticeDate" ToolTip="Notice Date" CssClass="form-control flatpickr-input" runat="server" /></td>
                        </tr>
                    <tr>
                        <td>Notice Title: </td>
                        <td>
                            <asp:TextBox ID="txtNoticeText" ToolTip="Notice Text" CssClass="form-control" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Select Notice Image/PDF: </td>
                        <td>
                            <asp:FileUpload ID="fileUpload" ToolTip="Notice File" CssClass="form-control" runat="server" /></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="btnManage" CssClass="form-control btn btn-secondary" runat="server" Text="Manage Notice" OnClick="btnManage_Click" /></td>
                        <td>
                            <asp:Button ID="btnSubmit" CssClass="form-control btn btn-primary" runat="server" Text="Submit" OnClick="btnSubmit_Click" /></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
