<%@ Page Title="Delete Achiever" Language="C#" MasterPageFile="cms.master" AutoEventWireup="true" CodeFile="DeleteAchivers.aspx.cs" Inherits="Admin_pages_DeleteAchiver" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <section class="py-5">
        <div class="container">
            <h2 class="text-center mb-4">Delete Achiever Records</h2>

            <!-- Search Bar -->
            <div class="row mb-4">
                <div class="col-12">
                    <div class="d-flex align-items-center flex-wrap gap-3">
                        <div>
                            <label for="txtSearchAchiever" class="form-label">Search by Name:</label>
                            <asp:TextBox ID="txtSearchAchiever" runat="server" CssClass="form-control d-inline-block" AutoPostBack="true"></asp:TextBox>
                        </div>
                        <asp:Button ID="btnSearchAchiever" runat="server" Text="Search" OnClick="btnSearchAchiever_Click" CssClass="btn btn-primary" />

                        <div>
                            <label for="ddlAchieversPerPage" class="form-label">Records per page:</label>
                            <asp:DropDownList ID="ddlAchieversPerPage" runat="server" AutoPostBack="true"
                                OnSelectedIndexChanged="ddlAchieversPerPage_SelectedIndexChanged" CssClass="form-select">
                                <asp:ListItem Value="10" Text="10" />
                                <asp:ListItem Value="20" Text="20" />
                                <asp:ListItem Value="50" Text="50" />
                            </asp:DropDownList>
                        </div>
                        <asp:Button ID="btnPreviousAchiever" runat="server" Text="Previous" OnClick="btnPreviousAchiever_Click" CssClass="btn btn-secondary" />
                        <asp:Button ID="btnNextAchiever" runat="server" Text="Next" OnClick="btnNextAchiever_Click" CssClass="btn btn-secondary" />
                    </div>
                </div>
            </div>

            <!-- Achiever Table -->
            <div class="row">
                <div class="col-12">
                    <asp:GridView ID="gvAchievers" runat="server" CssClass="table table-striped text-center" AutoGenerateColumns="False"
                        OnRowCommand="gvAchievers_RowCommand" OnPageIndexChanging="gvAchievers_PageIndexChanging">
                        <Columns>
                            <asp:TemplateField HeaderText="Image">
                                <ItemTemplate>
                                    <img src='<%# Eval("ImagePath") %>' alt="Image" class="img-fluid rounded" width="100" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Session" HeaderText="Session" ReadOnly="True" SortExpression="Session" />
                            <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                            <asp:BoundField DataField="MidName" HeaderText="Middle Name" ReadOnly="True" SortExpression="MidName" />
                            <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="btnDeleteAchiever" runat="server" Text="Delete" CommandName="Delete"
                                        CommandArgument='<%# Eval("AchiverID") %>' OnClientClick="return confirm('Are you sure you want to delete this record?');"
                                        CssClass="btn btn-danger btn-sm" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>

            <!-- Pagination Info -->
            <div class="row mt-4">
                <div class="col-12 text-center">
                    <span class="fw-bold">Page <strong><%# gvAchievers.PageIndex + 1 %></strong> of 
                    <strong><%# Math.Ceiling((double)gvAchievers.PageCount) %></strong>
                    </span>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
