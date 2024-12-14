<%@ Page Title="Chnage Password" Language="C#" MasterPageFile="~/cms/cms.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="Account_ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <div class="container">
        <div class="row">
            <div class="col col-md-5 m-auto">
                <h2 class="text-center">Chnage your password</h2>
                <asp:Panel ID="CheckPasswordPanel" runat="server" Visible="true">
                    <table class="table table-responsive">
                        <tr>
                            <td>
                                <label class="form-control">Type Your Current Password: </label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtCurrentPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="form-control btn btn-secondary" OnClick="btnReset_Click" /></td>
                            <td>
                                <asp:Button ID="btnCheck" runat="server" Text="Check Password" CssClass="form-control btn btn-primary" OnClick="btnCheck_Click" /></td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel ID="ChangePasswordPanel" runat="server" Visible="false">
                    <table class="table table-responsive">
                        <tr>
                            <td>
                                <label class="form-control">Type New password: </label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtNewPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <label class="form-control">Retype New Password: </label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtPasswordCheck" runat="server" CssClass="form-control"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="BtnClear" runat="server" Text="Reset" CssClass="form-control btn btn-secondary" OnClick="btnClear_Click" /></td>
                            <td>
                                <asp:Button ID="btnChange" runat="server" Text="Change Password" CssClass="form-control btn btn-primary" OnClick="btnChange_Click" /></td>
                        </tr>
                    </table>
                </asp:Panel>
                <table class="table table-responsive">
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="lblMessage" runat="server" CssClass="form-control" Text=""></asp:Label></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
