<%@ Page Title="" Language="C#" MasterPageFile="~/cms/cms.master" AutoEventWireup="true" CodeFile="ManageHighlightLinks.aspx.cs" Inherits="cms_ManageHighlightLinks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <div class="container">
        <div class="row">
            <div class="col col-md-6 m-auto">
                <h2 class="text-center">Manage Highlight Links</h2>
                <div class="search-bar">
                    <table class="table table-responsive">
                        <tr>
                            <td>Search Highlight Link:</td>
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
                    <asp:GridView ID="gvLinks" runat="server" AutoGenerateColumns="False" DataKeyNames="LinkID"
                        CssClass="table table-bordered table-striped"
                        OnRowEditing="gvLinks_RowEditing" OnRowUpdating="gvLinks_RowUpdating" OnRowDataBound="gvLinks_RowDataBound"
                        OnRowDeleting="gvLinks_RowDeleting" OnRowCancelingEdit="gvLinks_RowCancelingEdit"
                        AllowPaging="True" PageSize="10" OnPageIndexChanging="gvLinks_PageIndexChanging">
                        <Columns>
                            <asp:BoundField DataField="LinkID" HeaderText="Link ID" ReadOnly="True" SortExpression="LinkID" Visible="False" />
                            <asp:TemplateField HeaderText="Link Text" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtLinkText" runat="server" CssClass="form-control" Text='<%# Bind("LinkText") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblLinkText" runat="server" Text='<%# Eval("LinkText") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Link URL" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center">
                                <EditItemTemplate>
                                    <label class="form-control">Check it if Link is external.<asp:CheckBox ID="chkboxExt" runat="server" AutoPostBack="true" OnCheckedChanged="chkboxExt_CheckedChanged" /></label>
                                    <asp:TextBox ID="txtLinkURL" runat="server" CssClass="form-control" Text='<%# Bind("LinkURL") %>' Enabled="false"></asp:TextBox>
                                    <asp:DropDownList ID="ddlLinkPicker" CssClass="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlLinkPicker_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblLinkURL" runat="server" Text='<%# Eval("LinkURL") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" HeaderText="Action" ButtonType="Button" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

