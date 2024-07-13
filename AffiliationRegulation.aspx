<%@ Page Title="" Language="C#" MasterPageFile="Root.master" AutoEventWireup="true" CodeFile="AffiliationRegulation.aspx.cs" Inherits="pages_AffReg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Affiliations & Regulations</title>
    <link rel="stylesheet" href="style/table.css">
    <link rel="stylesheet" href="style/alumni.css">
    <link rel="stylesheet" href="style/download.css">
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

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <h1 style="text-align: center; padding: 20px 0; background-color: #369; color: white; font-size: 1.8em; font-weight: bold; text-transform: uppercase; margin-top: 20px; margin-bottom: 20px; border-top-left-radius: 10px; border-top-right-radius: 10px;">Affiliations & Regulations</h1>
        <div class="search-bar">
            <label>
                Affiliations & Regulations Date:
                <asp:TextBox ID="txtSearchDate" CssClass="datepicker textbox" runat="server"></asp:TextBox>
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
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="BID" OnRowDataBound="GridView1_RowDataBound">
            <Columns>
                <asp:BoundField DataField="BID" HeaderText="AffReg ID" SortExpression="BID" Visible="False" />
                <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" DataFormatString="{0:dd-MM-yyyy}" />
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                <asp:TemplateField HeaderText="File">
                    <ItemTemplate>
                        <a href='<%# Eval("FilePath") %>' target="_blank">View</a>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br />
    </div>
</asp:Content>
