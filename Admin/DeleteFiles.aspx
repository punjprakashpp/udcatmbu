<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site.master" AutoEventWireup="true" CodeFile="DeleteFiles.aspx.cs" Inherits="Admin_pages_EditDeleteFiles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <title>Delete Files</title>
    <link rel="stylesheet" type="text/css" href="Styles/table.css" />
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="Script/table.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="container">
    <center><h1>Delete Files</h1></center>
    <div class="table-container">
        <div class="form-row">
            <asp:TextBox ID="txtSearch" runat="server" placeholder="Search by file name"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
        </div>
        <div class="grid-view-container">
            <asp:GridView ID="GridViewFiles" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" OnRowCommand="GridViewFiles_RowCommand" AllowPaging="True" PageSize="10" OnPageIndexChanging="GridViewFiles_PageIndexChanging">
                <Columns>
                    <asp:BoundField DataField="FileName" HeaderText="File Name" />
                    <asp:BoundField DataField="FileType" HeaderText="File Type" />
                    <asp:BoundField DataField="Semester" HeaderText="Semester" />
                    <asp:BoundField DataField="Session" HeaderText="Session" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkDelete" runat="server" CommandName="DeleteFile" CommandArgument='<%# Eval("Id") %>'>Delete</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>

        <div class="form-row">
            <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
        </div>
    </div>
        </div>
</asp:Content>
