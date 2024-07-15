<%@ Page MasterPageFile="Root.master" AutoEventWireup="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>About Developers</title>
    <style>
        /* General CSS for desktop view */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
            color: #333;
        }

        .cont {
            max-width: 100%;
            margin: 0 auto;
            padding: 20px;
            text-align: center;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        h1 {
            font-size: 2em;
            color: #444;
            margin-bottom: 20px;
        }

        .dev {
            display: flex;
            flex-direction: row;
            align-items: center;
            justify-content: center;
            background-color: #e9ecef;
            border-radius: 8px;
            padding: 10px;
            margin: 10px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
        }

        .dev-img {
            margin-right: 15px;
        }

        .dev-des h2 {
            margin: 0;
            font-size: 1.5em;
            color: #007bff;
        }

        .dev-des p {
            margin: 5px 0;
            font-size: 1em;
            line-height: 1.5;
        }

        .dev a {
            color: #007bff;
            text-decoration: none;
        }

            .dev a:hover {
                text-decoration: underline;
            }

        /* CSS to show all .dev elements in one line */
        .cont > .dev {
            display: inline-flex;
        }

        /* CSS for images */
        .dev-img img {
            width: 120px;
            height: 160px;
            border-radius: 50%;
            border: 2px solid #007bff;
        }

        /* Responsive CSS for mobile devices */
        @media (max-width: 768px) {
            .cont > .dev {
                display: block;
                margin-bottom: 20px;
            }

            .dev {
                flex-direction: column;
                align-items: center;
                padding: 20px;
            }

            .dev-img {
                margin: 0 0 10px 0;
            }

            .dev-des h2 {
                font-size: 1.3em;
            }

            .dev-des p {
                font-size: 0.9em;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="cont">
        <h1>Website Development Team</h1>
        <div class="dev">
            <div class="dev-img">
                <img alt="Punj Prakash" src="img/dev/punj.jpg" />
            </div>
            <div class="dev-des">
                <h2>Punj Prakash<span style="color: black; font-size: medium;"> (Team Leader)</span></h2>
                <p>
                    Session:&nbsp;&nbsp;<b>2022-2024</b><br />
                    Work:&nbsp;&nbsp;<b>Front-End, Back-End and Database</b><br />
                    Phone / Whatsapp No.:&nbsp;&nbsp;<b><a href="tel:+91 9060311534">+91 9060311534</a></b><br />
                    E-Mail Id.:&nbsp;&nbsp;<b><a href="mailto:punjprakashpp@gmail.com">punjprakashpp@gmail.com</a></b><br />
                    Social Links:
                    &nbsp;&nbsp;<a href="https://www.facebook.com/punjprakashop" target="_blank"><i class="fa fa-facebook"></i></a>
                    &nbsp;&nbsp;<a href="https://www.instagram.com/punjprakashpp" target="_blank"><i class="fa fa-instagram"></i></a>
                    &nbsp;&nbsp;<a href="https://x.com/punjprakashpp" target="_blank"><i class="fa fa-twitter" target="_blank"></i></a>
                    &nbsp;&nbsp;<a href="https://github.com/punjprakashpp" target="_blank"><i class="fa fa-github"></i></a>
                    &nbsp;&nbsp;<a href="https://www.linkedin.com/in/punjprakashpp" target="_blank"><i class="fa fa-linkedin"></i></a>
                </p>
            </div>
        </div>
        <br />
        <div class="dev">
            <div class="dev-img">
                <img alt="Anmol Ratan" src="img/dev/anmol.jpg" />
            </div>
            <div class="dev-des">
                <h2>Anmol Ratan</h2>
                <p>
                    Session:&nbsp;&nbsp;<b>2022-2024</b><br />
                    Work:&nbsp;&nbsp;<b>Front-End & Photography</b><br />
                    Phone No.:&nbsp;&nbsp;<a href="tel:+918434032071"><b>+91 8434032071</b></a><br />
                    E-Mail Id.:&nbsp;&nbsp;<b><a href="mailto:yadavnmol@gmail.com">yadavnmol@gmail.com</a></b><br />
                    Social Links:
                    &nbsp;&nbsp;<a href="https://www.facebook.com/Yadavnmol" target="_blank"><i class="fa fa-facebook"></i></a>
                    &nbsp;&nbsp;<a href="https://www.instagram.com/anmol_king" target="_blank"><i class="fa fa-instagram"></i></a>
                    &nbsp;&nbsp;<a href="https://x.com/AnmolKing03" target="_blank"><i class="fa fa-twitter" target="_blank"></i></a>
                    &nbsp;&nbsp;<a href="https://github.com/AnmolKing03" target="_blank"><i class="fa fa-github"></i></a>
                    &nbsp;&nbsp;<a href="https://www.linkedin.com/in/#" target="_blank"><i class="fa fa-linkedin"></i></a>
                </p>
            </div>
        </div>
        <div class="dev">
            <div class="dev-img">
                <img alt="Anand Prakash" src="img/dev/anand.jpg" />
            </div>
            <div class="dev-des">
                <h2>Anand Prakash</h2>
                <p>
                    Session:&nbsp;&nbsp;<b>2022-2024</b><br />
                    Work:&nbsp;&nbsp;<b>Library Management System</b><br />
                    Phone No.:&nbsp;&nbsp;<a href="tel:+918434032071"><b>+91 9801441325</b></a><br />
                    E-Mail Id.:&nbsp;&nbsp;<b><a href="mailto:anandprakash4568@gmail.com">anandprakash4568@gmail.com</a></b>
                </p>
            </div>
        </div>
        <div class="dev">
            <div class="dev-img">
                <img alt="Anand Prakash" src="img/dev/anurag.jpg" />
            </div>
            <div class="dev-des">
                <h2>Anurag Bhardwaj</h2>
                <p>
                    Session:&nbsp;&nbsp;<b>2022-2024</b><br />
                    Work:&nbsp;&nbsp;<b>Message Management System</b><br />
                    Phone No.:&nbsp;&nbsp;<a href="tel:+918434032071"><b>+91 9110019419</b></a><br />
                    E-Mail Id.:&nbsp;&nbsp;<b><a href="mailto:anuragbhardwajab@gmail.com">anuragbhardwajab@gmail.com</a></b>
                </p>
            </div>
        </div>
        <br />
        <br />
        <h1>Guiding cum Supervising Team</h1>
        <div class="dev">
            <div class="dev-img">
                <img alt="Rakesh Kumar Pandey" src="img/dev/rak.jpg" />
            </div>
            <div class="dev-des">
                <h2>Dr. Rakesh Kumar Pandey</h2>
                <p>
                    Faculty:&nbsp;&nbsp;<b>UDCA, TMBU</b><br />
                    Phone No.:&nbsp;&nbsp;<b><a href="tel:+91 9546040085">+91 9546040085</a></b><br />
                    E-Mail Id.:&nbsp;&nbsp;<b><a href="mailto:rakeshkrpandey1978@gmail.com">rakeshkrpandey1978@gmail.com</a></b>
                </p>
            </div>
        </div>
        <div class="dev">
            <div class="dev-img">
                <img alt="Sheo Shankar Prasad" src="img/dev/sheo.jpg" />
            </div>
            <div class="dev-des">
                <h2>Dr. Sheo Shankar Prasad</h2>
                <p>
                    Faculty:&nbsp;&nbsp;<b>UDCA, TMBU</b><br />
                    Phone No.:&nbsp;&nbsp;<b><a href="tel:+91 9162380697">+91 9162380697</a></b><br />
                    E-Mail Id.:&nbsp;&nbsp;<b><a href="mailto:sheobgp@gmail.com">sheobgp@gmail.com</a></b>
                </p>
            </div>
        </div>
    </div>
</asp:Content>

