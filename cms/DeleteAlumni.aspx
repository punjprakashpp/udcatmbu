<%@ Page Title="Delete Alumni" Language="C#" MasterPageFile="cms.master" AutoEventWireup="true" CodeFile="DeleteAlumni.aspx.cs" Inherits="Admin_pages_DeleteAlumni" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <section class="py-5">
        <div class="container">
            <h2 class="text-center mb-4">Delete Alumni Records</h2>

            <!-- Search Bar -->
            <div class="row mb-4">
                <div class="col-12">
                    <div class="d-flex flex-wrap align-items-center gap-3">
                        <!-- Search Input -->
                        <div>
                            <label for="txtName" class="form-label">Search by Name:</label>
                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control d-inline-block" AutoPostBack="true"></asp:TextBox>
                        </div>
                        <!-- Search Button -->
                        <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" CssClass="btn btn-primary" />
                        <!-- Records Per Page -->
                        <div>
                            <label for="ddlRecordsPerPage" class="form-label">Records per page:</label>
                            <asp:DropDownList ID="ddlRecordsPerPage" runat="server" AutoPostBack="true"
                                OnSelectedIndexChanged="ddlRecordsPerPage_SelectedIndexChanged" CssClass="form-select">
                                <asp:ListItem Value="10" Text="10" />
                                <asp:ListItem Value="20" Text="20" />
                                <asp:ListItem Value="50" Text="50" />
                            </asp:DropDownList>
                        </div>
                        <!-- Navigation Buttons -->
                        <asp:Button ID="btnPrevious" runat="server" Text="Previous" OnClick="btnPrevious_Click" CssClass="btn btn-secondary" />
                        <asp:Button ID="btnNext" runat="server" Text="Next" OnClick="btnNext_Click" CssClass="btn btn-secondary" />
                    </div>
                </div>
            </div>

            <!-- Alumni Table -->
            <div class="row">
                <div class="col-12">
                    <asp:GridView ID="gvAlumni" runat="server" CssClass="table table-striped text-center" AutoGenerateColumns="False"
                        OnRowCommand="gvAlumni_RowCommand" OnPageIndexChanging="gvAlumni_PageIndexChanging">
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
                                    <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandName="Delete"
                                        CommandArgument='<%# Eval("AlumniID") %>' OnClientClick="return confirm('Are you sure you want to delete this record?');"
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
                    <span class="fw-bold">Page <strong><%# gvAlumni.PageIndex + 1 %></strong> of 
                    <strong><%# Math.Ceiling((double)gvAlumni.PageCount) %></strong>
                    </span>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
