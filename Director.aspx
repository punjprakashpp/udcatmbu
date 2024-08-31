<%@ Page Title="Director's Message" Language="C#" MasterPageFile="Website.master" AutoEventWireup="true" CodeFile="Director.aspx.cs" Inherits="About_Director" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" type="text/css" href="style/pdf.css">
    <style>
        /* Body and general layout styling */
        .sec {
            background-color: #f9f9f9;
            color: #333;
            padding: 20px;
        }

        .main {
            max-width: 880px;
            margin: 0 auto;
            padding: 40px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

            /* Header styling */
            .main h1 {
                font-size: 2.5rem;
                margin-bottom: 20px;
                text-align: center;
                margin: 0 auto;
                color: #0056b3;
            }

            .main p {
                font-size: 1.1rem;
                line-height: 1.6;
                margin-bottom: 20px;
                text-align: justify;
            }

            .main h2 {
                font-size: 2rem;
                margin-bottom: 10px;
                color: #333;
            }

        /* New Section Styling for Director's Message */
        .director-section {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 20px;
        }

        .row-img {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

            .row-img img {
                width: 150px;
                height: 150px;
                border-radius: 50%;
                object-fit: cover;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                margin-bottom: 10px;
            }

            .row-img h2 {
                font-size: 1.8rem;
                color: #0056b3;
                margin-bottom: 5px;
            }

            .row-img a {
                text-decoration: none;
            }

                .row-img a:hover {
                    text-decoration: underline;
                }

        /* Director's message text and link */
        .row-txt {
            flex: 2;
            text-align: left;
        }

            .row-txt p {
                font-size: 1.1rem;
                line-height: 1.6;
                margin-bottom: 20px;
            }

        /* Media Queries for Responsive Design */

        /* Extra large devices (1200px and below) */
        @media (max-width: 1200px) {
            .main h1 {
                font-size: 2.4rem;
            }

            .main h2 {
                font-size: 2rem;
            }
        }

        /* Large devices (992px and below) */
        @media (max-width: 992px) {
            .main h1 {
                font-size: 2.3rem;
            }

            .main h2 {
                font-size: 1.9rem;
            }

            .main {
                padding: 35px;
            }
        }

        /* Medium devices (tablets, 768px and below) */
        @media (max-width: 768px) {
            .main h1 {
                font-size: 2rem;
            }

            .main h2 {
                font-size: 1.8rem;
            }

            .main {
                padding: 30px;
            }

            .director-section {
                flex-direction: column;
                text-align: center;
                gap: 0px;
            }

            .row-img,
            .row-txt {
                text-align: center;
            }

                .row-img h2 {
                    text-align: center;
                }
        }

        /* Small devices (576px and below) */
        @media (max-width: 576px) {
            .main h1 {
                font-size: 1.8rem;
            }

            .main p {
                font-size: 1rem;
            }

            .main h2 {
                font-size: 1.5rem;
            }

            .main li {
                font-size: 1rem;
            }

            .main {
                padding: 20px;
            }

            .row-img {
                width: 100%;
                margin-bottom: 20px;
            }

                .row-img img {
                    width: 100px;
                    height: 100px;
                }

                .row-img h2 {
                    font-size: 1.6rem;
                }

            .row-txt {
                font-size: 0.9rem;
            }

            .director-section {
                flex-direction: column;
                align-items: center;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content1" runat="Server">
    <section class="sec">
        <div class="main">
            <h1>Director of UDCA TMBU</h1>
            <div class="director-section">
                <div class="row-img">
                    <asp:Image ID="imgPerson" runat="server" />
                    <h2><asp:Label ID="lblName" runat="server" /></h2>
                    <p>
                        Phone No.:&nbsp;&nbsp;<b><asp:HyperLink ID="phoneLink" runat="server">
                            <asp:Label ID="lblPhone" runat="server" /></asp:HyperLink></b><br />
                        E-Mail Id.:<b>&nbsp;&nbsp;<asp:HyperLink ID="emailLink" runat="server">
                            <asp:Label ID="lblEmail" runat="server" /></asp:HyperLink></b><br />
                        To know more about Director <a href="#" id="openPdfLink">Click here</a><br />
                    </p>
                </div>
                <div class="row-txt">
                    <h2>Director's Message</h2>
                    <p>Welcome to the University Department of Computer Applications (UDCA), a hub of innovation and academic excellence. As the Director, I am proud to introduce you to a vibrant community where ambition meets opportunity, and education goes beyond degrees to foster creativity, purpose, and a commitment to societal impact.</p>
                </div>
            </div>
            <div>
                <p>At UDCA, we empower students with the knowledge and skills needed to thrive in today's fast-evolving technological landscape. Our curriculum is thoughtfully crafted to align with industry demands while nurturing a broader sense of social responsibility. Supported by state-of-the-art facilities and a dedicated faculty, we prepare students to become not only skilled professionals but also compassionate leaders ready to drive meaningful change.</p>
                <p>Learning at UDCA is a collaborative journey. We emphasize a supportive, inclusive environment that promotes intellectual growth, personal development, and the power of partnerships among students, faculty, and the community.</p>
                <p>I invite you to explore UDCA - a place where knowledge opens doors, and aspirations take flight. Join us in shaping a brighter, more innovative future.</p>
            </div>
        </div>
    </section>
    <div id="lightbox" class="lightbox">
        <div class="lightbox-content">
            <span class="close">&times;</span>
            <div id="pdf-viewer" data-url="docs/Profile/DirectorProfile.pdf"></div>
        </div>
    </div>
    <script src="script/pdf.worker.min.js"></script>
    <script src="script/pdf.min.js"></script>
    <script src="script/pdf.js"></script>
</asp:Content>
