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
            max-width: 1200px;
            margin: 0 auto;
            padding: 40px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

            /* Header styling */
            .main h1 {
                font-size: 2.5rem;
                margin-bottom: 20px;
                text-align: center;
                color: #001f44;
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

            .main a {
                display: inline-block;
                text-decoration: none;
            }

                .main a:hover {
                    text-decoration: underline;
                }

        /* New Section Styling for Director's Message */
        .row-img {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-bottom: 20px;
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

            .row-img h3 {
                font-size: 1.4rem;
                color: #555;
                margin-bottom: 20px;
            }

        /* Director's message text and link */
        .row-txt {
            text-align: center;
        }

            .row-txt p {
                font-size: 1.1rem;
                line-height: 1.6;
                margin-bottom: 20px;
                text-align: justify;
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

        /* Medium devices (768px and below) */
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

            .row-img {
                flex-direction: column;
                justify-content: space-between;
                margin-bottom: 20px;
            }

                .row-img img {
                    width: 120px;
                    height: 120px;
                }

                .row-img h2, .row-img h3 {
                    text-align: left;
                    margin-left: 15px;
                }

            .row-txt p {
                text-align: left;
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

            .main {
                padding: 20px;
            }

            .row-img {
                flex-direction: column;
                align-items: center;
            }

                .row-img img {
                    width: 100px;
                    height: 100px;
                }

                .row-img h2 {
                    font-size: 1.6rem;
                    text-align: center;
                }

                .row-img h3 {
                    font-size: 1.2rem;
                }

            .row-txt p {
                font-size: 0.9rem;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content1" runat="Server">
    <section class="sec">
        <div class="main">
            <div class="row-img">
                <h1>Director of University Department of Computer Applications</h1>
                <asp:Image ID="imgPerson" runat="server" />
                <h2><asp:Label ID="lblName" runat="server" /></h2>
                <p>Phone No.:&nbsp;&nbsp;<b><asp:HyperLink ID="phoneLink" runat="server">
                    <asp:Label ID="lblPhone" runat="server" /></asp:HyperLink></b></p>
                <p>E-Mail Id.:<b>&nbsp;&nbsp;<asp:HyperLink ID="emailLink" runat="server">
                    <asp:Label ID="lblEmail" runat="server" /></asp:HyperLink></b></p>
                <p>To know more about Director <a href="#" id="openPdfLink">Click here</a></p>
            </div>
            <div class="row-txt">
                <h2>Director's Message</h2>
                <p>Welcome to the University Department of Computer Applications (UDCA), a dynamic and progressive institution recognized for its global vision, academic innovation, and unwavering commitment to excellence. As the Director, it is my honor to introduce you to our thriving department—a place where ambition meets opportunity, and the future is shaped by a collective passion for learning and technological advancement.</p>
                <p>At UDCA, we believe education extends far beyond earning a degree. It’s about nurturing talent, fostering creativity, and instilling a deep sense of purpose and responsibility. Our mission is to empower students with the knowledge and skills essential for success in today’s rapidly changing world. We are dedicated to creating an environment where curiosity is encouraged, innovation is celebrated, and students are inspired to challenge the status quo and explore new frontiers in technology.</p>
                <p>Our carefully designed curriculum meets the evolving demands of the IT industry while cultivating a broader understanding of social responsibility. Supported by cutting-edge facilities and a team of accomplished and dedicated faculty, we ensure that every student is well-equipped to face the challenges and seize the opportunities of tomorrow. At UDCA, we don’t just focus on academic excellence—we strive to develop compassionate leaders and forward-thinking professionals who will make meaningful contributions to society.</p>
                <p>Education at UDCA is a collaborative journey, where students, faculty, and the community come together to create a transformative experience. We take great pride in fostering a supportive and inclusive atmosphere that promotes both intellectual growth and personal development. Here, we believe in the power of partnerships, valuing the connections between students, parents, and the institution as we guide our students through their educational journey.</p>
                <p>I invite you to join us on this exciting path of discovery, growth, and transformation. Together, we will unlock potential, expand horizons, and build a brighter, more innovative future. At UDCA, knowledge becomes opportunity, and dreams are given wings to soar.</p>
                <p>With dedication and optimism, I warmly welcome you to the University Department of Computer Applications—a place where the future begins today.</p>
            </div>
        </div>
    </section>
    <div id="lightbox" class="lightbox">
        <div class="lightbox-content">
            <span class="close">&times;</span>
            <div id="pdf-viewer" data-url="docs/Profile/DirectorProfile.pdf">
                <!-- Canvases will be dynamically added here -->
            </div>
        </div>
    </div>
    <script src="script/pdf.worker.min.js"></script>
    <script src="script/pdf.min.js"></script>
    <script src="script/pdf.js"></script>
</asp:Content>
