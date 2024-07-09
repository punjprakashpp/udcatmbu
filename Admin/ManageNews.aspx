<%@ Page Title="" Language="C#" MasterPageFile="Site.master" AutoEventWireup="true" CodeFile="ManageNews.aspx.cs" Inherits="Admin_pages_EditDeleteNews" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <title>Edit/Delete News</title>
    <link rel="stylesheet" type="text/css" href="Styles/table.css" />
    <link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".datepicker").datepicker({
                dateFormat: 'dd-mm-yy'
            });
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="container">
        <h2>Manage News</h2>
        <div class="search-bar">
            <label>
                News Date:
                <asp:TextBox ID="txtSearchDate" CssClass="datepicker textbox" runat="server" ></asp:TextBox>
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
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="NewsID" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting" OnRowCancelingEdit="GridView1_RowCancelingEdit">
            <Columns>
                <asp:BoundField DataField="NewsID" HeaderText="News ID" ReadOnly="True" SortExpression="NewsID" Visible="False" />
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                <asp:TemplateField HeaderText="News Date">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtNewsDate" runat="server" CssClass="datepicker" Text='<%# Bind("NewsDate", "{0:dd-MM-yyyy}") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblNewsDate" runat="server" Text='<%# Eval("NewsDate", "{0:dd-MM-yyyy}") %>'></asp:Label>
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
