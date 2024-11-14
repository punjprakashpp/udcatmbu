<%@ Page Title="" Language="C#" MasterPageFile="Admin.master" AutoEventWireup="true" CodeFile="StudentReport.aspx.cs" Inherits="Studenteport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link rel="stylesheet" href="../style/StyleSheet.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="container">
        <h2 class="text-center">View Student Detail</h2>
        <div class="row">
            <div class="col col-12">
                <table class="table">
                    <tr>
                        <td>
                            <label class="label mt-10">Search for Student via:- </label>
                        </td>
                        <td>
                            <asp:RadioButton ID="rdRoll" runat="server" CssClass="input" Text="Roll No. :" GroupName="SearchCriteria"
                                AutoPostBack="True" /></td>
                        <td>
                            <asp:RadioButton ID="rdName" runat="server" CssClass="input" Text="First Name :" GroupName="SearchCriteria"
                                AutoPostBack="True" /></td>
                        <td>
                            <asp:TextBox ID="txtsearch" runat="server" CssClass="input"></asp:TextBox></td>
                        <td>
                            <asp:Button ID="btnseach" runat="server" CssClass="btn btn-primary" OnClick="btnSearch_Click" Text="Search" /></td>
                    </tr>
                </table> 
            </div>
            <asp:Label ID="lblmsg" runat="server" CssClass="mt-10 mb-10 text-center label" ForeColor="Red"></asp:Label>
        </div>
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="View1" runat="server">
                <div class="row">
                    <asp:Label ID="lbl" CssClass="mt-10 mb-10 text-center label" runat="server"></asp:Label>
                    <div class="col col-12">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow"
                            BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None"
                            OnRowCommand="GridView1_RowCommand" CssClass="table text-center">
                            <AlternatingRowStyle BackColor="PaleGoldenrod" />
                            <Columns>
                                <asp:BoundField DataField="Session" HeaderText="Session" />
                                <asp:BoundField DataField="RollNo" HeaderText="Roll No" />
                                <asp:BoundField DataField="FirstName" HeaderText="First Name" ReadOnly="True" SortExpression="FirstName" />
                                <asp:BoundField DataField="MidName" HeaderText="Middle Name" ReadOnly="True" SortExpression="MidName" />
                                <asp:BoundField DataField="LastName" HeaderText="Last Name" ReadOnly="True" SortExpression="LastName" />
                                <asp:TemplateField HeaderText="View">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkview" runat="server" CommandArgument='<%# Eval("StudentID") %>' CommandName="View" CssClass="lnk" Text="View"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <FooterStyle BackColor="Tan" />
                            <HeaderStyle BackColor="#FF6600" Font-Bold="True" />
                            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                            <SortedAscendingCellStyle BackColor="#FAFAE7" />
                            <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                            <SortedDescendingCellStyle BackColor="#E1DB9C" />
                            <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                        </asp:GridView>
                    </div>
                </div>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <label class="label text-center">Student's Detail</label>
                <div class="row">
                    <div class="col col-3"></div>
                    <div class="col col-6">
                        <table class="table">
                            <tr>
                                <td>Session :
                                </td>
                                <td>
                                    <asp:Label ID="lblSession" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>Roll No :
                                </td>
                                <td>
                                    <asp:Label ID="lblRollNo" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>Registration No:
                                </td>
                                <td>
                                    <asp:Label ID="lblRegNo" runat="server"></asp:Label>/<asp:Label ID="lblRegYear" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>Full Name :
                                </td>
                                <td>
                                    <asp:Label ID="lblFirstName" runat="server"></asp:Label> <asp:Label ID="lblMidName" runat="server"></asp:Label> <asp:Label ID="lblLastName" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>Date of Birth :
                                </td>
                                <td>
                                    <asp:Label ID="lbldob" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>Gender :
                                </td>
                                <td>
                                    <asp:Label ID="lblGen" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="lbl">&nbsp;
                                </td>
                                <td>
                                    <asp:Button ID="btnBack" runat="server" CssClass="btn btn-secondary" OnClick="btnBack_Click" Text="back" />
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="col col-3"></div>
                </div>
            </asp:View>
        </asp:MultiView>
    </div>
</asp:Content>