<%@ Page Title="" Language="C#" MasterPageFile="Site.master" AutoEventWireup="true" CodeFile="ViewFaculty.aspx.cs" Inherits="Admin_pages_ViewFaculty" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <title>Faculty Members</title>
    <link rel="stylesheet" href="Styles/faculty.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2>Faculty Members</h2>
    <asp:Repeater ID="facultyRepeater" runat="server">
            <ItemTemplate>
                <div class="faculty-member">
                    <img src='<%# "../" + Eval("ImagePath") %>' alt='<%# Eval("Name") %>' />
                    <div class="faculty-details">
                        <h2><%# Eval("Name") %></h2>
                        <p><strong>Qualification:</strong> <%# Eval("Qualification") %></p>
                        <p><strong>Position: </strong> <%# Eval("Position") %></p>
                        <p class="contact-info">
                            <i class="fa fa-phone" aria-hidden="true"></i>
                            <strong>Phone No: </strong>
                            <a href='tel:<%# Eval("Phone") %>'><%# Eval("Phone") %></a>
                        </p>
                        <p class="contact-info">
                            <i class="fa fa-envelope" aria-hidden="true"></i>
                            <strong>Email-Id:</strong>
                            <a href='mailto:<%# Eval("Email") %>'><%# Eval("Email") %></a>
                        </p>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
</asp:Content>

