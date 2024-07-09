<%@ Page Title="View Important Dates" Language="C#" MasterPageFile="Site.master" AutoEventWireup="true" CodeFile="ViewImportantDates.aspx.cs" Inherits="Admin_pages_ViewImportantDates" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <title>View Important Dates</title>
    <link rel="stylesheet" type="text/css" href="Styles/table.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div>
        <h2>View Important Dates</h2>
        <table class="table table-bordered">
            <tr>
                <td>Online Application Start Date:</td>
                <td><asp:Label ID="lblAppStartDate" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td>Online Application End Date:</td>
                <td><asp:Label ID="lblAppEndDate" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td>Fee for TMBU Candidate:</td>
                <td><asp:Label ID="lblTMBUCandFee" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td>Fee for Other Candidate:</td>
                <td><asp:Label ID="lblOthCandFee" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td>Publication of Merit List-I Date:</td>
                <td><asp:Label ID="lblMeritIDate" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td>Merit List-I Admission Start Date:</td>
                <td><asp:Label ID="lblAdmIStartDate" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td>Merit List-I Admission End Date:</td>
                <td><asp:Label ID="lblAdmIEndDate" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td>Publication of Merit List-II Date:</td>
                <td><asp:Label ID="lblMeritIIDate" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td>Merit List-II Admission Start Date:</td>
                <td><asp:Label ID="lblAdmIIStartDate" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td>Merit List-II Admission End Date:</td>
                <td><asp:Label ID="lblAdmIIEndDate" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td>Class Commencement/Start Date:</td>
                <td><asp:Label ID="lblClassStartDate" runat="server"></asp:Label></td>
            </tr>
        </table>
    </div>
</asp:Content>
