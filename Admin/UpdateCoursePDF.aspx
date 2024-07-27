<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site.master" AutoEventWireup="true" CodeFile="UpdateCoursePDF.aspx.cs" Inherits="Admin_pages_UpdateOtherPDF" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <title>Update Other PDF</title>
    <link rel="stylesheet" href="Styles/add.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2 style="text-align:center;">Update Course Related PDF</h2>
    <table style="width: 100%;">
        <tr>
            <td>
                <asp:Label ID="lblCalender" runat="server" Text="Upload Academic Calender PDF:"></asp:Label>
            </td>
            <td>
                <asp:FileUpload ID="fileUploadCalender" runat="server" />
            </td>
            <td>
                <asp:Button ID="btnCalender" runat="server" Text="Submit" OnClick="btnCalender_Click" />
            </td>
            <td></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblProspectus" runat="server" Text="Upload Prospectus PDF:"></asp:Label>
            </td>
            <td>
                <asp:FileUpload ID="fileUploadProspectus" runat="server" />
            </td>
            <td>
                <asp:Button ID="btnProspectus" runat="server" Text="Submit" OnClick="btnProspectus_Click" />
            </td>
            <td></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblTimeTable" runat="server" Text="Upload Time Table PDF:"></asp:Label>
            </td>
            <td>
                <asp:FileUpload ID="fileUploadTimeTable" runat="server" />
            </td>
            <td>
                <asp:Button ID="btnTimeTable" runat="server" Text="Submit" OnClick="btnTimeTable_Click" />
            </td>
            <td></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblHolidayList" runat="server" Text="Upload Holiday List PDF:"></asp:Label>
            </td>
            <td>
                <asp:FileUpload ID="fileUploadHolidayList" runat="server" />
            </td>
            <td>
                <asp:Button ID="btnHolidayList" runat="server" Text="Submit" OnClick="btnHolidayList_Click" />
            </td>
            <td></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblCourseStructure" runat="server" Text="Upload Course Structure PDF:"></asp:Label>
            </td>
            <td>
                <asp:FileUpload ID="fileUploadCourseStructure" runat="server" />
            </td>
            <td>
                <asp:Button ID="btnCourseStructure" runat="server" Text="Submit" OnClick="btnCourseStructure_Click" />
            </td>
            <td></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblCourseSyllabus" runat="server" Text="Upload Course Syllabus PDF:"></asp:Label>
            </td>
            <td>
                <asp:FileUpload ID="fileUploadCourseSyllabus" runat="server" />
            </td>
            <td>
                <asp:Button ID="btnCourseSyllabus" runat="server" Text="Submit" OnClick="btnCourseSyllabus_Click" />
            </td>
            <td></td>
        </tr>
        <tr>
            <td colspan="3"><asp:Label ID="lblMessage" runat="server" Text=""></asp:Label></td>
            <td></td>
        </tr>
    </table>
</asp:Content>

