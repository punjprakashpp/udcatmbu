<%@ Page Title="" Language="C#" MasterPageFile="~/cms/cms.master" AutoEventWireup="true" CodeFile="ManageVideoLinks.aspx.cs" Inherits="Admin_pages_EditDeleteMarqueeLinks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <div class="container py-4">
        <div class="row">
            <h1 class="text-center text-primary mb-4">Manage Video Links</h1>

            <!-- Search Bar -->
            <div class="row mb-4">
                <div class="col-12">
                    <div class="d-flex flex-wrap align-items-center justify-content-between gap-3">
                        <!-- Video Label Search -->
                        <div class="flex-grow-1">
                            <label for="txtSearchVideoLabel" class="form-label">Search Video:</label>
                            <asp:TextBox ID="txtSearchVideoLabel" CssClass="form-control" runat="server" Placeholder="Enter video label"></asp:TextBox>
                        </div>

                        <!-- Search Button -->
                        <div>
                            <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary" OnClick="btnSearch_Click" />
                        </div>

                        <!-- Records Per Page -->
                        <div>
                            <label for="ddlRecordsPerPage" class="form-label">Records per page:</label>
                            <asp:DropDownList ID="ddlRecordsPerPage" runat="server" AutoPostBack="true" CssClass="form-select" OnSelectedIndexChanged="ddlRecordsPerPage_SelectedIndexChanged">
                                <asp:ListItem Value="10" Text="10" />
                                <asp:ListItem Value="20" Text="20" />
                                <asp:ListItem Value="50" Text="50" />
                            </asp:DropDownList>
                        </div>

                        <!-- Pagination -->
                        <div class="d-flex gap-2">
                            <asp:Button ID="btnPrevious" runat="server" Text="Previous" CssClass="btn btn-secondary" OnClick="btnPrevious_Click" />
                            <asp:Button ID="btnNext" runat="server" Text="Next" CssClass="btn btn-secondary" OnClick="btnNext_Click" />
                        </div>
                    </div>
                </div>
            </div>

            <!-- Video Links Grid -->
            <div class="table-responsive">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="LinkID" CssClass="table table-striped table-bordered align-middle"
                    OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating"
                    OnRowDeleting="GridView1_RowDeleting" OnRowCancelingEdit="GridView1_RowCancelingEdit"
                    OnRowDataBound="GridView1_RowDataBound">
                    <Columns>
                        <asp:BoundField DataField="LinkID" HeaderText="Video ID" ReadOnly="True" SortExpression="LinkID" Visible="False" />
                        <asp:TemplateField HeaderText="Video Label">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtVideoText" runat="server" Text='<%# Bind("LinkText") %>' CssClass="form-control"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblVideoText" runat="server" Text='<%# Eval("LinkText") %>' CssClass="text-truncate"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Video URL">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtVideoURL" runat="server" Text='<%# Bind("LinkURL") %>' CssClass="form-control"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblVideoURL" runat="server" Text='<%# Eval("LinkURL") %>' CssClass="text-truncate"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>