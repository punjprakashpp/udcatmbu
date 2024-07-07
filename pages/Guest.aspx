<%@ Page Title="" Language="C#" MasterPageFile="~/pages/Pages.master" AutoEventWireup="true"
    CodeFile="Guest.aspx.cs" Inherits="pages_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Guest Faculty Members</title>
    <link rel="stylesheet" href="style/faculty.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="cont">
        <div class="container">
            <div class="header">
                <h1>
                    Meet Our Guest Faculty Members</h1>
            </div>
            <asp:Repeater ID="facultyRepeater" runat="server">
                <ItemTemplate>
                    <div class="faculty-member">
                        <img src='<%# "../" + Eval("ImagePath") %>' alt='<%# Eval("Name") %>' />
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
                <h1>
                    Our Former Guest Faculty Members</h1>
            </div>
            <asp:Repeater ID="FormerRepeater" runat="server">
                <ItemTemplate>
                    <div class="faculty-member">
                        <img src='<%# "../" + Eval("ImagePath") %>' alt='<%# Eval("Name") %>' />
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
