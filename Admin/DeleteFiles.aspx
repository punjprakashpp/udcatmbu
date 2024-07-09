<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site.master" AutoEventWireup="true" CodeFile="DeleteFiles.aspx.cs" Inherits="Admin_pages_EditDeleteFiles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <title>Delete Files</title>
    <link rel="stylesheet" href="Styles/table.css">
    <style>
        .edit-delete-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin: 20px;
        }

        .form-row {
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            margin-bottom: 10px;
            gap: 10px;
            justify-content: center;
        }

        .form-row label {
            margin-right: 10px;
        }

        .form-row select, 
        .form-row input,
        .form-row button {
            padding: 5px 10px;
            font-size: 16px;
        }

        .form-row button {
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
        }

        .form-row button:hover {
            background-color: #0056b3;
        }

        .grid-view-container {
            width: 100%;
            max-width: 800px;
            margin-top: 20px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <center><h1>Delete Files</h1></center>
    <div class="edit-delete-container">
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
</asp:Content>
