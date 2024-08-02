<%@ Page Title="" Language="C#" MasterPageFile="Admin.master" AutoEventWireup="true" CodeFile="DeleteAlumni.aspx.cs" Inherits="Admin_pages_EditDeleteAlumni" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <title>Edit/Delete Alumni</title>
    <link rel="stylesheet" type="text/css" href="Styles/table.css" />
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="Script/table.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="container">
        <h2>Delete Alumni</h2>
        <div class="search-bar">
            <label>
                Session:
            <asp:DropDownList ID="ddlSession" runat="server" CssClass="dropdown" AutoPostBack="true" OnSelectedIndexChanged="ddlSession_SelectedIndexChanged">
            </asp:DropDownList>
            </label>
            <label>
                Roll No:
            <asp:TextBox ID="txtRollNo" runat="server" CssClass="textbox"></asp:TextBox>
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
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="AlumniID" OnRowEditing="GridView1_RowEditing" OnRowDeleting="GridView1_RowDeleting">
            <Columns>
                <asp:BoundField DataField="AlumniID" HeaderText="Alumni ID" ReadOnly="True" SortExpression="AlumniID" Visible="False" />
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
