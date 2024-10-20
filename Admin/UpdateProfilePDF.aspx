﻿<%@ Page Title="Update Profile PDF" Language="C#" MasterPageFile="Admin.master" AutoEventWireup="true" CodeFile="UpdateProfilePDF.aspx.cs" Inherits="Admin_pages_UpdateOtherPDF" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <link rel="stylesheet" href="Styles/add.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2 style="text-align:center;">Update Adminstrative Person's Profile PDF</h2>
    <table style="width: 100%;">
        <tr>
            <td>
                <asp:Label ID="lblVCProfile" runat="server" Text="Upload VC Profile PDF:"></asp:Label>
            </td>
            <td>
                <asp:FileUpload ID="fileUploadVCProfile" runat="server" />
            </td>
            <td>
                <asp:Button ID="btnVCProfile" runat="server" Text="Update" OnClick="btnVCProfile_Click" />
            </td>
            <td></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblPVCProfile" runat="server" Text="Upload PVC Profile PDF:"></asp:Label>
            </td>
            <td>
                <asp:FileUpload ID="fileUploadPVCProfile" runat="server" />
            </td>
            <td>
                <asp:Button ID="btnPVCProfile" runat="server" Text="Update" OnClick="btnPVCProfile_Click" />
            </td>
            <td></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblDirectorProfile" runat="server" Text="Upload Director Profile PDF:"></asp:Label>
            </td>
            <td>
                <asp:FileUpload ID="fileUploadDirectorProfile" runat="server" />
            </td>
            <td>
                <asp:Button ID="btnDirectorProfile" runat="server" Text="Update" OnClick="btnDirectorProfile_Click" />
            </td>
            <td></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblDSWProfile" runat="server" Text="Upload DSW Profile PDF:"></asp:Label>
            </td>
            <td>
                <asp:FileUpload ID="fileUploadDSWProfile" runat="server" />
            </td>
            <td>
                <asp:Button ID="btnDSWProfile" runat="server" Text="Update" OnClick="btnDSWProfile_Click" />
            </td>
            <td></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblCCDCProfile" runat="server" Text="Upload CCDC Profile PDF:"></asp:Label>
            </td>
            <td>
                <asp:FileUpload ID="fileUploadCCDCProfile" runat="server" />
            </td>
            <td>
                <asp:Button ID="btnCCDCProfile" runat="server" Text="Update" OnClick="btnCCDCProfile_Click" />
            </td>
            <td></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblRegistrarProfile" runat="server" Text="Upload Registrar Profile PDF:"></asp:Label>
            </td>
            <td>
                <asp:FileUpload ID="fileUploadRegistrarProfile" runat="server" />
            </td>
            <td>
                <asp:Button ID="btnRegistrarProfile" runat="server" Text="Update" OnClick="btnRegistrarProfile_Click" />
            </td>
            <td></td>
        </tr>
        <tr>
            <td colspan="3"><asp:Label ID="lblMessage" runat="server" Text=""></asp:Label></td>
            <td></td>
        </tr>
    </table>
</asp:Content>

