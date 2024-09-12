<%@ Page Title="Contacts" MasterPageFile="Website.master" AutoEventWireup="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" type="text/css" href="style/pages.css">
    <style>
        .cont p {
            margin: 0px;
        }

        #left, #right {
            vertical-align: top;
            display: inline-block;
            width: 30%;
            margin-left: 30px;
        }

        #right {
            width: 65%;
            margin-left: 15px;
        }

        @media(max-width:1024px) {
            #left, #right {
                vertical-align: top;
                display: block;
                width: 90%;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content1" runat="Server">
    <div class="cont">
        <h1 class="title">Contacts Us</h1>
        <div id="left" align="left">
            <h2>Mailing Address:</h2>
            <p>
                <a href="https://maps.app.goo.gl/Zv7E8aFZ3hYQ1ZMf6" target="_blank">University Department of
                <br />
                    Computer Applications,<br />
                    Computer Centre,
                <br />
                    Tilka Manjhi Bhagalpur University,<br />
                    Bhagalpur, Bihar, 812007</a>
            </p>
            <br />
            <h2>Phone No.:</h2>
            <p><a href="tel:0641-2500040">0641-2500040</a></p>
            <br />
            <h2>E-Mail Id.:</h2>
            <p><a href="mailto:udcatmbu.bgp@gmail.com">udcatmbu.bgp@gmail.com</a></p>
            <br />
            <h2>Website:</h2>
            <p><a href="http://udcatmbu.org">http://udcatmbu.org</a></p>
            <br />
            <h2>Social Links:</h2>
            <p>
                &nbsp;&nbsp;<a href="https://www.facebook.com/udcatmbu" target="_blank"><i class="fa fa-facebook"></i></a>
                &nbsp;&nbsp;<a href="https://www.instagram.com/udcatmbu" target="_blank"><i class="fa fa-instagram"></i></a>
                &nbsp;&nbsp;<a href="https://x.com/udcatmbu" target="_blank"><i class="fa fa-twitter"></i></a>
                &nbsp;&nbsp;<a href="https://www.linkedin.com/in/udcatmbu" target="_blank"><i class="fa fa-linkedin"></i></a>
            </p>
        </div>
        <div id="right" align="right">
            <h2>Location of UDCA on Google Maps:</h2>
            <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d451.0993222352922!2d86.955931!3d25.243843!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39f04a743aaaaaab%3A0xde5c7df4de4859e1!2sUniversity%20Department%20Of%20Computer%20Application!5e0!3m2!1sen!2sin!4v1716199756791!5m2!1sen!2sin" width="100%" height="480" style="border: 0;" allowfullscreen="" loading="fast" referrerpolicy="no-referrer-when-downgrade"></iframe>
        </div>
    </div>
</asp:Content>