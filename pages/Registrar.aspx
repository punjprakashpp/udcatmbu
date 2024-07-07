<%@ Page Title="" Language="C#" MasterPageFile="~/pages/Pages.master" AutoEventWireup="true" CodeFile="Registrar.aspx.cs" Inherits="pages_Registrar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Registrar of TMBU</title>
   <link rel="stylesheet" type="text/css" href="style/pages.css">
   <link rel="stylesheet" type="text/css" href="style/adm.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="cont" align="center">
        <h1 class="title">Registrar of TMBU</h1>
        <div class="dev">
            <div class="dev-img" align="left">
                <asp:Image ID="imgPerson" runat="server" /><br /><br />
                <h2 align="center" style="color:Red;"><asp:Label ID="lblName" runat="server" /></h2>
                <h3 >Registrar of <b>TMBU</b></h3>
                <p>Phone No.:&nbsp;&nbsp;<b>+91 9534675123</b><br />E-Mail Id.:<b><a href="mailto:registrar@tmbuniv.ac.in" target="_blank">registrar@tmbuniv.ac.in</a></b></p>
                <h5 align="left">To know more about Registrar <a href="../doc/Profile/RegistrarProfile.pdf" target="_blank"> Click here</a></h5>
            </div> 
            <div class="dev-des" align="right">
                <h2><b>Registrar's Message</b></h2>
                <p>Welcome to the University Department of Computer Applications (UDCA), where we're committed to shaping promising careers for our students. Our department boasts top-notch infrastructure and a stellar faculty dedicated to delivering quality education. We prioritize active engagement among students, parents, and staff, bolstered by a robust Training and Placement Cell that paves the way for bright futures.</p>
                <p>Whether you're inclined towards further studies or already employed, UDCA equips you for a range of paths in the Information Technology industry, be it research, development, design, production, application, testing, or management. We're passionate about fostering a culture of innovation, both in research and teaching, while serving our profession, local community, and industry.</p>
                <p>Our faculty and students are constantly pushing boundaries to advance computer science. I invite you to join us in our journey as we propel the Computer Science Department to new heights. In conclusion, I extend my best wishes to all students and faculty for a rewarding academic journey.</p>
            </div>   
        </div>
    </div>
</asp:Content>

