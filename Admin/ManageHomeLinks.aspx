﻿<%@ Page Title="Manage Highlights Links" Language="C#" MasterPageFile="Admin.master" AutoEventWireup="true" CodeFile="ManageHomeLinks.aspx.cs" Inherits="Admin_pages_EditDeleteMarqueeLinks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link rel="stylesheet" type="text/css" href="Styles/table.css" />
    <script src="Script/jquery.js"></script>
    <script src="Script/table.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="container">
        <h2>Manage Highlights Links</h2>
        <div class="search-bar">
            <label>
                Link Text:
                <asp:TextBox ID="txtSearchLinkText" CssClass="datepicker textbox" runat="server"></asp:TextBox>
            </label>
            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" CssClass="btn" />
            <label>
                Records per page:
                <asp:DropDownList ID="ddlRecordsPerPage" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlRecordsPerPage_SelectedIndexChanged" CssClass="dropdown">
                    <asp:ListItem Value="10" Text="10" />
                    <asp:ListItem Value="20" Text="20" />
                    <asp:ListItem Value="50" Text="50" />
                </asp:DropDownList>
            </label>
            <asp:Button ID="btnPrevious" runat="server" Text="Previous" OnClick="btnPrevious_Click" CssClass="btn" />
            <asp:Button ID="btnNext" runat="server" Text="Next" OnClick="btnNext_Click" CssClass="btn" />
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="LinkID"
            OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating"
            OnRowDeleting="GridView1_RowDeleting" OnRowCancelingEdit="GridView1_RowCancelingEdit"
            OnRowDataBound="GridView1_RowDataBound">
            <Columns>
                <asp:BoundField DataField="LinkID" HeaderText="Link ID" ReadOnly="True" SortExpression="LinkID" Visible="False" />
                <asp:TemplateField HeaderText="Link Text">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtLinkText" runat="server" Text='<%# Bind("LinkText") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblLinkText" runat="server" Text='<%# Eval("LinkText") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Link URL">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtLinkURL" runat="server" Text='<%# Bind("LinkURL") %>'></asp:TextBox>
                        <asp:DropDownList ID="ddlLinkPicker" runat="server">
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblLinkURL" runat="server" Text='<%# Eval("LinkURL") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
