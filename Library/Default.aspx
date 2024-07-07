<%@ Page Title="" Language="C#" MasterPageFile="~/Library/Site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Library_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>UDCA Automated Library</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="Styles.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center>
    <div class="bg">
        <div id="title">
            <h1>
                Welcome to Automated Library of UDCA</h1>
        </div>
        <div id="main">
            <div id="img">
                <img src="img/logo/logo-lib-back.png" />
            </div>
            <div id="login">
                <table class="tbl">
                    <tr>
                        <td class="tblhead" colspan="2">
                            Login to Automated Library
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="lbl">
                            Select Type :
                        </td>
                        <td>
                            <asp:RadioButton ID="rdolibrary" runat="server" Checked="True" ForeColor="Green"
                                GroupName="a" Text="Librarian" />
                            &nbsp;<asp:RadioButton ID="rdosudent" runat="server" ForeColor="Green" GroupName="a"
                                Text="Student" />
                        </td>
                    </tr>
                    <tr>
                        <td class="lbl">
                            User Name :
                        </td>
                        <td>
                            <asp:TextBox ID="txtuname" runat="server" CssClass="txt"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtuname"
                                ErrorMessage="!!!" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="lbl">
                            Password : </td>
                        <td>
                            <asp:TextBox ID="txtupass" runat="server" CssClass="txt" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtupass"
                                ErrorMessage="!!!" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            <asp:Button ID="btnLogin" runat="server" CssClass="btn" Text="Login" Width="80px"
                                Font-Size="12pt" OnClick="btnLogin_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            <asp:Label ID="lbl" runat="server" Font-Size="11px" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>                    
                </table>
            </div>
        </div>
    </div>
            </center>
</asp:Content>

