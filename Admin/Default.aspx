<%@ Page Title="Home Page" Language="C#" MasterPageFile="Site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <style>
        .data {
            display: inline-block;
            vertical-align: top;
            margin-left: 20px;
            font-size: 16px;
            text-align: left;
        }

        .data p {
            font-size:20px;
            font-weight: 700;
        }

        .data a {
            font-size:20px;
        }
    </style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <center>
        <h2><u>Welcome to UDCA Website Administrator Portal's <b>Dashboard</b></u></h2>
        <div class="data">
            <p>Account Menu Options:</p>
            <ul>
                <li><a href="#">Add Other User</a></li>
                <li><a href="#">Change Your Password</a></li>
            </ul>
        </div>
        <div class="data">
            <p>Add Menu Options:</p>
            <ul>
                <li><a href="#">Home Links</a></li>
                <li><a href="#">Home Buttons</a></li>
                <li><a href="#">Slider Images</a></li>
                <li><a href="#">Event Gallery Image</a></li>
                <li><a href="#">News Gallery Image</a></li>
                <li><a href="#">Video Gallery Links</a></li>
            </ul>
        </div>
        <div class="data">
            <p>Update Menu Options:</p>
            <ul>
                <li><a href="#">Fee Structure</a></li>
                <li><a href="#">Administrative Profile</a></li>
                <li><a href="#">Important Dates</a></li>
                <li><a href="#">Profile Details PDF</a></li>
                <li><a href="#">Course Related PDF</a></li>
            </ul>
        </div>
        <div class="data">
            <p>Manage Menu Options:</p>
            <ul>
                <li><a href="#">Manage Faculty Members</a></li>
                <li><a href="#">Manage Guest Faculties</a></li>
                <li><a href="#">Manage Office Staffs</a></li>
                <li><a href="#">Manage Helping Staffs</a></li>
                <li><a href="#">Delete Registered Alumni</a></li>
            </ul>
        </div>
        <div class="data">
            <p>Upload Menu Options:</p>
            <ul>
                <li><a href="#">Upload News PDF</a></li>
                <li><a href="#">Upload Notice PDF</a></li>
                <li><a href="#">Upload Tender PDF</a></li>
                <li><a href="#">Upload Document Files</a></li>
                <li><a href="#">Upload Regulations PDF</a></li>
            </ul>
        </div>
        <div class="data">
            <p>View Menu Options:</p>
            <ul>
                <li><a href="#">News PDF</a></li>
                <li><a href="#">Notice PDF</a></li>
                <li><a href="#">Tender PDF</a></li>
                <li><a href="#">Document Files</a></li>
                <li><a href="#">Affiliations PDF</a></li>
            </ul>
        </div>
    </center>
</asp:Content>
