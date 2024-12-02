<%@ Page Title="Director's Message" Language="C#" MasterPageFile="Website.master" AutoEventWireup="true" CodeFile="Director.aspx.cs" Inherits="About_Director" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="Server">
    <style>
        /* Additional custom styling (adjusted for Bootstrap 5) */
        .sec {
            background-color: #f9f9f9;
            color: #333;
            padding: 20px;
        }

        .main {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        /* Director Section */
        .director-section {
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .director-section .row-img {
            text-align: center;
        }

        .director-section .row-img img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 10px;
        }

        .director-section .row-img h2 {
            font-size: 1.8rem;
            color: #0056b3;
        }

        .director-section .row-txt {
            flex: 2;
            text-align: left;
        }

        /* Media Queries */
        @media (max-width: 768px) {
            .director-section {
                flex-direction: column;
                text-align: center;
            }

            .director-section .row-img,
            .director-section .row-txt {
                text-align: center;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <section class="sec">
        <div class="container main py-5">
            <!-- Header Section -->
            <h1 class="text-center text-primary mb-4">Director of UDCA TMBU</h1>

            <div class="director-section row">
                <!-- Director Image and Information -->
                <div class="col-md-4 row-img">
                    <asp:Image ID="imgPerson" runat="server" CssClass="img-fluid rounded-circle shadow mb-3" />
                    <h2><asp:Label ID="lblName" runat="server" /></h2>
                    <p>
                        Phone No.:&nbsp;&nbsp;<b><asp:HyperLink ID="phoneLink" runat="server">
                            <asp:Label ID="lblPhone" runat="server" />
                            </asp:HyperLink></b><br />
                        E-Mail Id.:<b>&nbsp;&nbsp;<asp:HyperLink ID="emailLink" runat="server">
                            <asp:Label ID="lblEmail" runat="server" />
                            </asp:HyperLink></b><br />
                        To know more about Director <a href="/pdfjs/web/viewer.html?file=/docs/Profile/DirectorProfile.pdf" target="_blank">Click here</a>
                    </p>
                </div>

                <!-- Director's Message -->
                <div class="col-md-8 row-txt">
                    <h2>Director's Message</h2>
                    <p align="justify">Welcome to the University Department of Computer Applications (UDCA), a hub of innovation and academic excellence. As the Director, I am proud to introduce you to a vibrant community where ambition meets opportunity, and education goes beyond degrees to foster creativity, purpose, and a commitment to societal impact.</p>
                    <p align="justify">At UDCA, we empower students with the knowledge and skills needed to thrive in today's fast-evolving technological landscape. Our curriculum is thoughtfully crafted to align with industry demands while nurturing a broader sense of social responsibility. Supported by state-of-the-art facilities and a dedicated faculty, we prepare students to become not only skilled professionals but also compassionate leaders ready to drive meaningful change.</p>
                    <p align="justify">Learning at UDCA is a collaborative journey. We emphasize a supportive, inclusive environment that promotes intellectual growth, personal development, and the power of partnerships among students, faculty, and the community.</p>
                    <p align="justify">I invite you to explore UDCA - a place where knowledge opens doors, and aspirations take flight. Join us in shaping a brighter, more innovative future.</p>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
