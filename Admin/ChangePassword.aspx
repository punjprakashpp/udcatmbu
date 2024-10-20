﻿<%@ Page Title="Change Password" Language="C#" MasterPageFile="Admin.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="Admin_Account_ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <link rel="stylesheet" type="text/css" href="Styles/account.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="bg">
            <h2>Change Password</h2>
            <table>
                <tr>
                    <td>Current Password:</td>
                    <td>
                        <asp:TextBox ID="txtCurrentPassword" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvCurrentPassword" runat="server" ControlToValidate="txtCurrentPassword" ErrorMessage="Current Password is required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>New Password:</td>
                    <td>
                        <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvNewPassword" runat="server" ControlToValidate="txtNewPassword" ErrorMessage="New Password is required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>Confirm New Password:</td>
                    <td>
                        <asp:TextBox ID="txtConfirmNewPassword" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvConfirmNewPassword" runat="server" ControlToValidate="txtConfirmNewPassword" ErrorMessage="Confirm New Password is required" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="cvConfirmNewPassword" runat="server" ControlToValidate="txtConfirmNewPassword" ControlToCompare="txtNewPassword" ErrorMessage="Passwords do not match" ForeColor="Red"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="btnChangePassword" runat="server" Text="Change Password" OnClick="btnChangePassword_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
</asp:Content>
