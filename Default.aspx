<%@ Page Title="UDCA | TMBU" Language="C#" MasterPageFile="Website.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" type="text/css" href="style/slider.css">
    <link rel="stylesheet" type="text/css" href="style/section.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content1" runat="Server">
    <section class="link-sce">
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
    </section>
    <section class="top-sec">
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
            <div class="tabs">
                <div class="tab-link active" onclick="openTab(event, 'Notice')">
                    Latest Notice
                </div>
                <div class="tab-link" onclick="openTab(event, 'Event')">
                    Latest Events
                </div>
            </div>
            <div id="Notice" class="tab-content" style="display: block;">
                <div class="notice-board">
                    <div class="notice-links">
                        <marquee class="marquee" id="marq1" direction="up" scrollamount="2" onmouseover="this.stop();" onmouseout="this.start();">
                            <asp:Literal ID="LiteralNotices" runat="server"></asp:Literal>
                        </marquee>
                    </div>
                </div>
            </div>
            <div id="Event" class="tab-content">
                <div class="notice-board">
                    <div class="notice-links">
                        <marquee class="marquee" id="marq2" direction="up" scrollamount="2" onmouseover="this.stop();" onmouseout="this.start();">
                            <asp:Literal ID="LiteralNews" runat="server"></asp:Literal>
                        </marquee>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="mid-sec">
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
                        <asp:Label ID="lblNameDirector" runat="server" Text=""></asp:Label>
                    </h4>
                </div>
            </a>
        </div>
        <div class="card">
            <div class="box">
                <h3>Key features of UDCA</h3>
                <ul>
                    <li>TMBU is the first university in Bihar to offer MCA course.</li>
                    <li>UDCA is a constituent unit of TMBU.</li>
                    <li>The campus covers 2.5 acres.</li>
                    <li>The campus is Wi-Fi enabled.</li>
                    <li>The campus is located between the TMBU building and NH-80.</li>
                </ul>
            </div>
        </div>
        <div class="card">
            <a href="Director.aspx">
                <div class="about">
                    <h3>Director's Message</h3>
                    <p>Welcome to UDCA. We pride ourselves on our global outlook and innovative spirit. It is my pleasure to introduce you to our department, where we are committed to providing the best administrative support for your academic career.</p>
                    <p class="highlight">Click to read more</p>
                </div>
            </a>
        </div>
        <div class="card">
            <a href="AboutTMBU.aspx">
                <div class="about">
                    <h3>About TMBU</h3>
                    <p>Tilka Manjhi Bhagalpur University, also known as Bhagalpur University, is a leading institution for higher education in Bihar. Located in Bhagalpur city, the university is named after the renowned freedom fighter Tilka Manjhi.</p>
                    <p class="highlight">Click to read more</p>
                </div>
            </a>
        </div>
        <div class="card">
            <a href="AboutUDCA.aspx">
                <div class="about">
                    <h3>About UDCA</h3>
                    <p>The University Department of Computer Applications, a part of Tilka Manjhi Bhagalpur University and also known as the Computer Centre, offers an MCA course. It is recognized by the Govt. of Bihar and approved by AICTE, New Delhi.</p>
                    <p class="highlight">Click to read more</p>
                </div>
            </a>
        </div>
        <div class="card">
            <a href="ComputerCenter.aspx">
                <div class="about">
                    <h3>About Computer Center</h3>
                    <p>The Computer Centre at Tilka Manjhi Bhagalpur University represents a significant milestone in technological progress and educational empowerment in the region. Established in 1988 with a grant from the UGC, New Delhi.</p>
                    <p class="highlight">Click to read more</p>
                </div>
            </a>
        </div>
    </section>
    <section class="down-sec">
        <asp:Repeater ID="ButtonRepeater" runat="server">
            <ItemTemplate>
                <div class="panel">
                    <a class="info-btn" href='<%# Eval("LinkURL") %>' target="_blank">
                        <img src="img/logo/logo-small.png" />
                        <p>&nbsp;<%# Eval("LinkText") %></p>
                    </a>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </section>
    <script type="text/javascript" src="script/slider.js"></script>
    <script type="text/javascript" src="script/section.js"></script>
</asp:Content>
