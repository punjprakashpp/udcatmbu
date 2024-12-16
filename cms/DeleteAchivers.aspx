<%@ Page Title="Delete Achiever" Language="C#" MasterPageFile="cms.master" AutoEventWireup="true" CodeFile="DeleteAchivers.aspx.cs" Inherits="Admin_pages_DeleteAchiver" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" type="text/css" href="../style/StyleSheet.css"/>
    <script src="Scripts/jquery.js"></script>
    <script src="Scripts/table.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <div class="container">
        <h2 class="text-center">Delete Achiever Records</h2>
        <div class="row search-bar">
            <div class="col col-12">
                <table class="table">
                    <tr>
                        <td>
                            <label class="label">Search by Name: </label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtSearchAchiever" runat="server" CssClass="input" AutoPostBack="true"></asp:TextBox></td>
                        <td>
                            <asp:Button ID="btnSearchAchiever" runat="server" Text="Search" OnClick="btnSearchAchiever_Click" CssClass="btn btn-primary" /></td>
                        <td>
                            <label class="label">Records per page: </label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlAchieversPerPage" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlAchieversPerPage_SelectedIndexChanged" CssClass="input">
                                <asp:ListItem Value="10" Text="10" />
                                <asp:ListItem Value="20" Text="20" />
                                <asp:ListItem Value="50" Text="50" />
                            </asp:DropDownList></td>
                        <td>
                            <asp:Button ID="btnPreviousAchiever" runat="server" Text="Previous" OnClick="btnPreviousAchiever_Click" CssClass="btn btn-secondary" /></td>
                        <td>
                            <asp:Button ID="btnNextAchiever" runat="server" Text="Next" OnClick="btnNextAchiever_Click" CssClass="btn btn-secondary" /></td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="row mb-20">
            <div class="col col-12">
                <!-- Achiever Table -->
                <asp:GridView ID="gvAchievers" runat="server" CssClass="table text-center" AutoGenerateColumns="False" OnRowCommand="gvAchievers_RowCommand" OnPageIndexChanging="gvAchievers_PageIndexChanging">
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
                                <asp:Button ID="btnDeleteAchiever" runat="server" Text="Delete" CommandName="Delete" CommandArgument='<%# Eval("AchiverID") %>' OnClientClick="return confirm('Are you sure you want to delete this record?');" CssClass="btn btn-danger" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <div class="pagination-info text-center row mt-20">
                    <div class="col col-12">
                        <span>Page <strong><%# gvAchievers.PageIndex + 1 %></strong> of <strong><%# Math.Ceiling((double)gvAchievers.PageCount) %></strong></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
