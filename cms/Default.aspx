<%@ Page Title="Dashboard" Language="C#" MasterPageFile="cms.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .stats-card {
            background-color: #f8f9fa;
            border: 1px solid #dee2e6;
            border-radius: 0.5rem;
            box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
            text-align: center;
            padding: 1.5rem;
        }

        .stats-card h4 {
            font-size: 1.25rem;
            margin-bottom: 1rem;
        }

        .stats-card label {
            font-weight: bold;
            font-size: 1.5rem;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <div class="container mt-4">
        <h2 class="text-center mb-4">Admin Dashboard</h2>
        <div class="row g-4">
            <!-- Stats Section -->
            <div class="col-12 col-md-3">
                <div class="stats-card">
                    <h4>Total Students</h4>
                    <asp:label runat="server" Text="Loading..." id="lbltotalStudents"></asp:label>
                </div>
            </div>
            <div class="col-12 col-md-3">
                <div class="stats-card">
                    <h4>Total Achievers</h4>
                    <asp:label runat="server" Text="Loading..." id="lbltotalAchievers"></asp:label>
                </div>
            </div>
            <div class="col-12 col-md-3">
                <div class="stats-card">
                    <h4>Total Alumni</h4>
                    <asp:label runat="server" Text="Loading..." id="lbltotalAlumni"></asp:label>
                </div>
            </div>
            <div class="col-12 col-md-3">
                <div class="stats-card">
                    <h4>Total Faculty</h4>
                    <asp:label runat="server" Text="Loading..." id="lbltotalFaculty"></asp:label>
                </div>
            </div>
        </div>
        <div class="row g-4 mt-3">
            <div class="col-12 col-md-3">
                <div class="stats-card">
                    <h4>Total Staffs</h4>
                    <asp:label runat="server" Text="Loading..." id="lbltotalStaffs"></asp:label>
                </div>
            </div>
            <div class="col-12 col-md-3">
                <div class="stats-card">
                    <h4>Total Notice</h4>
                    <asp:label runat="server" Text="Loading..." id="lbltotalNotice"></asp:label>
                </div>
            </div>
            <div class="col-12 col-md-3">
                <div class="stats-card">
                    <h4>Total UDCA Docs</h4>
                    <asp:label runat="server" Text="Loading..." id="lbltotalDocs"></asp:label>
                </div>
            </div>
            <div class="col-12 col-md-3">
                <div class="stats-card">
                    <h4>Total Uploaded Files</h4>
                    <asp:label runat="server" Text="Loading..." id="lbltotalFiles"></asp:label>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
