<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta lang="en">
    <!--Head Section for Title, Logo, Keyword & Description-->
    <link rel="icon" href="img/logo/logo-small.png" type="image" />
    <meta name="keywords" content="UDCA, UDCA TMBU, udcatmbu, University Department of Computer Applications TMBU, University Department of Computer Applications T.M.Bhagalpur University, Computer Center, Computer Center Bhagalpur, MCA, MCA in Bhagalpur, MCA from TMBU, Master of Computer Applications (MCA) in Bhagalpur">
    <meta name="description" content="University Department of Computer Applications (UDCA) is a constituent unit of Tilka Manjhi Bhagalpur University (TMBU), Bhagalpur.The first University in Bihar to offers 3 years (6 semesters) full time MCA course, now offering 2 years (4 semesters) MCA Course according to new guidelines. The UDCA campus is spread over 2.5 acrs and fully equiped with Wi-Fi.">
    <!--End-->
    <link rel="stylesheet" href="font/font-awesome.css">
    <link rel="stylesheet" href="font/Poppins.css">
    <title>UDCA Automated Library</title>
    <link rel="stylesheet" type="text/css" href="Styles/Styles.css">
</head>
<body>
    <header>
        <div class="header-contacts">
            <div class="container">
                <div class="row">
                    <div class="contact">
                        <div class="top-header-icons">
                            <ul class="top-header-icons-ul">
                                <li><a href="tel:0641-250040"><i class="fa fa-phone " aria-hidden="true"></i>&nbsp;0641-250040</a></li>
                                <li><a href="mailto:udcatmbu.bgp@gmail.com"><i class="fa fa-envelope " aria-hidden="true"></i>&nbsp;udcatmbu.bgp@gmail.com</a></li>
                                <li>&nbsp;</li><li>&nbsp;</li>
                            </ul>
                        </div>
                    </div>
                    <div class="contact">
                        <div class="top-header-icons">
                            <ul class="top-header-icons-ul social">
                                <li><a href="https://www.linkedin.com/in/udcatmbu" target="_blank"><i class="fa fa-linkedin " aria-hidden="true"></i>&nbsp;Linkedin</a></li>
                                <li><a href="https://www.facebook.com/udcatmbu" target="_blank"><i class="fa fa-facebook " aria-hidden="true"></i>&nbsp;Facebook</a></li>
                                <li><a href="https://www.instagram.com/udcatmbu" target="_blank"><i class="fa fa-instagram " aria-hidden="true"></i>&nbsp;Instagram</a></li>
                                <li><a href="https://x.com/udcatmbu" target="_blank"><i class="fa fa-twitter " aria-hidden="true"></i>&nbsp;Twitter</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <form id="form1" runat="server">
        <div class="bg">
            <div id="title">
                <h1>Welcome to Automated Library of UDCA</h1>
            </div>
            <div id="main">
                <div id="img">
                    <br /><img src="img/dept/ComputerCentre.jpg" />
                </div>
                <div id="login">
                    <table class="tbl">
                        <tr>
                            <td class="tblhead" colspan="2">Login to Automated Library</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>
                                <asp:Label ID="lbl" runat="server" Font-Size="11px" ForeColor="Red"></asp:Label></td>
                        </tr>
                        <tr>
                            <td class="lbl">Select Type : </td>
                            <td>
                                <asp:RadioButton ID="rdolibrary" runat="server" Checked="True" ForeColor="Green"
                                    GroupName="a" Text="Librarian" />
                                &nbsp;<asp:RadioButton ID="rdosudent" runat="server" ForeColor="Green" GroupName="a"
                                    Text="Student" />
                            </td>
                        </tr>
                        <tr>
                            <td class="lbl">User Name : </td>
                            <td>
                                <asp:TextBox ID="txtuname" runat="server" CssClass="txt"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtuname"
                                    ErrorMessage="!!!" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="lbl">Password : </td>
                            <td>
                                <asp:TextBox ID="txtupass" runat="server" CssClass="txt" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtupass"
                                    ErrorMessage="!!!" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>
                                <asp:Button ID="btnLogin" runat="server" CssClass="btn" Text="Login" Width="80px" 
                                    Font-Size="12pt" OnClick="btnLogin_Click" />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </form>
    <footer>
        <div class="footer-distributed">
            <div class="footer-copyright">
                <p>Copyright &copy; 2024 UDCA TMBU | All Rights Reserved !</p>
            </div>
        </div>
    </footer>
</body>
</html>
