<%@ Page Title="" Language="C#" MasterPageFile="Pages.master" AutoEventWireup="true" CodeFile="Director.aspx.cs" Inherits="About_Director" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Director's Message</title>
    <link rel="stylesheet" type="text/css" href="style/pages.css">
    <link rel="stylesheet" type="text/css" href="style/adm.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="cont" align="center">
        <h1 class="title">Director of UDCA</h1>
        <div class="dev">
            <div class="dev-img" align="left">
                <asp:Image ID="imgPerson" runat="server" /><br /><br />
                <h2 align="center" style="color:Red;"><asp:Label ID="lblName" runat="server" /></h2>
                <h3 >Director of <b>UDCA</b></h3>
                <p>Phone No.:&nbsp;&nbsp;<b>+91 6412501290</b><br />E-Mail Id.:<b><a href="mailto:director_udca@tmbuniv.ac.in" target="_blank">director_udca@tmbuniv.ac.in</a></b></p>
                <h5 align="left">To know more about Director <a href="../doc/Profile/DirectorProfile.pdf" target="_blank"> Click here</a></h5>
            </div> 
            <div class="dev-des" align="right">
                <h2><b>Director's Message</b></h2>
                <p>Welcome to the University Department of Computer Applications (UDCA), a young, elite department with a world-class reputation, global outlook, and innovative spirit. As the Director, I am honored to introduce you to our department, which is dedicated to providing the best administrative support and academic excellence.</p> 
                <p>At UDCA, we believe in the transformative power of education. Our mission is to empower students with the knowledge and skills needed to thrive in a rapidly changing world. We offer a nurturing and inclusive environment where every student can explore, learn, and grow.</p> 
                <p>Our dedicated faculty, state-of-the-art facilities, and diverse courses inspire a passion for learning and prepare students for future opportunities. We encourage critical thinking, creativity, and social responsibility, aiming to develop not just successful professionals but also compassionate citizens.</p> 
                <p>Our department is a community of support and encouragement, guiding and mentoring students on their educational journey. We value the partnership between students, parents, and the institution.</p> 
                <p>With great pleasure, I welcome you to the University Department of Computer Applications—a place where knowledge meets opportunity, and dreams find wings to soar.</p> 
            </div>   
        </div>
    </div>
</asp:Content>

