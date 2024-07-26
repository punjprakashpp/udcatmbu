<%@ Page Title="" Language="C#" MasterPageFile="Site.master" AutoEventWireup="true" CodeFile="ManageHomeButton.aspx.cs" Inherits="Admin_pages_EditDeleteMarqueeLinks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <title>Edit/Delete Home Buttons</title>
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
                padding: 5px; /* Increase padding for better spacing */
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="container">
        <h2>Manage Home Buttons</h2>
        <div class="search-bar">
            <label>
                Button Label:
                <asp:TextBox ID="txtSearchButtonLabel" CssClass="datepicker textbox" runat="server"></asp:TextBox>
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
                <asp:TemplateField HeaderText="Button Label">
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
