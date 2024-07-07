<%@ Page Title="Home Page" Language="C#" MasterPageFile="Site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <style>
        .data {
            display: inline-block;
            vertical-align: top;
            margin-left: 20px;
            font-size: 16px;
            text-align:left;
        }
            .data p {
                font-weight:700;
            }
    </style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <center>
    <h2><u>Welcome to UDCA Website Administrator Portal's <b>Dashboard</b></u></h2>
    <div class="data">
        <p>Acoount Menu Let You:</p>
        <ul>
            <li>Add Other User</li>
            <li>Change Your Password</li>
        </ul>
    </div>
    <div class="data">
        <p>Add Menu Let You add:</p>
        <ul>
            <li>Home Links</li>
            <li>Home Buttons</li>
            <li>Slider Images</li>
            <li>Event Gallery Image</li>
            <li>News Gallery Image</li>
            <li>Video Gallery Links</li>
        </ul>
    </div>
    <div class="data">
        <p>Update Menu Let You update:</p>
        <ul>
            <li>Fee Structure</li>
            <li>Administrative Profile</li>
            <li>Important Dates</li>
            <li>Profile Details PDF</li>
            <li>Course Related PDF</li>
        </ul>
    </div>
    <div class="data">
        <p>Manage Menu Let You manage:</p>
        <ul>
            <li>Faculty Members</li>
            <li>Guest Faculties</li>
            <li>Office Staffs</li>
            <li>Helping Staffs</li>
            <li>Registered Alumni</li>
        </ul>
    </div>
    <div class="data">
        <p>Documents Upload Menu Let You upload:</p>
        <ul>
            <li>News PDF</li>
            <li>Notice PDF</li>
            <li>Tender PDF</li>
            <li>Documents Upload Files</li>
            <li>Affiliations & Regulations PDF</li>
        </ul>
    </div>
        </center>
</asp:Content>
