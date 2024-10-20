<%@ Page Title="Delete Achivers" Language="C#" MasterPageFile="Admin.master" AutoEventWireup="true" CodeFile="DeleteAchivers.aspx.cs" Inherits="Admin_pages_EditDeleteAlumni" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link rel="stylesheet" type="text/css" href="Styles/table.css" />
    <script src="Script/jquery.js"></script>
    <script src="Script/table.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="container">
        <h2>Delete Achivers</h2>
        <div class="search-bar">
            <label>
                Name:
            <asp:TextBox ID="txtName" runat="server" CssClass="textbox"></asp:TextBox>
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
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="AchiverID" OnRowEditing="GridView1_RowEditing" OnRowDeleting="GridView1_RowDeleting">
            <Columns>
                <asp:BoundField DataField="AchiverID" HeaderText="Achiver ID" ReadOnly="True" SortExpression="AchiverID" Visible="False" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Session" HeaderText="Session" SortExpression="Session" />
                <asp:BoundField DataField="RegistrationNo" HeaderText="Reg.No" SortExpression="RegistrationNo" />
                <asp:BoundField DataField="RegistrationYear" HeaderText="Reg.Year" SortExpression="RegistrationYear" />
                <asp:BoundField DataField="RollNo" HeaderText="Roll No." SortExpression="RollNo" />
                <asp:CommandField ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
    </div>
</asp:Content>
