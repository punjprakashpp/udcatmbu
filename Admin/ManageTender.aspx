﻿<%@ Page Title="Manage Tender" Language="C#" MasterPageFile="Admin.master" AutoEventWireup="true" CodeFile="ManageTender.aspx.cs" Inherits="Admin_pages_EditDeleteTender" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <link rel="stylesheet" type="text/css" href="Styles/table.css" />
    <link href="Styles/jquery-ui.css" rel="stylesheet" />
    <script src="Script/jquery.js"></script>
    <script src="Script/jquery-ui.js"></script>
    <script src="Script/table.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".datepicker").datepicker({
                dateFormat: 'dd-mm-yy'
            });
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="container">
        <h2>Manage Tender</h2>
        <div class="search-bar">
            <label>
                Search using:&nbsp;&nbsp;
                <asp:RadioButton ID="rdNo" runat="server" Text=" No." GroupName="SearchCriteria" />&nbsp;&nbsp;
                <asp:RadioButton ID="rdTitle" runat="server" Text=" Tender:" GroupName="SearchCriteria" />&nbsp;
                <asp:TextBox ID="txtSearch" CssClass="textbox" runat="server"></asp:TextBox>
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
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="DocsID" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting" OnRowCancelingEdit="GridView1_RowCancelingEdit">
            <Columns>
                <asp:BoundField DataField="DocsID" HeaderText="Tender ID" ReadOnly="True" SortExpression="DocsID" Visible="False" />
                <asp:TemplateField HeaderText="No.">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtNo" runat="server" Text='<%# Bind("No") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblNo" runat="server" Text='<%# Eval("No") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Tender">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtTitle" runat="server" Text='<%# Bind("Title") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblTitle" runat="server" Text='<%# Eval("Title") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Date">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtTenderDate" runat="server" CssClass="datepicker" Text='<%# Bind("Date", "{0:dd-MM-yyyy}") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblTenderDate" runat="server" Text='<%# Eval("Date", "{0:dd-MM-yyyy}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="File Path">
                    <EditItemTemplate>
                        <asp:FileUpload ID="fileUpload" runat="server" />
                        <asp:HiddenField ID="hiddenFilePath" runat="server" Value='<%# Eval("FilePath") %>' />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblFilePath" runat="server" Text='<%# Eval("FilePath") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
    </div>
</asp:Content>