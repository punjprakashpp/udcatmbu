<%@ Page Title="CMS Login" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" type="text/css" href="Content/pages.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <section class="py-4 bg-light">
        <div class="container contain bg-white rounded shadow-sm p-4">
            <h1 class="text-center text-primary rounded-top mb-4">Admin / User Login</h1>
            <div class="row">
                <div class="col-12 col-md-6 m-auto">
                    <table class="table">
                        <tr>
                            <td colspan="2">
                                <asp:Label ID="lblMessage" runat="server" Text="Login to Website's Content Management System"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>Username:</td>
                            <td>
                                <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>Password:</td>
                            <td>
                                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <label class="form-control">
                                    <asp:CheckBox ID="chkboxRem" runat="server" />
                                    Remember me</label></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>
                                <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-primary ms-2" Text="Login" OnClick="btnLogin_Click" />
                                <asp:Button ID="btnReset" runat="server" CssClass="btn btn-secondary ms-2" Text="Reset" OnClick="btnReset_Click" />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </section>
</asp:Content>

