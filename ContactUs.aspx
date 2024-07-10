<%@ Page Title="" Language="C#" MasterPageFile="Root.master" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="About_Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Contact Us</title>
    <link rel="stylesheet" type="text/css" href="style/pages.css">
    <style>
        .cont p
        {
            font-size: 16px;
            color: black;  /* Adjust text color as needed */
            text-shadow: none;  /* Remove default shadow if needed */
            transition: font-size 0.2s ease, text-shadow 0.2s ease;  /* Adjust transition speed and type */
        }
        .cont p:hover
        {
            font-size: 1.125em;  /* Increase font size on hover (adjust percentage as needed) */
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5);  /* Adjust shadow offset, blur, and color */
        }
    </style>
    <style>
        .cont p {
            padding-bottom: 0px;
            margin-top: 0px;
        }
        #aa,#bb{vertical-align:top; display:inline-block; width:30%;margin-left:30px;}
        #bb{width:65%;margin-left:15px;}
        @media(max-width:1024px)
        {
            #aa,#bb{vertical-align:top; display:block; width:90%;}
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="cont">
        <h1 class="title">Contacts Us</h1>
        
        <div id="aa" align="left" >
        <h2>Mailing Address:</h2>
        <p>University Department of <br /> Computer Applications,<br /> Computer Centre, <br /> Tilka Manjhi Bhagalpur University,<br /> Bhagalpur - 812 007 Bihar</p><br />
        <h2>Phone No.:</h2>
        <p>0641-2500040</p><br />
        <h2>E-Mail Id.:</h2>
        <p><a href="mailto:udcatmbu.bgp@gmail.com" style="">udcatmbu.bgp@gmail.com</a></p><br />
        <h2>Website:</h2>
        <p><a href="http://udcatmbu.org" style="">http://udcatmbu.org</a></p><br />
        </div>
        
        <div id="bb" align="right"style="">
            <h2>Location of UDCA on Google Maps:</h2>
            <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d451.0993222352922!2d86.955931!3d25.243843!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39f04a743aaaaaab%3A0xde5c7df4de4859e1!2sUniversity%20Department%20Of%20Computer%20Application!5e0!3m2!1sen!2sin!4v1716199756791!5m2!1sen!2sin" width="100%" height="450" style="border:0;" allowfullscreen="" loading="fast" referrerpolicy="no-referrer-when-downgrade"></iframe>
        </div>
    </div>
</asp:Content>

