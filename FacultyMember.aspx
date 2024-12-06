<%@ Page Title="Faculty Members" Language="C#" MasterPageFile="Site.master" AutoEventWireup="true"
    CodeFile="FacultyMember.aspx.cs" Inherits="pages_Default" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="style/faculty.css">
</asp:Content>
<asp:Content ID="ContentBody" ContentPlaceHolderID="Content" runat="Server">
    <div class="cont">
        <div class="container">
            <div class="header">
                <h1>Our Faculty Members</h1>
            </div>
            <asp:Repeater ID="facultyRepeater" runat="server">
                <ItemTemplate>
                    <div class="faculty-member">
                        <img src='<%# Eval("ImagePath") %>' alt='<%# Eval("Name") %>' />
                        <div class="faculty-details">
                            <h2>
                                <%# Eval("Name") %></h2>
                            <p>
                                <strong>Qualification:</strong>
                                <%# Eval("Qualification") %></p>
                            <p>
                                <strong>Position: </strong>
                                <%# Eval("Position") %></p>
                            <p class="contact-info">
                                <i class="fa fa-phone" aria-hidden="true"></i><strong>  Phone No: </strong><a href='tel:<%# Eval("Phone") %>'>
                                    <%# Eval("Phone") %></a>
                            </p>
                            <p class="contact-info">
                                <i class="fa fa-envelope" aria-hidden="true"></i><strong>  Email-Id:</strong> <a href='mailto:<%# Eval("Email") %>'>
                                    <%# Eval("Email") %></a>
                            </p>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <div class="header">
                <h1>Our Guest Faculty Members</h1>
            </div>
            <asp:Repeater ID="GuestRepeater" runat="server">
                <ItemTemplate>
                    <div class="faculty-member">
                        <img src='<%# Eval("ImagePath") %>' alt='<%# Eval("Name") %>' />
                        <div class="faculty-details">
                            <h2>
                                <%# Eval("Name") %></h2>
                            <p>
                                <strong>Qualification:</strong>
                                <%# Eval("Qualification") %></p>
                            <p>
                                <strong>Position: </strong>
                                <%# Eval("Position") %></p>
                            <p class="contact-info">
                                <i class="fa fa-phone" aria-hidden="true"></i><strong>  Phone No: </strong><a href='tel:<%# Eval("Phone") %>'>
                                    <%# Eval("Phone") %></a>
                            </p>
                            <p class="contact-info">
                                <i class="fa fa-envelope" aria-hidden="true"></i><strong>  Email-Id:</strong> <a href='mailto:<%# Eval("Email") %>'>
                                    <%# Eval("Email") %></a>
                            </p>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <div class="header">
                <h1>Our Former Faculty Members</h1>
            </div>
            <asp:Repeater ID="FormerRepeater" runat="server">
                <ItemTemplate>
                    <div class="faculty-member">
                        <img src='<%# Eval("ImagePath") %>' alt='<%# Eval("Name") %>' />
                        <div class="faculty-details">
                            <h2>
                                <%# Eval("Name") %></h2>
                            <p>
                                <strong>Qualification:</strong>
                                <%# Eval("Qualification") %></p>
                            <p>
                                <strong>Position: </strong>
                                <%# Eval("Position") %></p>
                            <p class="contact-info">
                                <i class="fa fa-phone" aria-hidden="true"></i><strong>  Phone No: </strong><a href='tel:<%# Eval("Phone") %>'>
                                    <%# Eval("Phone") %></a>
                            </p>
                            <p class="contact-info">
                                <i class="fa fa-envelope" aria-hidden="true"></i><strong>  Email-Id:</strong> <a href='mailto:<%# Eval("Email") %>'>
                                    <%# Eval("Email") %></a>
                            </p>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
