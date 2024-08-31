<%@ Page Title="Vice-Chancellor" Language="C#" MasterPageFile="Website.master" AutoEventWireup="true" CodeFile="ViceChancellor.aspx.cs" Inherits="About_Director" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" type="text/css" href="style/pages.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content1" runat="Server">
    <div class="cont" align="center">
        <h1 class="title">Vice-Chancellor of TMBU</h1>
        <div class="dev">
            <div class="dev-img" align="center">
                <asp:Image ID="imgPerson" runat="server" /><br />
                <br />
                <h2 align="center" style="color: Red;">
                    <asp:Label ID="lblName" runat="server" /></h2>
                <p>
                    Phone No.:&nbsp;&nbsp;<b><asp:HyperLink ID="phoneLink" runat="server">
                        <asp:Label ID="lblPhone" runat="server" /></asp:HyperLink></b><br />
                    E-Mail Id.:<b><asp:HyperLink ID="emailLink" runat="server">
                        <asp:Label ID="lblEmail" runat="server" /></asp:HyperLink></b>
                </p>
                <h5 align="left">To know more about VC <a href="docs/Profile/VCProfile.pdf" target="_blank">Click here</a></h5>
            </div>
            <div class="dev-des" align="right">
                <h2><b>Vice-Chancellor's Message</b></h2>
                <p>Welcome to Tilka Manjhi Bhagalpur University (TMBU), a hub of learning and innovation. As Vice-Chancellor, I am honored to lead this institution dedicated to academic excellence, research, and holistic development. At TMBU, we strive to empower our students with the skills, knowledge, and values needed to succeed in a rapidly changing world.</p>
                <p>Our diverse programs and dynamic learning environment encourage critical thinking, ethical behavior, and meaningful societal contributions. We are proud of our accomplished faculty who mentor and guide students, fostering a culture of inquiry, innovation, and community engagement.</p>
                <p>We are committed to growth, research, and global collaboration, ensuring that our graduates are not only well-prepared professionals but also socially responsible citizens. I invite you to join us on this journey of excellence, innovation, and impact.</p>
            </div>
        </div>
    </div>
</asp:Content>
