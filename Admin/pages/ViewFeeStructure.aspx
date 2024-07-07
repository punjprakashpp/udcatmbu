<%@ Page Title="" Language="C#" MasterPageFile="../Site.master" AutoEventWireup="true" CodeFile="ViewFeeStructure.aspx.cs" Inherits="Admin_pages_ViewFeeStructure" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <title>View Fee Structure</title>
    <link rel="stylesheet" type="text/css" href="../Styles/table.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2>View Fee Structure</h2>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="Semester" HeaderText="Semester" />
            <asp:BoundField DataField="Admission" HeaderText="Admission Fee" />
            <asp:BoundField DataField="Academic" HeaderText="Academic Fee" />
            <asp:BoundField DataField="Computer" HeaderText="Computer Lab Fee" />
            <asp:BoundField DataField="Miscellaneous" HeaderText="Miscellaneous Fee" />
            <asp:BoundField DataField="Examination" HeaderText="Examination Fee" />
            <asp:BoundField DataField="Total" HeaderText="Total Fee" />
        </Columns>
    </asp:GridView>
</asp:Content>

