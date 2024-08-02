<%@ Page Title="" Language="C#" MasterPageFile="~/Root.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" type="text/css" href="style/slider.css">
    <link rel="stylesheet" type="text/css" href="style/section.css">
    <link rel="stylesheet" type="text/css" href="style/person.css">
    <link rel="stylesheet" type="text/css" href="style/PdfViewer.css">
    <script type="text/javascript" src="script/jquery.js"></script>
    <title>UDCA | TMBU</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
            <div id="wowslider-container">
                <div class="ws_images">
                    <ul>
                        <asp:Repeater ID="SliderRepeater" runat="server">
                            <ItemTemplate>
                                <li>
                                    <img src="<%# Eval("ImagePath") %>" title="<%# Eval("Title") %>" /></li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                </div>
            </div>
            <script type="text/javascript" src="script/wowslider.js"></script>
            <script type="text/javascript" src="script/slider.js"></script>
        </div>
        <div class="notice-section">
            <!-- Tabs -->
            <div class="tabs">
                <div class="tab-link active" onclick="openTab(event, 'Notices')">
                    Notices
                </div>
                <div class="tab-link" onclick="openTab(event, 'News')">
                    News
                </div>
                <div class="tab-link" onclick="openTab(event, 'Tender')">
                    Tender
                </div>
            </div>
            <!-- Notices Tab -->
            <div id="Notices" class="tab-content" style="display: block;">
                <div class="notice-board">
                    <div class="notice-links">
                        <marquee class="marquee" id="marq1" direction="up" scrollamount="2" onmouseover="this.stop();" onmouseout="this.start();">
                            <asp:Literal ID="LiteralNotices" runat="server"></asp:Literal>
                        </marquee>
                    </div>
                </div>
            </div>
            <!-- News Tab -->
            <div id="News" class="tab-content">
                <div class="notice-board">
                    <div class="notice-links">
                        <marquee class="marquee" id="marq2" direction="up" scrollamount="2" onmouseover="this.stop();" onmouseout="this.start();">
                            <asp:Literal ID="LiteralNews" runat="server"></asp:Literal>
                        </marquee>
                    </div>
                </div>
            </div>
            <!-- Tender Tab -->
            <div id="Tender" class="tab-content">
                <div class="notice-board">
                    <div class="notice-links">
                        <marquee class="marquee" id="marq3" direction="up" scrollamount="2" onmouseover="this.stop();" onmouseout="this.start();">
                            <asp:Literal ID="LiteralTender" runat="server"></asp:Literal>
                        </marquee>
                    </div>
                </div>
            </div>
        </div>
        <!-- Lightbox for PDF Viewer -->
        <div id="lightbox" class="lightbox">
            <div class="lightbox-content">
                <span class="close">&times;</span>
                <div id="pdf-viewer">
                    <!-- Canvases will be dynamically added here -->
                </div>
            </div>
        </div>
    </section>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.9.359/pdf.min.js"></script>
    <script src="script/PdfViewer.js"></script>
    <script type="text/javascript" src="script/tabs.js"></script>
    <div class="person">
        <div class="card">
            <a href="Chancellor.aspx">
                <div class="box">
                    <h3 align="center">
                        <asp:Label ID="lblChancellor" runat="server" Text="Chancellor of T.M.B.U"></asp:Label></h3>
                    <asp:Image ID="ImageChancellor" class="img" runat="server" />
                    <h4>
                        <asp:Label ID="lblNameChancellor" runat="server" Text=""></asp:Label></h4>
                </div>
            </a>
        </div>
        <div class="card">
            <a href="ViceChancellor.aspx">
                <div class="box">
                    <h3 align="center">
                        <asp:Label ID="lblViceChancellor" runat="server" Text="Vice-Chancellor of T.M.B.U"></asp:Label></h3>
                    <asp:Image ID="ImageViceChancellor" class="img" runat="server" />
                    <h4>
                        <asp:Label ID="lblNameViceChancellor" runat="server" Text=""></asp:Label></h4>
                </div>
            </a>
        </div>
        <div class="card">
            <a href="ProViceChancellor.aspx">
                <div class="box">
                    <h3 align="center">
                        <asp:Label ID="lblProViceChancellor" runat="server" Text="Pro-Vice-Chancellor of T.M.B.U"></asp:Label></h3>
                    <asp:Image ID="ImageProViceChancellor" class="img" runat="server" />
                    <h4>
                        <asp:Label ID="lblNameProViceChancellor" runat="server" Text=""></asp:Label></h4>
                </div>
            </a>
        </div>
        <div class="card">
            <a href="Director.aspx">
                <div class="box">
                    <h3 align="center">
                        <asp:Label ID="lblDirector" runat="server" Text="Director of U.D.C.A."></asp:Label></h3>
                    <asp:Image ID="ImageDirector" class="img" runat="server" />
                    <h4>
                        <asp:Label ID="lblNameDirector" runat="server" Text=""></asp:Label></h4>
                </div>
            </a>
        </div>
    </div>
    <br />
    <br />
    <div class="mid-sec">
        <div class="sec">
            <div class="labels">
                <p class="label-text">Director's Message</p>
            </div>
            <br />
            <p>
                Welcome to University Department of Computer Applications(UDCA),a young, elite department
                with a world-class reputation, global outlook, innovative spirit. It is my real
                pleasure to introduce you to the department. Department strives to offer its student
                the best administrative component of there academic career .......
            </p>
            <p style="text-align: right;"><a href="Director.aspx">Read More...</a></p>
        </div>
        <div class="sec">
            <div class="labels">
                <p class="label-text">About UDCA</p>
            </div>
            <br />
            <p>
                University Department of Computer Applications (UDCA) is a constituent unit of Tilka
                Manjhi Bhagalpur University, Bhagalpur, Bihar. It is formally known as COMPUTER
                CENTRE. This University Department of Computer Applications offers Master of Computer
                Applications course. UDCA is Recognised by .......
            </p>
            <p style="text-align: right;"><a href="AboutUDCA.aspx">Read More...</a></p>
        </div>
        <div class="sec">
            <div class="labels">
                <p class="label-text">Key Features of UDCA</p>
            </div>
            <br />
            <ul>
                <li>UDCA is a constituent unit of T.M.Bhagalpur University, Bhagalpur.</li>
                <li>TMBU is the first University in Bihar to offers 3 years (six semesters) full time MCA course.</li>
                <li>The UDCA campus is spread over 2.5 acrs.</li>
                <li>The campus is situated between University Administrative Building and NH-80 at 1/2 km from equi distance.</li>
            </ul>
        </div>
    </div>
    <div class="down-sec">
        <div class="ext-btn">
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
        </div>
    </div>
</asp:Content>
