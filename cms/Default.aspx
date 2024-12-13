<%@ Page Title="Dashboard" Language="C#" MasterPageFile="cms.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .card {
            display: block;
            text-decoration: none;
            color: inherit;
            border: 1px solid #dee2e6;
            border-radius: 0.5rem;
            box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.1);
            padding: 1.5rem;
            text-align: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: scale(1.05);
            box-shadow: 0 1rem 2rem rgba(0, 0, 0, 0.2);
        }

        .card h4 {
            font-size: 1.25rem;
            margin-bottom: 1rem;
        }

        .card asp:label {
            font-weight: bold;
            font-size: 1.5rem;
            display: block;
            margin-top: 1rem;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <div class="container mt-4">
        <h2 class="text-center mb-4">Admin Dashboard</h2>
        <div class="row g-4">
            <!-- Stats Section -->
            <div class="col-12 col-md-3">
                <a href="Students.aspx" class="card">
                    <h4>Total Students</h4>
                    <asp:Label runat="server" Text="Loading..." ID="lbltotalStudents"></asp:Label>
                </a>
            </div>
            <div class="col-12 col-md-3">
                <a href="Achievers.aspx" class="card">
                    <h4>Total Achievers</h4>
                    <asp:Label runat="server" Text="Loading..." ID="lbltotalAchievers"></asp:Label>
                </a>
            </div>
            <div class="col-12 col-md-3">
                <a href="Alumni.aspx" class="card">
                    <h4>Total Alumni</h4>
                    <asp:Label runat="server" Text="Loading..." ID="lbltotalAlumni"></asp:Label>
                </a>
            </div>
            <div class="col-12 col-md-3">
                <a href="Faculty.aspx" class="card">
                    <h4>Total Faculty</h4>
                    <asp:Label runat="server" Text="Loading..." ID="lbltotalFaculty"></asp:Label>
                </a>
            </div>
        </div>
        <div class="row g-4 mt-4">
            <div class="col-12 col-md-3">
                <a href="Staffs.aspx" class="card">
                    <h4>Total Staffs</h4>
                    <asp:Label runat="server" Text="Loading..." ID="lbltotalStaffs"></asp:Label>
                </a>
            </div>
            <div class="col-12 col-md-3">
                <a href="ManageNotices.aspx" class="card">
                    <h4>Total Notice</h4>
                    <asp:Label runat="server" Text="Loading..." ID="lbltotalNotice"></asp:Label>
                </a>
            </div>
            <div class="col-12 col-md-3">
                <a href="Docs.aspx" class="card">
                    <h4>Total UDCA Docs</h4>
                    <asp:Label runat="server" Text="Loading..." ID="lbltotalDocs"></asp:Label>
                </a>
            </div>
            <div class="col-12 col-md-3">
                <a href="Files.aspx" class="card">
                    <h4>Total Uploaded Files</h4>
                    <asp:Label runat="server" Text="Loading..." ID="lbltotalFiles"></asp:Label>
                </a>
            </div>
        </div>
    </div>
</asp:Content>
