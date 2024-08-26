<%@ Page Title="UDCA | TMBU" Language="C#" MasterPageFile="Website.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" type="text/css" href="style/slider.css">
    <link rel="stylesheet" type="text/css" href="style/section.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content1" runat="Server">
    <section class="sec">
        <div class="main">
            <div class="slider-section">
                <div class="slider">
                    <img src="img/default/slider.jpg" class="slide active" />
                    <asp:Repeater ID="SliderRepeater" runat="server">
                        <ItemTemplate>
                            <img src="<%# Eval("ImagePath") %>" alt="<%# Eval("Title") %>" class="slide" />
                        </ItemTemplate>
                    </asp:Repeater>
                    <div class="slider-controls">
                        <a class="prev" onclick="prevSlide()">&#10094;</a>
                        <a class="next" onclick="nextSlide()">&#10095;</a>
                    </div>
                </div>
            </div>
            <div class="notice-section">
                <h4 align="center">Latest Notice and News</h4>
                <div class="notice-board">
                    <div class="notice-links">
                        <marquee class="marquee" id="marq" direction="up" scrollamount="2" onmouseover="this.stop();" onmouseout="this.start();">
                            <asp:Literal ID="LiteralNotices" runat="server"></asp:Literal>
                        </marquee>
                    </div>
                </div>
            </div>
            <div class="links-section">
                <p class="high">Highlights: </p>
                <marquee behavior="scroll" onmouseover="this.stop();" onmouseout="this.start();">
					<asp:Repeater ID="linksRepeater" runat="server">
						<ItemTemplate>
							<a href='<%# Eval("LinkURL") %>' target=_blank><b><font size="3"><%# Eval("LinkText") %></font></b></a>
                    </ItemTemplate>
                </asp:Repeater>
            </marquee>
            </div>
        </div>
    </section>
    <section class="sec">
        <div class="main">
            <h1>WELCOME TO UNIVERSITY DEPARTMENT OF COMPUTER APPLICATIONS</h1>
            <p>
                The University Department of Computer Applications (UDCA), also known as the Computer Centre at Tilka
                Manjhi
                Bhagalpur University (TMBU), Bihar, was established in 2002 as the state's first institution to offer an
                MCA
                program. Initially a study center, it became a full postgraduate department and is now recognized by the
                Government of Bihar and approved by AICTE, New Delhi. Following AICTE's 2020 guidelines, the department
                offers a two-year MCA program.
            </p>
            <h2>Our Mission:</h2>
            <p>
                The mission of UDCA is to equip students with the necessary knowledge and skills to excel in the rapidly
                evolving field of Information Technology. The department fosters an environment that encourages critical
                thinking, creativity, and social responsibility. It is dedicated to nurturing students who not only
                become
                successful professionals but also compassionate citizens, contributing positively to society.
            </p>
            <h2>Our Vision:</h2>
            <p>
                UDCA envisions becoming a center of excellence in computer applications, providing world-class education
                with
                a global outlook. It aims to develop innovative and ethical leaders who will shape the future of
                technology
                and contribute to the betterment of society.
            </p>
        </div>
    </section>
    <section class="sec">
        <div class="main">
            <div class="card">
                <a href="Chancellor.aspx">
                    <div class="box">
                        <h3>
                            <asp:Label ID="lblChancellor" runat="server" Text="Chancellor of T.M.B.U"></asp:Label>
                        </h3>
                        <asp:Image ID="ImageChancellor" class="img" runat="server" />
                        <h4>
                            <asp:Label ID="lblNameChancellor" runat="server" Text=""></asp:Label>
                        </h4>
                    </div>
                </a>
            </div>
            <div class="card">
                <a href="ViceChancellor.aspx">
                    <div class="box">
                        <h3>
                            <asp:Label ID="lblViceChancellor" runat="server" Text="Vice-Chancellor of T.M.B.U"></asp:Label>
                        </h3>
                        <asp:Image ID="ImageViceChancellor" class="img" runat="server" />
                        <h4>
                            <asp:Label ID="lblNameViceChancellor" runat="server" Text=""></asp:Label>
                        </h4>
                    </div>
                </a>
            </div>
            <div class="card">
                <a href="Director.aspx">
                    <div class="box">
                        <h3>
                            <asp:Label ID="lblDirector" runat="server" Text="Director of U.D.C.A."></asp:Label>
                        </h3>
                        <asp:Image ID="ImageDirector" class="img" runat="server" />
                        <h4>
                            <asp:Label ID="lblNameDirector" runat="server" Text="" />
                        </h4>
                    </div>
                </a>
            </div>
        </div>
    </section>
    <section class="sec">
        <div class="main">
            <div class="director-section">
                <div class="row-img">
                    <asp:Image ID="ImgDirector" class="img" runat="server" />
                    <h2><asp:Label ID="NameDirector" runat="server" Text="" /></h2>
                    <h3>Director of UDCA</h3>
                </div>
                <div class="row-txt">
                    <h2>Director's Message</h2>
                    <p>
                        Welcome to the University Department of Computer Applications (UDCA), a vibrant and dynamic
                        institution renowned for its global vision, academic innovation, and commitment to excellence.
                        As the Director, it is my privilege to guide you through our department, where we are driven by
                        the mission to shape the future of technology and empower our students with the skills and
                        knowledge essential for success in today's fast-evolving world.
                    </p>
                    <a href="Director.aspx">Read more</a>
                </div>
            </div>
        </div>
    </section>
    <section class="sec">
        <div class="main">
            <div class="card">
                <div class="board">
                    <h2>Notice & News</h2>
                    <div class="notice-links">
                        <marquee class="marquee" id="marq1" direction="up" scrollamount="2" onmouseover="this.stop();" onmouseout="this.start();">
                            <asp:Literal ID="LiteralNotice" runat="server"></asp:Literal>
                        </marquee>
                    </div>
                    <a class="more" href="LatestNotice.aspx">View All</a>
                </div>
            </div>
            <div class="card">
                <div class="board">
                    <h2>Latest Events</h2>
                    <div class="notice-links">
                        <marquee class="marquee" id="marq2" direction="up" scrollamount="2" onmouseover="this.stop();" onmouseout="this.start();">
                            <asp:Literal ID="LiteralEvent" runat="server"></asp:Literal>
                        </marquee>
                    </div>
                    <a class="more" href="LatestEvents.aspx">View All</a>
                </div>
            </div>
            <div class="card">
                <div class="board">
                    <h2>Latest Tenders</h2>
                    <div class="notice-links">
                        <marquee class="marquee" id="marq3" direction="up" scrollamount="2" onmouseover="this.stop();" onmouseout="this.start();">
                            <asp:Literal ID="LiteralTender" runat="server"></asp:Literal>
                        </marquee>
                    </div>
                    <a class="more" href="ViewTender.aspx">View All</a>
                </div>
            </div>
        </div>
    </section>
    <section class="sec">
        <div class="main">
            <h2>Key Features of UDCA:</h2>
            <ol>
                <li><b>Academic Excellence: </b>The department offers a comprehensive MCA program, emphasizing both theoretical knowledge and practical skills. The curriculum remains aligned with industry trends and technological innovations.</li>
                <li><b>Recognition and Accreditation: </b>UDCA's MCA course is recognized by the Government of Bihar and approved by AICTE, ensuring adherence to high standards of quality in education.</li>
                <li><b>Experienced Faculty: </b>The department prides itself on having a dedicated and experienced team of faculty members who provide exceptional education and mentorship to students.</li>
                <li><b>Student-Centric Approach: </b>UDCA fosters an inclusive and nurturing environment that encourages students to explore, learn, and grow academically and personally.</li>
                <li><b>Global Perspective: </b>The department emphasizes a global outlook, preparing students to tackle challenges in both national and international contexts of the technology sector.</li>
            </ol>
        </div>
    </section>
    <section class="sec">
        <div class="main">
            <asp:Repeater ID="ButtonRepeater" runat="server">
                <ItemTemplate>
                    <div class="panel">
                        <a class="info-btn" href='<%# Eval("LinkURL") %>' target="_blank">
                            <img src="img/logo/logo-small.png" />
                            <p><%# Eval("LinkText") %></p>
                        </a>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </section>
    <section class="sec">
        <div class="main">
            <h2>Facilities at UDCA:</h2>
            <ol>
                <li><b>State-of-the-Art Infrastructure: </b>UDCA’s campus spans 2.5 acres and is equipped with modern facilities that support both academic and extracurricular activities.</li>
                <li><b>Wi-Fi Enabled Campus: </b>The entire campus is Wi-Fi enabled, offering seamless internet access to students and faculty for academic research and communication.</li>
                <li><b>Strategic Location: </b>The campus is ideally situated between the TMBU building and National Highway 80, making it easily accessible for students and staff.</li>
                <li><b>Innovative Learning Environment: </b>The department encourages a stimulating learning environment where students are inspired to think critically, innovate, and collaborate.</li>
                <li><b>Supportive Community: </b>UDCA values the partnership between students, parents, and the institution, providing continuous guidance and mentorship throughout the students' educational journey.</li>
            </ol>
        </div>
    </section>
    <script type="text/javascript" src="script/slider.js"></script>
    <script type="text/javascript" src="script/section.js"></script>
</asp:Content>
