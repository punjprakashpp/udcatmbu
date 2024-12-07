<%@ Page Title="Latest Notice" Language="C#" MasterPageFile="Site.master" AutoEventWireup="true" CodeFile="LatestNotice.aspx.cs" Inherits="pages_Notice" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" type="text/css" href="Content/pages.css">
</asp:Content>

<asp:Content ID="ContentBody" ContentPlaceHolderID="Content" runat="Server">
    <section class="py-5 bg-light">
        <div class="container contain bg-white rounded shadow-sm py-5 px-4">
            <h1 class="text-center text-white bg-gradient-primary rounded-top p-4 mb-4">Latest Notices & News</h1>

            <!-- Search and Controls Section -->
            <div class="row mb-4">
                <div class="col-md-4 text-start">
                    <label for="txtSearch" class="form-label">Search Notices & News:</label>
                    <asp:TextBox ID="txtSearch" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="col-md-2">
                    <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" CssClass="btn btn-primary mt-4" />
                </div>
                <div class="col-md-3">
                    <label class="form-label">Records per page:</label>
                    <asp:DropDownList ID="ddlRecordsPerPage" runat="server" CssClass="form-select" AutoPostBack="true" OnSelectedIndexChanged="ddlRecordsPerPage_SelectedIndexChanged">
                        <asp:ListItem Value="10" Text="10" />
                        <asp:ListItem Value="20" Text="20" />
                        <asp:ListItem Value="50" Text="50" />
                    </asp:DropDownList>
                </div>
                <div class="col-md-3 text-end">
                    <asp:Button ID="btnPrevPage" runat="server" Text="Previous" CssClass="btn btn-secondary mt-4" OnClick="btnPrevPage_Click" />
                    <asp:Button ID="btnNextPage" runat="server" Text="Next" CssClass="btn btn-secondary mt-4 ms-2" OnClick="btnNextPage_Click" />
                </div>
            </div>

            <!-- Message -->
            <div class="text-center mb-4">
                <asp:Label ID="lblmsg" runat="server" CssClass="text-danger"></asp:Label>
            </div>

            <!-- Table Section -->
            <div class="table-responsive">
                <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-striped" AutoGenerateColumns="False" DataKeyNames="DocsID">
                    <Columns>
                        <asp:BoundField DataField="DocsID" HeaderText="AffReg ID" SortExpression="DocsID" Visible="False" />
                        <asp:BoundField DataField="No" HeaderText="Notice No" SortExpression="No"/>
                        <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" DataFormatString="{0:dd-MM-yyyy}" />
                        <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                        <asp:TemplateField HeaderText="File">
                            <ItemTemplate>
                                <a href='/pdfjs/web/viewer.html?file=/<%# Eval("FilePath") %>' target="_blank" class="btn btn-link">View</a>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
            <div class="text-center mt-4">
                <asp:Label ID="lblPageInfo" runat="server" CssClass="fw-bold"></asp:Label>
            </div>
        </div>
    </section>
</asp:Content>
