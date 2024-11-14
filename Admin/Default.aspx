<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link rel="stylesheet" type="text/css" href="../style/StyleSheet.css" />
    <style>
        .container {
            margin-top: 20px;
        }

        .stats-card {
            background-color: #f9f9f9;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .card h4 {
            margin-bottom: 15px;
            font-size: 18px;
            font-weight: bold;
        }

        .table th, .table td {
            text-align: center;
            padding: 10px;
        }

        .card {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="container">
        <h2 class="text-center">Admin Dashboard</h2>
        <div class="row mb-10 mt-10">
            <!-- Stats Section -->
            <div class="col col-3">
                <div class="card stats-card">
                    <h4>Total Students</h4>
                    <asp:label runat="server" Text="Loading..." id="lbltotalStudents"></asp:label>
                </div>
            </div>
            <div class="col col-3">
                <div class="card stats-card">
                    <h4>Total Achievers</h4>
                    <asp:label runat="server" Text="Loading..." id="lbltotalAchievers"></asp:label>
                </div>
            </div>
            <div class="col col-3">
                <div class="card stats-card">
                    <h4>Total Alumni</h4>
                    <asp:label runat="server" Text="Loading..." id="lbltotalAlumni"></asp:label>
                </div>
            </div>
            <div class="col col-3">
                <div class="card stats-card">
                    <h4>Total Faculty</h4>
                    <asp:label runat="server" Text="Loading..." id="lbltotalFaculty"></asp:label>
                </div>
            </div>
        </div>
        <div class="row mb-10">
            <!-- Stats Section -->
            <div class="col col-3">
                <div class="card stats-card">
                    <h4>Total Staffs</h4>
                    <asp:label runat="server" Text="Loading..." id="lbltotalStaffs"></asp:label>
                </div>
            </div>
            <div class="col col-3">
                <div class="card stats-card">
                    <h4>Total Notice</h4>
                    <asp:label runat="server" Text="Loading..." id="lbltotalNotice"></asp:label>
                </div>
            </div>
            <div class="col col-3">
                <div class="card stats-card">
                    <h4>Total UDCA Docs</h4>
                    <asp:label runat="server" Text="Loading..." id="lbltotalDocs"></asp:label>
                </div>
            </div>
            <div class="col col-3">
                <div class="card stats-card">
                    <h4>Total Uploaded Files</h4>
                    <asp:label runat="server" Text="Loading..." id="lbltotalFiles"></asp:label>
                </div>
            </div>
        </div>
    </div>
</asp:Content>