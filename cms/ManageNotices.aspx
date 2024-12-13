<%@ Page Title="Manage Notice" Language="C#" MasterPageFile="~/cms/cms.master" AutoEventWireup="true" CodeFile="ManageNotices.aspx.cs" Inherits="cms_ManageNotice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <div class="container">
        <div class="row">
            <div class="col col-md-6 m-auto">
                <h2 class="text-center">Manage Notice</h2>
                <div class="search-bar">
                    <table class="table table-responsive">
                        <tr>
                            <td>Search using:</td>
                            <td>
                                <asp:RadioButton ID="rdNo" runat="server" Text="No." GroupName="SearchCriteria" /></td>
                            <td>
                                <asp:RadioButton ID="rdTitle" runat="server" Text="Notice:" GroupName="SearchCriteria" /></td>
                            <td>
                                <asp:TextBox ID="txtSearch" CssClass="form-control" runat="server"></asp:TextBox></td>
                            <td>
                                <asp:Button ID="btnSearch" runat="server" CssClass="form-control btn btn-secondary" Text="Search" OnClick="btnSearch_Click" /></td>
                        </tr>
                    </table>
                </div>
                <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
            </div>
        </div>
        <div class="row">
            <div class="col col-md-12 m-auto">
                <div class=" table-responsive">
                    <asp:GridView ID="gvNotice" runat="server" AutoGenerateColumns="False" DataKeyNames="DocsID"
                        CssClass="table table-bordered table-striped"
                        OnRowEditing="gvNotice_RowEditing" OnRowUpdating="gvNotice_RowUpdating"
                        OnRowDeleting="gvNotice_RowDeleting" OnRowCancelingEdit="gvNotice_RowCancelingEdit"
                        AllowPaging="True" PageSize="10" OnPageIndexChanging="gvNotice_PageIndexChanging">
                        <Columns>
                            <asp:BoundField DataField="DocsID" HeaderText="Notice ID" ReadOnly="True" SortExpression="DocsID" Visible="False" />
                            <asp:TemplateField HeaderText="No" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtNo" runat="server" CssClass="form-control" Text='<%# Bind("No") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblNo" runat="server" Text='<%# Eval("No") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Notice" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" Text='<%# Bind("Title") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ControlToValidate="txtTitle" ErrorMessage="Title is required." ForeColor="Red" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblTitle" runat="server" Text='<%# Eval("Title") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Date" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtNoticeDate" TextMode="Date" runat="server" CssClass="form-control" Text='<%# Bind("Date") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblNoticeDate" runat="server" Text='<%# Eval("Date") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="File Path" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center">
                                <EditItemTemplate>
                                    <asp:FileUpload ID="fileUpload" runat="server" CssClass="form-control" />
                                    <asp:HiddenField ID="hiddenFilePath" runat="server" Value='<%# Eval("FilePath") %>' />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblFilePath" runat="server" Text='<%# Eval("FilePath") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField HeaderText="Action" ShowEditButton="True" ShowDeleteButton="True" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" ButtonType="Button" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
