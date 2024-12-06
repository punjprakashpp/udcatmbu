<%@ Page Title="Director's Message" Language="C#" MasterPageFile="Site.master" AutoEventWireup="true" CodeFile="Director.aspx.cs" Inherits="About_Director" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <section class="py-5 bg-light">
        <div class="container bg-white rounded shadow-sm py-5 px-4">
            <!-- Header Section -->
            <h1 class="text-center text-primary mb-5">Director of UDCA TMBU</h1>

            <div class="row align-items-center">
                <!-- Director Image and Information -->
                <div class="col-md-4 text-center">
                    <asp:Image ID="imgPerson" runat="server" CssClass="img-fluid rounded-circle shadow mb-3" />
                    <h2 class="text-primary mt-2">
                        <asp:Label ID="lblName" runat="server" />
                    </h2>
                    <p>
                        <b>Phone No.:</b> 
                        <asp:HyperLink ID="phoneLink" runat="server" class="text-decoration-none">
                            <asp:Label ID="lblPhone" runat="server" />
                        </asp:HyperLink>
                        <br />
                        <b>Email:</b> 
                        <asp:HyperLink ID="emailLink" runat="server" class="text-decoration-none">
                            <asp:Label ID="lblEmail" runat="server" />
                        </asp:HyperLink>
                        <br />
                        <a href="/pdfjs/web/viewer.html?file=/docs/Profile/DirectorProfile.pdf" target="_blank" class="text-primary">
                            <i class="fas fa-info-circle"></i> Learn More
                        </a>
                    </p>
                </div>

                <!-- Director's Message -->
                <div class="col-md-8">
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
