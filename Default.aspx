<%@ Page Title="UDCA | TMBU" Language="C#" MasterPageFile="Website.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" type="text/css" href="style/section.css">
    <link rel="stylesheet" type="text/css" href="style/slider.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content1" runat="Server">
    <section class="sec">
        <div class="main">
            <div class="slider-section">
                <div class="slider">
                    <asp:Repeater ID="SliderRepeater" runat="server">
                    <ItemTemplate>
                        <div class="slide <%# (Container.ItemIndex == 0) ? "active" : "" %>">
                            <img class="slide-img" src="<%# Eval("ImagePath") %>" alt="<%# Eval("Title") %>" />
                            <div class="caption">
                                <h2 class="caption-title" style="color:white"><%# Eval("Title") %></h2>
                            </div>
                        </div>
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
            <h1>WELCOME TO <br>UNIVERSITY DEPARTMENT OF COMPUTER APPLICATIONS</h1>
            <p>The University Department of Computer Applications (UDCA), also known as the Computer Centre, is a prominent unit of Tilka Manjhi Bhagalpur University (TMBU), Bihar. Renowned for its academic excellence, UDCA offers a Master of Computer Applications (MCA) program, providing in-depth knowledge in computer applications. Recognized by the Government of Bihar and approved by AICTE, New Delhi, UDCA sets a high standard for computer science education in the region.</p>
            <h2>Our Mission:</h2>
            <p>UDCA is committed to equipping students with the necessary knowledge and skills to thrive in the ever-evolving field of Information Technology. The department creates an environment that fosters critical thinking, creativity, and social responsibility. It is dedicated to nurturing students to become not only successful IT professionals but also compassionate citizens who make positive contributions to society.</p>
            <h2>Our Vision:</h2>
            <p>UDCA envisions becoming a center of excellence in computer applications, providing world-class education with a global perspective. The department aims to develop innovative and ethical leaders who will shape the future of technology and contribute to the betterment of society.</p>
        </div>
    </section>
    <section class="sec">
        <div class="main">
            <div class="card">
                <a href="Chancellor.aspx">
                    <div class="box">
                        <h3><asp:Label ID="lblChancellor" runat="server" Text="Chancellor of T.M.B.U"></asp:Label></h3>
                        <asp:Image ID="ImageChancellor" class="img" runat="server" />
                        <h4><asp:Label ID="lblNameChancellor" runat="server" Text=""></asp:Label></h4>
                    </div>
                </a>
            </div>
            <div class="card">
                <a href="ViceChancellor.aspx">
                    <div class="box">
                        <h3><asp:Label ID="lblViceChancellor" runat="server" Text="Vice-Chancellor of T.M.B.U"></asp:Label></h3>
                        <asp:Image ID="ImageViceChancellor" class="img" runat="server" />
                        <h4><asp:Label ID="lblNameViceChancellor" runat="server" Text=""></asp:Label></h4>
                    </div>
                </a>
            </div>
            <div class="card">
                <a href="Director.aspx">
                    <div class="box">
                        <h3><asp:Label ID="lblDirector" runat="server" Text="Director of U.D.C.A."></asp:Label></h3>
                        <asp:Image ID="ImageDirector" class="img" runat="server" />
                        <h4><asp:Label ID="lblNameDirector" runat="server" Text="" /></h4>
                    </div>
                </a>
            </div>
        </div>
    </section>
    <section class="sec">
        <div class="main">
            <h2>Features of UDCA:</h2>
            <ul>
                <li><b>Constituent Unit of T.M. Bhagalpur University: </b>UDCA is an integral part of Tilka Manjhi Bhagalpur University, Bhagalpur.</li>
                <li><b>Pioneer in MCA Program: </b>TMBU is the first university in Bihar to offer a 3-year, 6-semester full-time MCA course.</li>
                <li><b>Recognition and Accreditation: </b>UDCA's MCA course recognized by the Government of Bihar and approved by AICTE.</li>
                <li><b>Expansive Campus: </b>The UDCA campus spans 2.5 acres, providing a spacious and conducive environment for learning.</li>
                <li><b>Strategic Location: </b>Conveniently located between the University Administrative Building and National Highway 80.</li>
                <li><b>Wi-Fi Enabled Campus: </b>Fully Wi-Fi-enabled campus, ensuring seamless internet access for students and faculty.</li>
            </ul>
        </div>
    </section>
    <section class="sec">
        <div class="main">
            <h2>Facilities at UDCA:</h2>
            <div class="btn-area">
                <div class="fac">
                    <div class="img-main">
                        <img src="img/icon/computer-lab.png" class="sec-img" alt="Computer Lab">
                    </div>
                    <div class="stud-sec">Computer Lab</div>
                </div>
                <div class="fac">
                    <div class="img-main">
                        <img src="img/icon/library.png" class="sec-img" alt="Library">
                    </div>
                    <div class="stud-sec">Library</div>
                </div>
                <div class="fac">
                    <div class="img-main">
                        <img src="img/icon/faculty.png" class="sec-img" alt="Faculty">
                    </div>
                    <div class="stud-sec">Qualified Faculty</div>
                </div>
                <div class="fac">
                    <div class="img-main">
                        <img src="img/icon/hostel.png" class="sec-img" alt="Hostel">
                    </div>
                    <div class="stud-sec">University Hostel</div>
                </div>
                <div class="fac">
                    <div class="img-main">
                        <img src="img/icon/hospital.png" class="sec-img" alt="Hospital">
                    </div>
                    <div class="stud-sec">Health Centre</div>
                </div>
                <div class="fac">
                    <div class="img-main">
                        <img src="img/icon/free-wifi.png" class="sec-img" alt="Free Wi-Fi">
                    </div>
                    <div class="stud-sec">Wi-Fi Enabled</div>
                </div>
            </div>
        </div>
    </section>
    <section class="sec">
        <div class="main">
            <div class="director-section">
                <div class="row-img">
                    <asp:Image ID="ImgDirector" class="img" runat="server" />
                    <h2 align="center"><asp:Label ID="NameDirector" runat="server" Text="" /></h2>
                    <h3>Director of UDCA</h3>
                </div>
                <div class="row-txt">
                    <h2>Director's Message</h2>
                    <p>Welcome to the University Department of Computer Applications (UDCA), a vibrant and dynamic institution renowned for its global vision, academic innovation, and commitment to excellence. As the Director, it is my privilege to guide you through our department, where we are driven by the mission to shape the future of technology and empower our students with the skills and knowledge essential for success in today's fast-evolving world.</p>
                    <a href="Director.aspx">Read more</a>
                </div>
            </div>
        </div>
    </section>
    <section class="sec">
        <div class="main">
            <h2>Quick Navigation Buttons:</h2>
            <div class="btn-area">
                <div class="fac">
                    <a href="AboutUDCA.aspx">
                        <div class="img-main">
                            <img src="img/icon/college.png" class="sec-img" alt="logo">
                        </div>
                        <div class="stud-sec">About UDCA</div>
                    </a>
                </div>
                <div class="fac">
                    <a href="AboutTMBU.aspx">
                        <div class="img-main">
                            <img src="img/icon/university.png" class="sec-img" alt="logo">
                        </div>
                        <div class="stud-sec">About TMBU</div>
                    </a>
                </div>
                <div class="fac">
                    <a href="ComputerCenter.aspx">
                        <div class="img-main">
                            <img src="img/icon/computer-lab.png" class="sec-img" alt="logo">
                        </div>
                        <div class="stud-sec">About Computer Center</div>
                    </a>
                </div>
                <div class="fac">
                    <a href="AboutDeveloper.aspx">
                        <div class="img-main">
                            <img src="img/icon/developer.png" class="sec-img" alt="logo">
                        </div>
                        <div class="stud-sec">About Developer</div>
                    </a>
                </div>
                <div class="fac">
                    <a href="FacultyMember.aspx">
                        <div class="img-main">
                            <img src="img/icon/faculty.png" class="sec-img" alt="logo">
                        </div>
                        <div class="stud-sec">Faculty Members</div>
                    </a>
                </div>
                <div class="fac">
                    <a href="ViewAlumni.aspx">
                        <div class="img-main">
                            <img src="img/icon/alumni.png" class="sec-img" alt="logo">
                        </div>
                        <div class="stud-sec">Our Alumni</div>
                    </a>
                </div>
                <div class="fac">
                    <a href="Downloads.aspx">
                        <div class="img-main">
                            <img src="img/icon/download.png" class="sec-img" alt="logo">
                        </div>
                        <div class="stud-sec">Download Files</div>
                    </a>
                </div>
                <div class="fac">
                    <a href="ImageGallery.aspx">
                        <div class="img-main">
                            <img src="img/icon/gallery.png" class="sec-img" alt="logo">
                        </div>
                        <div class="stud-sec">Image Gallery</div>
                    </a>
                </div>
                <div class="fac">
                    <a href="HolidayList.aspx">
                        <div class="img-main">
                            <img src="img/icon/holiday-list.png" class="sec-img" alt="logo">
                        </div>
                        <div class="stud-sec">Holiday List</div>
                    </a>
                </div>
                <div class="fac">
                    <a href="Prospectus.aspx">
                        <div class="img-main">
                            <img src="img/icon/prospectus.png" class="sec-img" alt="logo">
                        </div>
                        <div class="stud-sec">Prospectus</div>
                    </a>
                </div>
                <div class="fac">
                    <a href="TimeTable.aspx">
                        <div class="img-main">
                            <img src="img/icon/time-table.png" class="sec-img" alt="logo">
                        </div>
                        <div class="stud-sec">Time Table</div>
                    </a>
                </div>
                <div class="fac">
                    <a href="CourseSyllabus.aspx">
                        <div class="img-main">
                            <img src="img/icon/syllabus.png" class="sec-img" alt="logo">
                        </div>
                        <div class="stud-sec">Syllabus</div>
                    </a>
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
            <h2>Important Links Buttons:</h2>
            <div class="btn-area">
                <div class="fac">
                    <a href="Login.aspx" target="_blank">
                        <div class="img-main">
                            <img src="img/icon/login.png" class="sec-img" alt="logo">
                        </div>
                        <div class="stud-sec">Admin Login</div>
                    </a>
                </div>
                <asp:Repeater ID="ButtonRepeater" runat="server">
                    <ItemTemplate>
                        <div class="fac">
                            <a href='<%# Eval("LinkURL") %>' target="_blank">
                                <div class="img-main">
                                    <img src="img/icon/logo-icon.png" class="sec-img" alt="logo">
                                </div>
                                <div class="stud-sec"><%# Eval("LinkText") %></div>
                            </a>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <div class="fac">
                    <a href="http://udcalibrary.runasp.net/" target="_blank">
                        <div class="img-main">
                            <img src="img/icon/online-library.png" class="sec-img" alt="logo">
                        </div>
                        <div class="stud-sec">Online-Library</div>
                    </a>
                </div>
            </div>
        </div>
    </section>
    <script type="text/javascript" src="script/slider.js"></script>
    <script type="text/javascript" src="script/section.js"></script>
</asp:Content>