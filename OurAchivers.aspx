<%@ Page Title="Our Achivers" Language="C#" MasterPageFile="~/Website.master" AutoEventWireup="true" CodeFile="OurAchivers.aspx.cs" Inherits="OurAchivers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="style/dev.css" />
    <script defer src="script/dev.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content1" runat="Server">
    <div class="cont">
        <h1>Meet Our Achivers</h1>
        <div class="dev-cont">
            <asp:Repeater ID="AchiverRepeater" runat="server">
                <ItemTemplate>
                    <div class="dev">
                        <div class="dev-img">
                            <img src='<%# Eval("ImagePath") %>' alt='<%# Eval("Name") %>' />
                        </div>
                        <div class="dev-des">
                            <h2><%# Eval("Name") %></h2>
                            <p><strong>Session: </strong><%# Eval("Session")%></p>
                            <p><strong>Qualification:</strong><%# Eval("Qualification") %></p>
                            <p><strong>Achivement: </strong><%# Eval("Achivement")%></p><!--
                            <p><strong>Occupation / Job:</strong><%# Eval("Occupation")%></p>
                            <p><strong>Work Location / Company:</strong><%# Eval("Company")%></p>
                            <p class="contact-info"><i class="fa fa-phone" aria-hidden="true"></i><strong>Phone No:</strong> <a href='tel:<%# Eval("Phone") %>'><%# Eval("Phone") %></a></p>
                            <p class="contact-info"><i class="fa fa-envelope" aria-hidden="true"></i><strong>Email-Id:</strong> <a href='mailto:<%# Eval("Email") %>'><%# Eval("Email") %></a></p>
                            <p class="contact-info"><i class="fa fa-linkedin" aria-hidden="true"></i><strong>Linkedin:</strong> <a href='https://www.linkedin.com/in/<%# Eval("LinkedIn") %>' target="_blank">@<%# Eval("LinkedIn") %></a></p>
                            <p class="contact-info"><i class="fa fa-facebook" aria-hidden="true"></i><strong>Facebook:</strong> <a href='https://www.facebook.com/<%# Eval("Facebook") %>' target="_blank">@<%# Eval("Facebook")%></a></p>
                            <p class="contact-info"><i class="fa fa-instagram" aria-hidden="true"></i><strong>Instagram:</strong> <a href='https://www.instagram.com/<%# Eval("Instagram") %>' target="_blank">@<%# Eval("Instagram")%></a></p>
                            <p class="contact-info"><i class="fa fa-twitter" aria-hidden="true"></i><strong>Twitter/X:</strong> <a href='https://x.com/<%# Eval("Twitter") %>' target="_blank">@<%# Eval("Twitter")%></a></p>
                       --> </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>