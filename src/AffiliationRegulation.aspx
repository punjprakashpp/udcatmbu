<%@ Page Title="Affiliations & Regulations" Language="C#" MasterPageFile="Website.master" AutoEventWireup="true" CodeFile="AffiliationRegulation.aspx.cs" Inherits="pages_AffiliationRegulation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="style/site.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content1" runat="Server">
    <div class="cont">
        <div class="container">
            <h1>Affiliations & Regulations</h1>
            <div class="search-bar">
                <label>Search Affiliations & Regulations: </label>
                <asp:TextBox ID="txtSearch" CssClass="textbox" runat="server"></asp:TextBox>
                <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" CssClass="btn" />
            </div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="DocsID" AllowPaging="True" PageSize="10" OnPageIndexChanging="AffReg_PageIndexChanging">
                <Columns>
                    <asp:BoundField DataField="DocsID" HeaderText="AffReg ID" SortExpression="DocsID" Visible="False" />
                    <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" DataFormatString="{0:dd-MM-yyyy}" />
                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
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
