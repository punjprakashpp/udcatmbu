<%@ Page Title="UDCA | TMBU" Language="C#" MasterPageFile="~/Website.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" type="text/css" href="style/slider.css">
    <link rel="stylesheet" type="text/css" href="style/section.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content1" runat="Server">
    <section class="top-sec">
        <div class="marquee-links">
            <p class="high">Highlights: </p>
            <marquee behavior="scroll" onmouseover="this.stop();" onmouseout="this.start();">
					<asp:Repeater ID="linksRepeater" runat="server">
						<ItemTemplate>
							<a href='<%# Eval("LinkURL") %>' target=_blank><b><font size="3"><%# Eval("LinkText") %></font></b></a>
                    </ItemTemplate>
                </asp:Repeater>
            </marquee>
        </div>
        <div class="slider">
            <div id="wowslider-container" style="margin: 0 auto;">
                <div class="ws_images">
                    <ul>
                        <asp:Repeater ID="SliderRepeater" runat="server">
                            <ItemTemplate>
                                <li>
                                    <img src="<%# Eval("ImagePath") %>" title="<%# Eval("Title") %>" />
                                </li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                </div>
            </div>
        </div>
        <div class="notice-section">
            <!-- Tabs -->
            <div class="tabs">
                <div class="tab-link active" onclick="openTab(event, 'Notice')">
                    Latest Notice
                </div>
                <div class="tab-link" onclick="openTab(event, 'Event')">
                    Latest Events
                </div>
            </div>
            <!-- Notices Tab -->
            <div id="Notice" class="tab-content" style="display: block;">
                <div class="notice-board">
                    <div class="notice-links">
                        <marquee class="marquee" id="marq1" direction="up" scrollamount="2" onmouseover="this.stop();" onmouseout="this.start();">
                            <asp:Literal ID="LiteralNotices" runat="server"></asp:Literal>
                        </marquee>
                    </div>
                </div>
            </div>
            <!-- News Tab -->
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
                    <h3 align="center">
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
                    <h3 align="center">
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
                    <h3 align="center">
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
            <a href="Director.aspx">
                <div class="box">
                    <h4 style="margin-top: 0px;">Director's Message</h4>
                    <p style="text-align: justify;">Welcome to UDCA. we pride ourselves on our global outlook and innovative spirit. It is my pleasure to introduce you to our department, where we are committed to providing the best administrative support for your academic career.</p>
                    <p style="text-align: right; color: blueviolet;">Click to read more</p>
                </div>
            </a>
        </div>
        <div class="card">
            <a href="AboutTMBU.aspx">
                <div class="box">
                    <h4 style="margin-top: 0px;">About TMBU</h4>
                    <p style="text-align: justify;">Tilka Manjhi Bhagalpur University, also known as Bhagalpur University, is a leading institution for higher education in Bihar. Located in Bhagalpur city, the university is named after the renowned freedom fighter Tilka Manjhi.</p>
                    <p style="text-align: right; color: blueviolet;">Click to read more</p>
                </div>
            </a>
        </div>
        <div class="card">
            <a href="AboutUDCA.aspx">
                <div class="box">
                    <h4 style="margin-top: 0px;">About UDCA</h4>
                    <p style="text-align: justify;">The University Department of Computer Applications, a part of Tilka Manjhi Bhagalpur University and also known as the Computer Centre, offers an MCA course. It is recognized by the Government of Bihar and approved by AICTE, New Delhi.</p>
                    <p style="text-align: right; color: blueviolet;">Click to read more</p>
                </div>
            </a>
        </div>
        <div class="card">
            <a href="ComputerCenter.aspx">
                <div class="box">
                    <h4 style="margin-top: 0px;">About Computer Center</h4>
                    <p style="text-align: justify;">The Computer Centre at Tilka Manjhi Bhagalpur University represents a significant milestone in technological progress and educational empowerment in the region. Established in 1988 with a grant from the University Grant Commission.</p>
                    <p style="text-align: right; color: blueviolet;">Click to read more</p>
                </div>
            </a>
        </div>
        <div class="card">
            <div class="box">
                <h4 style="margin-top: 0px;">Key features of UDCA</h4>
                <ul style="text-align: left; margin-left: 5px;">
                    <li>UDCA is a constituent unit of TMBU.</li>
                    <li>TMBU is the first university in Bihar to offer full time (3 years) MCA course.</li>
                    <li>The campus is located between the TMBU building and NH-80.</li>
                    <li>The campus covers 2.5 acres.</li>
                    <li>The campus is Wi-Fi enabled.</li>
                </ul>
            </div>
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
    <script type="text/javascript" src="script/jquery.js"></script>
    <script type="text/javascript" src="script/wowslider.js"></script>
    <script type="text/javascript" src="script/slider.js"></script>
    <script type="text/javascript" src="script/section.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            function adjustHeights() {
                let cards = document.querySelectorAll('.mid-sec .card');
                let boxes = document.querySelectorAll('.mid-sec .box');
                let maxCardHeight = 0;
                let maxBoxHeight = 0;

                // Reset heights to calculate the natural height
                cards.forEach(function (card) {
                    card.style.height = 'auto';
                });

                boxes.forEach(function (box) {
                    box.style.height = 'auto';
                });

                // Find the maximum height among all cards
                cards.forEach(function (card) {
                    let cardHeight = card.offsetHeight;
                    if (cardHeight > maxCardHeight) {
                        maxCardHeight = cardHeight;
                    }
                });

                // Find the maximum height among all boxes
                boxes.forEach(function (box) {
                    let boxHeight = box.offsetHeight;
                    if (boxHeight > maxBoxHeight) {
                        maxBoxHeight = boxHeight;
                    }
                });

                // Set all cards to the maximum height
                cards.forEach(function (card) {
                    card.style.height = maxCardHeight + 'px';
                });

                // Set all boxes to the maximum height
                boxes.forEach(function (box) {
                    box.style.height = maxBoxHeight + 'px';
                });
            }

            // Initial adjustment on page load
            adjustHeights();

            // Adjust heights on window resize to handle dynamic content changes
            window.addEventListener('resize', function () {
                if (window.innerWidth >= 760) {
                    adjustHeights();
                } else {
                    // Reset the height when below 760px
                    document.querySelectorAll('.mid-sec .card, .mid-sec .box').forEach(function (element) {
                        element.style.height = 'auto';
                    });
                }
            });
        });
    </script>
</asp:Content>
