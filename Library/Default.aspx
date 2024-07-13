﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Library_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta lang="en-in">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--Head Section for Title, Logo, Keyword & Description-->
    <title>UDCA Automated Library</title>
    <link rel="icon" href="../img/logo/logo-small.png" type="image" />
    <meta name="keywords" content="UDCA, UDCA TMBU, udcatmbu, University Department of Computer Applications TMBU, University Department of Computer Applications T.M.Bhagalpur University, Computer Center, Computer Center Bhagalpur, MCA, MCA in Bhagalpur, MCA from TMBU, Master of Computer Applications (MCA) in Bhagalpur">
    <meta name="description" content="University Department of Computer Applications (UDCA) is a constituent unit of Tilka Manjhi Bhagalpur University (TMBU), Bhagalpur.The first University in Bihar to offers 3 years (6 semesters) full time MCA course, now offering 2 years (4 semesters) MCA Course according to new guidelines. The UDCA campus is spread over 2.5 acrs and fully equiped with Wi-Fi.">
    <!--End-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="../style/menu.css">
    <link rel="stylesheet" type="text/css" href="../style/footer.css">
    <link rel="stylesheet" type="text/css" href="../style/header.css">
    <link rel="stylesheet" type="text/css" href="Styles.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <header>
        <div class="header-contacts">
            <div class="container">
                <div class="row">
                    <div class="contact">
                        <div class="top-header-icons">
                            <ul class="top-header-icons-ul">
                                <li><a href="tel:0641-250040"><i class="fa fa-phone " aria-hidden="true"></i>&nbsp;0641-250040</a></li>
                                <li><a href="mailto:udcatmbu.bgp@gmail.com"><i class="fa fa-envelope " aria-hidden="true"></i>&nbsp;udcatmbu.bgp@gmail.com</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="contact">
                        <div class="top-header-icons">
                            <ul class="top-header-icons-ul social">
                                <li><a href="https://www.linkedin.com/in/udcatmbu" target="_blank"><i class="fa fa-linkedin " aria-hidden="true"></i>Linkedin</a></li>
                                <li><a href="https://www.facebook.com/udcatmbu" target="_blank"><i class="fa fa-facebook " aria-hidden="true"></i>Facebook</a></li>
                                <li><a href="https://www.instagram.com/udcatmbu" target="_blank"><i class="fa fa-instagram " aria-hidden="true"></i>Instagram</a></li>
                                <li><a href="https://x.com/udcatmbu" target="_blank"><i class="fa fa-twitter " aria-hidden="true"></i>Twitter</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="header-brand">
            <div class="header-image">
                <a href="../Default.aspx">
                    <img class="logo-header" src="../img/logo/logo-header.png"></a>
            </div>
        </div>
    </header>
    <nav class="navbar" id="navbar">
        <a href="javascript:void(0);" class="icon" onclick="toggleResponsive()"><i class="fa fa-bars"></i></a>
        <div class="subnav home-link">
        </div>
        <a href="../Default.aspx"><i class="fa fa-home"></i>Home</a>
        <div class="subnav">
            <button class="subnavbtn" onclick="toggleDropdown(this)">
                <i class="fa fa-info-circle"></i>About <i class="fa fa-caret-down"></i>
            </button>
            <div class="subnav-content">
                <a href="../AboutUDCA.aspx"><i class="fa fa-university"></i>About UDCA</a> 
                <a href="../AboutTMBU.aspx"><i class="fa fa-university"></i>About TMBU</a> 
                <a href="../AboutComputerCenter.aspx"><i class="fa fa-desktop"></i>Computer Center</a> 
                <a href="../Director.aspx"><i class="fa fa-user"></i>Director's Message</a> 
                <a href="../HowToReach.aspx"><i class="fa fa-map-marker"></i>How to Reach Here</a> 
                <a href="../CampusMap.aspx"><i class="fa fa-map"></i>Campus Map</a> 
                <a href="../ContactUs.aspx"><i class="fa fa-phone"></i>Contact Us</a>
                <a href="../AboutDeveloper.aspx"><i class="fa fa-code"></i>About Developers</a>
            </div>
        </div>
        <div class="subnav">
            <button class="subnavbtn" onclick="toggleDropdown(this)">
                <i class="fa fa-graduation-cap"></i>Academic <i class="fa fa-caret-down"></i>
            </button>
            <div class="subnav-content">
                <a href="../AcademicCalender.aspx"><i class="fa fa-calendar"></i>Academic Calendar</a>
                <a href="../Prospectus.aspx"><i class="fa fa-book"></i>Prospectus</a> 
                <a href="../TimeTable.aspx"><i class="fa fa-clock-o"></i>Time Table</a> 
                <a href="../HolidayList.aspx"><i class="fa fa-sun-o"></i>Holiday List</a>
            </div>
        </div>
        <div class="subnav">
            <button class="subnavbtn" onclick="toggleDropdown(this)">
                <i class="fa fa-university"></i>Admission <i class="fa fa-caret-down"></i>
            </button>
            <div class="subnav-content">
                <a href="../SelectionProcedure.aspx"><i class="fa fa-check-circle"></i>Selection Procedure</a>
                <a href="../EnteranceTest.aspx"><i class="fa fa-pencil"></i>Entrance Test</a> 
                <a href="../EligiblityCriteria.aspx"><i class="fa fa-list-alt"></i>Eligibility Criteria</a> 
                <a href="../ImportantDates.aspx"><i class="fa fa-calendar-check-o"></i>Important Dates</a>
            </div>
        </div>
        <div class="subnav">
            <button class="subnavbtn" onclick="toggleDropdown(this)">
                <i class="fa fa-book"></i>Course Offered <i class="fa fa-caret-down"></i>
            </button>
            <div class="subnav-content">
                <a href="../CourseStructure.aspx"><i class="fa fa-list"></i>Course Structure</a>
                <a href="../FeeStructure.aspx"><i class="fa fa-money"></i>Fee Structure</a> 
                <a href="../CourseSyllabus.aspx"><i class="fa fa-file-text"></i>Course Syllabus</a>
            </div>
        </div>
        <div class="subnav">
            <button class="subnavbtn" onclick="toggleDropdown(this)">
                <i class="fa fa-gavel"></i>Campus Rules <i class="fa fa-caret-down"></i>
            </button>
            <div class="subnav-content">
                <a href="../AttendenceProtocol.aspx"><i class="fa fa-calendar"></i>Attendance Protocol</a>
                <a href="../AntiRagging.aspx"><i class="fa fa-ban"></i>Anti-Ragging</a> 
                <a href="../DressCode.aspx"><i class="fa fa-shirtsinbulk"></i>Dress Code</a> 
                <a href="../Decipline.aspx"><i class="fa fa-balance-scale"></i>Discipline</a>
            </div>
        </div>
        <div class="subnav">
            <button class="subnavbtn" onclick="toggleDropdown(this)">
                <i class="fa fa-cogs"></i>Administration <i class="fa fa-caret-down"></i>
            </button>
            <div class="subnav-content">
                <a href="../Chancellor.aspx"><i class="fa fa-user"></i>Chancellor</a> 
                <a href="../ViceChancellor.aspx"><i class="fa fa-user"></i>Vice-Chancellor</a> 
                <a href="../ProViceChancellor.aspx"><i class="fa fa-user"></i>Pro-Vice-Chancellor</a> 
                <a href="../Director.aspx"><i class="fa fa-user"></i>Director</a> 
                <a href="../DSW.aspx"><i class="fa fa-user"></i>DSW</a> 
                <a href="../CCDC.aspx"><i class="fa fa-user"></i>CCDC</a>
                <a href="../Registrar.aspx"><i class="fa fa-user"></i>Registrar</a>                
            </div>
        </div>
        <div class="subnav">
            <button class="subnavbtn" onclick="toggleDropdown(this)">
                <i class="fa fa-group"></i>Faculty & Staffs <i class="fa fa-caret-down"></i>
            </button>
            <div class="subnav-content">
                <a href="../FacultyMember.aspx"><i class="fa fa-users"></i>Faculty Member</a>  
                <a href="../OfficeStaff.aspx"><i class="fa fa-briefcase"></i>Office Staffs</a> 
                <a href="../SupportingStaff.aspx"><i class="fa fa-user-secret"></i>Supporting Staffs</a>
            </div>
        </div>
        <div class="subnav">
            <button class="subnavbtn" onclick="toggleDropdown(this)">
                <i class="fa fa-building"></i>Amenities <i class="fa fa-caret-down"></i>
            </button>
            <div class="subnav-content">
                <a href="../Library/Default.aspx"><i class="fa fa-book"></i>UDCA Library</a>
                <a href="../UniversityHostel.aspx"><i class="fa fa-bed"></i>University Hostel</a> 
                <a href="../CentralLibrary.aspx"><i class="fa fa-book"></i>Central Library</a> 
                <a href="../MedicalFacility.aspx"><i class="fa fa-medkit"></i>Medical Facilities</a>
            </div>
        </div>
        <div class="subnav">
            <button class="subnavbtn" onclick="toggleDropdown(this)">
                <i class="fa fa-users"></i>Alumni <i class="fa fa-caret-down"></i>
            </button>
            <div class="subnav-content">
                <a href="../ViewAlumni.aspx"><i class="fa fa-user"></i>View Our Almuni</a> 
                <a href="../AlumniRegistration.aspx"><i class="fa fa-sign-in"></i>Alumni Registration</a>
            </div>
        </div>
        <div class="subnav">
            <button class="subnavbtn" onclick="toggleDropdown(this)">
                <i class="fa fa-photo"></i>Gallery <i class="fa fa-caret-down"></i>
            </button>
            <div class="subnav-content">
                <a href="../ImageGallery.aspx"><i class="fa fa-image"></i>Image Gallery</a>
                <a href="../VideoGallery.aspx"><i class="fa fa-video-camera"></i>Video Gallery</a>
                <a href="../NewsGallery.aspx"><i class="fa fa-newspaper-o"></i>News Gallery</a>
            </div>
        </div> 
        <div class="subnav">
            <button class="subnavbtn" onclick="toggleDropdown(this)">
                <i class="fa fa-info-circle"></i>Information <i class="fa fa-caret-down"></i>
            </button>
            <div class="subnav-content">
                <a href="../Notice.aspx"><i class="fa fa-bell"></i>Notice</a> 
                <a href="../News.aspx"><i class="fa fa-newspaper-o"></i>News</a> 
                <a href="../Tender.aspx"><i class="fa fa-info"></i>Tender</a>
                <a href="../AffiliationRegulation.aspx"><i class="fa fa-file"></i>Affiliations & Regulations</a>
            </div>
        </div> 
        <a href="../Downloads.aspx"><i class="fa fa-download"></i>Downloads</a> 
        <a href="../Login.aspx"><i class="fa fa-sign-in"></i>Login</a>
    </nav>
    
    <script src="../script/menu.js"></script>
        <center>
    <div class="bg">
        <div id="title">
            <h1>
                Welcome to Automated Library of UDCA</h1>
        </div>
        <div id="main">
            <div id="img">
                <img src="img/logo/logo-lib-back.png" />
            </div>
            <div id="login">
                <table class="tbl">
                    <tr>
                        <td class="tblhead" colspan="2">
                            Login to Automated Library
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="lbl">
                            Select Type :
                        </td>
                        <td>
                            <asp:RadioButton ID="rdolibrary" runat="server" Checked="True" ForeColor="Green"
                                GroupName="a" Text="Librarian" />
                            &nbsp;<asp:RadioButton ID="rdosudent" runat="server" ForeColor="Green" GroupName="a"
                                Text="Student" />
                        </td>
                    </tr>
                    <tr>
                        <td class="lbl">
                            User Name :
                        </td>
                        <td>
                            <asp:TextBox ID="txtuname" runat="server" CssClass="txt"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtuname"
                                ErrorMessage="!!!" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="lbl">
                            Password : </td>
                        <td>
                            <asp:TextBox ID="txtupass" runat="server" CssClass="txt" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtupass"
                                ErrorMessage="!!!" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            <asp:Button ID="btnLogin" runat="server" CssClass="btn" Text="Login" Width="80px"
                                Font-Size="12pt" OnClick="btnLogin_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            <asp:Label ID="lbl" runat="server" Font-Size="11px" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>                    
                </table>
            </div>
        </div>
    </div>
    </center>
    <footer class="footer-distributed">
        <div class="footer-left">
            <span><a href="../Default.aspx">
                <img src="../img/logo/logo-head.png" alt="logo-head"></a></span>
            <p style="font-size: 14px; line-height: 1.8em; padding-left: 10px;">
                <b>Location:</b> <a href="https://maps.app.goo.gl/Zv7E8aFZ3hYQ1ZMf6" target="_blank">Computer Center,</a> TMBU, Bhagalpur, Bihar, 812007<br><b>Phone:</b> <a href="tel:0641250040">0641-250040</a></br>
                <b>Website:</b> <a href="http://udcatmbu.org">udcatmbu.org</a><br>
                <b>Email:</b> <a href="mailto:udcatmbu.bgp@gmail.com">udcatmbu.bgp@gmail.com</a><br>
                <b>Click to know </b><a href="../HowToReach.aspx">How to Reach Here</a><br>
            </p>
        </div>
        <div class="footer-center-left">
            <h2>Important Links</h2>
            <ul class="footer-links">
                <li><a href="http://tmbuniv.ac.in" target="_blank">Tilka Manjhi Bhagalpur University</a></li>
                <li><a href="https://www.ugc.ac.in/" target="_blank">University Grant Commission</a></li>
                <li><a href="https://www.aicte-india.org/" target="_blank">All India Council of Technical
                    Education</a></li>
                <li><a href="https://bhagalpur.nic.in/" target="_blank">Bhagalpur Official Website</a></li>
                <li><a href="https://governor.bih.nic.in/" target="_blank">Raj Bhavan Bihar Website</a></li>
                <li><a href="https://state.bihar.gov.in/" target="_blank">Bihar Government Official
                    Website</a></li>
            </ul>
        </div>
        <div class="footer-center-right">
            <h2>Useful Websites</h2>
            <ul class="footer-links">
                <li><a href="https://swayam.gov.in/" target="new">SWAYAM Portal</a></li>
                <li><a href="http://www.freshersworld.com/" target="new">Freshers World</a></li>
                <li><a href="https://internshala.com/" target="new">InternShala</a></li>                
            </ul>
        </div>
        <div class="footer-right">
            <h2>Quick Links</h2>
            <ul class="footer-links">
                <li><a href="../Downloads.aspx">Downloads</a></li>
                <li><a href="../TimeTable.aspx">Time Table</a></li>
                <li><a href="../HolidayList.aspx">Holiday List</a></li>
                <li><a href="../ImageGallery.aspx">Image Gallery</a></li>
                <li><a href="../AlumniRegistration.aspx">Alumni Registration</a></li>
                <li><a href="../Library/Default.aspx">UDCA Automated Library</a></li>
            </ul>
        </div>
        <hr />
        <div class="footer-copyright">
            <p>Copyright &copy; 2024 - <asp:Label ID="lblyear" runat="server"></asp:Label> UDCA TMBU | All Rights Reserved ! | Developed & Managed by UDCA TMBU | Visitor Count : <asp:Label ID="lblVisitorCount" runat="server" ForeColor="Red" /></p>
        </div>
    </footer>
    </div>
    </form>
</body>
</html>
