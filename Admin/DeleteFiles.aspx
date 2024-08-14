<%@ Page Title="Delete Files" Language="C#" MasterPageFile="Admin.master" AutoEventWireup="true" CodeFile="DeleteFiles.aspx.cs" Inherits="Admin_pages_EditDeleteFiles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link rel="stylesheet" type="text/css" href="Styles/table.css" />
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="Script/table.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="container">
        <h2>Delete Downloadable Files</h2>
        <div class="search-bar">
            <label>
                Search Document:
                <asp:TextBox ID="txtSearch" runat="server" CssClass="textbox" placeholder="Search by file name"></asp:TextBox>
            </label>
            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" CssClass="btn" />
        </div>
        <asp:GridView ID="GridViewFiles" runat="server" AutoGenerateColumns="False" DataKeyNames="FilesID" OnRowCommand="GridViewFiles_RowCommand" AllowPaging="True" PageSize="10" OnPageIndexChanging="GridViewFiles_PageIndexChanging">
            <Columns>
                <asp:BoundField DataField="FileName" HeaderText="File Name" />
                <asp:BoundField DataField="FileType" HeaderText="File Type" />
                <asp:BoundField DataField="Semester" HeaderText="Semester" />
                <asp:BoundField DataField="Session" HeaderText="Session" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkDelete" runat="server" CommandName="DeleteFile" CommandArgument='<%# Eval("FilesID") %>'>Delete</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>
