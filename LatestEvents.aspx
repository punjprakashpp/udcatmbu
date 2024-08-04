<%@ Page Title="Latest Events" Language="C#" MasterPageFile="Website.master" AutoEventWireup="true" CodeFile="LatestEvents.aspx.cs" Inherits="pages_Event" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="style/site.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content1" runat="Server">
    <div class="cont">
        <div class="container">
            <h1 class="my-h1">Latest Events</h1>
            <div class="search-bar">
                <label>
                    Search Event:
                <asp:TextBox ID="txtSearch" CssClass="textbox" runat="server"></asp:TextBox>
                </label>
                <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click"
                    CssClass="btn" />
                <label>
                    Records per page:
                <asp:DropDownList ID="ddlRecordsPerPage" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlRecordsPerPage_SelectedIndexChanged"
                    CssClass="dropdown">
                    <asp:ListItem Value="10" Text="10" />
                    <asp:ListItem Value="20" Text="20" />
                    <asp:ListItem Value="50" Text="50" />
                </asp:DropDownList>
                </label>
                <asp:Button ID="btnPrevious" runat="server" Text="Previous" OnClick="btnPrevious_Click"
                    CssClass="btn" />
                <asp:Button ID="btnNext" runat="server" Text="Next" OnClick="btnNext_Click" CssClass="btn" />
            </div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="DocsID" OnRowDataBound="GridView1_RowDataBound">
                <Columns>
                    <asp:BoundField DataField="DocsID" HeaderText="Event ID" SortExpression="DocsID" Visible="False" />
                    <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" DataFormatString="{0:dd-MM-yyyy}" />
                    <asp:BoundField DataField="Title" HeaderText="Event" SortExpression="Title" />
                    <asp:TemplateField HeaderText="File">
                        <ItemTemplate>
                            <a href='<%# Eval("FilePath") %>' target="_blank">View</a>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
