<%@ Page Title="" Language="C#" MasterPageFile="Admin.master" AutoEventWireup="true" CodeFile="DeleteNewspaper.aspx.cs" Inherits="Admin_pages_DeleteNewspaper" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <title>Delete Newspaper Image</title>
    <link rel="stylesheet" href="Styles/manage.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="container">
        <h2>Delete Newspaper Image</h2>
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
        <div>
            <asp:TextBox ID="txtSearch" runat="server" Placeholder="Search by Description"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
        </div>
        <asp:GridView ID="gvNewspapers" runat="server" AutoGenerateColumns="False" DataKeyNames="ID"
            AllowPaging="True" PageSize="25" OnPageIndexChanging="gvNewspapers_PageIndexChanging" 
            OnRowDeleting="gvNewspapers_RowDeleting">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" Visible="False" />
                <asp:BoundField DataField="Title" HeaderText="Description" />
                <asp:ImageField DataImageUrlField="ImagePath" HeaderText="Image" ControlStyle-Height="100px" ControlStyle-Width="150px">
                    <ControlStyle Height="100px" Width="150px" />
                </asp:ImageField>
                <asp:CommandField ShowDeleteButton="True" DeleteText="Delete" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
