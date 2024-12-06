<%@ Page Title="" Language="C#" MasterPageFile="~/cms/cms.master" AutoEventWireup="true" CodeFile="RegisterUsers.aspx.cs" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <div class="container">
        <div class="row">
            <div class="col col-md-5 m-auto">
                <h2 class="text-center">Register other Users</h2>
                <table class="table table-responsive">
                    <tr>
                        <td><label Class="form-control"> First Name: </label></td>
                        <td><asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td><label Class="form-control"> Middle Name (if have): </label></td>
                        <td><asp:TextBox ID="txtMidName" runat="server" CssClass="form-control"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td><label Class="form-control"> Last Name: </label></td>
                        <td><asp:TextBox ID="txtLastName" runat="server" CssClass="form-control"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td><label Class="form-control"> Username: </label></td>
                        <td><asp:TextBox ID="txtUserName" runat="server" CssClass="form-control"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td><label Class="form-control"> Type Password: </label></td>
                        <td><asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td><label Class="form-control"> Retype Password: </label></td>
                        <td><asp:TextBox ID="txtPasswordCheck" runat="server" CssClass="form-control"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td><label Class="form-control"> User Type (Role): </label></td>
                        <td>
                            <asp:DropDownList ID="drpRole" runat="server" CssClass="form-control">
                                <asp:ListItem>User</asp:ListItem>
                                <asp:ListItem>Admin</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"><asp:Label ID="lblMessage" runat="server" CssClass="form-control" Text=""></asp:Label></td>
                    </tr>
                    <tr>
                        <td><asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="form-control btn btn-secondary" OnClick="btnReset_Click" /></td>
                        <td><asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="form-control btn btn-primary" OnClick="btnRegister_Click" /></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</asp:Content>

