<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site.master" AutoEventWireup="true" CodeFile="DeleteGalleryImage.aspx.cs" Inherits="Admin_pages_DeleteGalleryImage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <title>Delete Gallery Images</title>
    <link rel="stylesheet" href="Styles/manage.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="container">
        <h2>Delete Gallery Images</h2>
        <div class="form-group">
            <label for="txtSearch">Search by Occasion:</label>
            <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
        </div>
        <asp:Label ID="lblMessage" runat="server" Text="" ForeColor="Red"></asp:Label>
        <asp:GridView ID="gvGallery" runat="server" AutoGenerateColumns="False" DataKeyNames="ID"
            OnRowDeleting="gvGallery_RowDeleting" AllowPaging="True" PageSize="10"
            OnPageIndexChanging="gvGallery_PageIndexChanging">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" Visible="False" />
                <asp:BoundField DataField="Title" HeaderText="Occasion" />
                <asp:ImageField DataImageUrlField="ImagePath" HeaderText="Image" ControlStyle-Height="100px" ControlStyle-Width="150px">
                    <ControlStyle Height="100px" Width="150px" />
                </asp:ImageField>
                <asp:CommandField ShowDeleteButton="True" DeleteText="Delete" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
