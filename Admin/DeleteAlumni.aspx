<%@ Page Title="" Language="C#" MasterPageFile="Site.master" AutoEventWireup="true" CodeFile="DeleteAlumni.aspx.cs" Inherits="Admin_pages_EditDeleteAlumni" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <title>Edit/Delete Alumni</title>
    <style>
        /* Base Styles */
        .container {
            max-width: 1200px; /* Set a max-width for better layout control on large screens */
            margin: 0 auto;
            padding: 0 15px;
        }

            .container h2 {
                font-size: 1.5rem; /* Use relative units for scalability */
                margin: 0 0 1rem 0; /* Combine margin properties for shorthand */
                text-align: center;
            }

            .container table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 1.5rem; /* Add space below the table */
            }

            .container th,
            .container td {
                border: 1px solid #ddd; /* Softer border color */
                padding: 12px 15px; /* Increase padding for better spacing */
                font-size: 1rem;
                text-align: left;
            }

            .container th {
                background-color: #f9f9f9; /* Add background to table headers */
                font-weight: bold;
            }

            .container td a {
                text-decoration: none;
                color: #007bff; /* Use a more visible link color */
                font-weight: 500;
            }

                .container td a:hover {
                    text-decoration: underline;
                }

        @media (max-width: 767px) {
            .container th,
            .container td {
                padding: 2px; /* Increase padding for better spacing */
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="container">
        <h2>Delete Alumni</h2>
        <div class="search-bar">
            <label>
                Search Session:
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
