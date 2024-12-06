<%@ Page Title="" Language="C#" MasterPageFile="~/cms/cms.master" AutoEventWireup="true" CodeFile="ManageAccount.aspx.cs" Inherits="cms_ManageAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <div class="container">
        <div class="row">
            <div class="col col-md-5 m-auto">
                <h2 class="text-center">Manage your account</h2>
                <asp:Panel ID="CheckPasswordPanel" runat="server" Visible="true">
                    <table class="table table-responsive">
                        <tr>
                            <td>Type Current Password:</td>
                            <td>
                                <asp:TextBox ID="txtCurrentPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="btnClear" runat="server" Text="Reset" CssClass="form-control btn btn-secondary" OnClick="btnClear_Click" /></td>
                            <td>
                                <asp:Button ID="btnCheck" runat="server" Text="Check Password" CssClass="form-control btn btn-primary" OnClick="btnCheck_Click" /></td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel ID="ManageAccountPanel" runat="server" Visible="false">
                    <table class="table table-responsive">
                        <tr>
                            <td>First Name:</td>
                            <td>
                                <asp:TextBox ID="txtFirstName" runat="server" ReadOnly="true" CssClass="form-control"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>Middle Name (if have):</td>
                            <td>
                                <asp:TextBox ID="txtMidName" runat="server" ReadOnly="true" CssClass="form-control"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>Last Name:</td>
                            <td>
                                <asp:TextBox ID="txtLastName" runat="server" ReadOnly="true" CssClass="form-control"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>Username:</td>
                            <td>
                                <asp:TextBox ID="txtUserName" runat="server" ReadOnly="true" CssClass="form-control"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="form-control btn btn-secondary" OnClick="btnReset_Click" /></td>
                            <td>
                                <asp:Button ID="btnChange" runat="server" Text="Change" CssClass="form-control btn btn-primary" OnClick="btnChange_Click" /><asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="form-control btn btn-primary" Visible="false" OnClick="btnSubmit_Click" /></td>
                        </tr>
                    </table>
                </asp:Panel>
                <table class="table table-responsive">
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</asp:Content>