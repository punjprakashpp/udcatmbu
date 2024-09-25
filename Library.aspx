<%@ Page Title="Automated Library" Language="C#" MasterPageFile="Website.master" AutoEventWireup="true" CodeFile="Library.aspx.cs" Inherits="_Library" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" type="text/css" href="style/Styles.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content1" runat="Server">
    <div class="bg">
        <div id="title">
            <h1>Welcome to Automated Library of UDCA</h1>
        </div>
        <div id="main">
            <div id="img">
                <br />
                <img src="img/dept/ComputerCentre.jpg" />
            </div>
            <div id="login">
                <table class="tbl">
                    <tr>
                        <td class="tblhead" colspan="2">Login to Automated Library</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Label ID="lbl" runat="server" Font-Size="11px" ForeColor="Red"></asp:Label></td>
                    </tr>
                    <tr>
                        <td class="lbl">Select Type : </td>
                        <td>
                            <asp:RadioButton ID="rdolibrary" runat="server" Checked="True" ForeColor="Green"
                                GroupName="a" Text="Librarian" />
                            &nbsp;<asp:RadioButton ID="rdosudent" runat="server" ForeColor="Green" GroupName="a"
                                Text="Student" />
                        </td>
                    </tr>
                    <tr>
                        <td class="lbl">User Name : </td>
                        <td>
                            <asp:TextBox ID="txtuname" runat="server" CssClass="txt"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtuname"
                                ErrorMessage="!!!" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="lbl">Password : </td>
                        <td>
                            <asp:TextBox ID="txtupass" runat="server" CssClass="txt" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtupass"
                                ErrorMessage="!!!" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Button ID="btnLogin" runat="server" CssClass="btn" Text="Login" Width="80px"
                                Font-Size="12pt" OnClick="btnLogin_Click" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</asp:Content>