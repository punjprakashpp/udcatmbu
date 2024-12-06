<%@ Page Title="Latest Events" Language="C#" MasterPageFile="Site.master" AutoEventWireup="true" CodeFile="LatestEvents.aspx.cs" Inherits="pages_Event" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="style/site.css">
</asp:Content>
<asp:Content ID="ContentBody" ContentPlaceHolderID="Content" runat="Server">
    <div class="cont">
        <div class="container">
            <h1 class="my-h1">Latest Events</h1>
            <div class="search-bar">
                <label>Search Event: </label>
                <asp:TextBox ID="txtSearch" CssClass="textbox" runat="server"></asp:TextBox>
                <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" CssClass="btn" />
            </div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="DocsID" AllowPaging="True" PageSize="10" OnPageIndexChanging="AffReg_PageIndexChanging">
                <Columns>
                    <asp:BoundField DataField="DocsID" HeaderText="Event ID" SortExpression="DocsID" Visible="False" />
                    <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" DataFormatString="{0:dd-MM-yyyy}" />
                    <asp:BoundField DataField="Title" HeaderText="Event" SortExpression="Title" />
                    <asp:TemplateField HeaderText="File">
                        <ItemTemplate>
                            <a href='/pdfjs/web/viewer.html?file=/<%# Eval("FilePath") %>' target="_blank">View</a>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
