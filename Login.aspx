<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <div class="container">
        <div class="row">
            <div class="col col-md-3 m-auto">
                <h2 class="text-center">Login</h2>
                <table class="table table-responsive">
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="lblMessage" runat="server" Text="Login to School Website"></asp:Label></td>
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
                        <td>
                            <asp:Button ID="btnReset" runat="server" CssClass="form-control btn btn-secondary" Text="Reset" OnClick="btnReset_Click" /></td>
                        <td>
                            <asp:Button ID="btnLogin" runat="server" CssClass="form-control btn btn-primary" Text="Login" OnClick="btnLogin_Click" /></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</asp:Content>

