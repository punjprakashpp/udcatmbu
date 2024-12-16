<%@ Page Title="Delete Alumni" Language="C#" MasterPageFile="cms.master" AutoEventWireup="true" CodeFile="DeleteAlumni.aspx.cs" Inherits="Admin_pages_DeleteAlumni" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" type="text/css" href="../style/StyleSheet.css" />
    <script src="Scripts/jquery.js"></script>
    <script src="Scripts/table.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <div class="container">
        <h2 class="text-center">Delete Alumni Records</h2>
        <div class="row search-bar">
            <div class="col col-12">
                <table class="table">
                    <tr>
                        <td>
                            <label class="label">Search by Name: </label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtName" runat="server" CssClass="input" AutoPostBack="true"></asp:TextBox></td>
                        <td>
                            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" CssClass="btn btn-primary" /></td>
                        <td>
                            <label class="label">Records per page: </label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlRecordsPerPage" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlRecordsPerPage_SelectedIndexChanged" CssClass="input">
                                <asp:ListItem Value="10" Text="10" />
                                <asp:ListItem Value="20" Text="20" />
                                <asp:ListItem Value="50" Text="50" />
                            </asp:DropDownList></td>
                        <td>
                            <asp:Button ID="btnPrevious" runat="server" Text="Previous" OnClick="btnPrevious_Click" CssClass="btn btn-secondary" /></td>
                        <td>
                            <asp:Button ID="btnNext" runat="server" Text="Next" OnClick="btnNext_Click" CssClass="btn btn-secondary" /></td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="row mb-20">
            <div class="col col-12">
                <!-- Alumni Table -->
                <asp:GridView ID="gvAlumni" runat="server" CssClass="table text-center" AutoGenerateColumns="False" OnRowCommand="gvAlumni_RowCommand" OnPageIndexChanging="gvAlumni_PageIndexChanging">
                    <Columns>
                        <asp:TemplateField HeaderText="Image">
                            <ItemTemplate>
                                <img src='<%# Eval("ImagePath") %>' alt="Image" width="100" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Session" HeaderText="Session" ReadOnly="True" SortExpression="Session" />
                        <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                        <asp:BoundField DataField="MidName" HeaderText="Middle Name" ReadOnly="True" SortExpression="MidName" />
                        <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandName="Delete" CommandArgument='<%# Eval("AlumniID") %>' OnClientClick="return confirm('Are you sure you want to delete this record?');" CssClass="btn btn-danger" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
        <div class="pagination-info text-center row mt-20">
            <div class="col col-12">
                <span>Page <strong><%# gvAlumni.PageIndex + 1 %></strong> of <strong><%# Math.Ceiling((double)gvAlumni.PageCount) %></strong></span>
            </div>
        </div>
    </div>
</asp:Content>
