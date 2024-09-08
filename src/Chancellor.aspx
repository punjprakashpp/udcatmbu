<%@ page title="Chancellor" language="C#" masterpagefile="Website.master" autoeventwireup="true" CodeFile="Chancellor.aspx.cs" inherits="pages_Chancellor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" type="text/css" href="style/pages.css">
    <style>
        .cont .title, .cont h2, .cont h1 {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content1" Runat="Server">
    <div class="cont" align="center">
        <h1 class="title">Chancellor of TMBU</h1>
        <div class="dev">
            <div class="dev-img" align="center">
                <asp:Image ID="imgPerson" runat="server" /><br /><br />
                <h4 align="center">To know more<a href="https://governor.bih.nic.in/" target="_blank"> Click here</a></h4>
            </div> 
            <div class="dev-des" align="right">
                <h2 style="font-size:large;"><b>Hon'ble</b></h2>
                <h1 style="color:Red;"><b><asp:Label ID="lblName" runat="server" /></b></h1>
                <h2 style="color:blue;">Governer of Bihar</h2>
                <p>The Governor of Bihar is the Constitutional Head of the State of Bihar and exercises powers as defined in the Constitution of India. The Governor is also the ex-officio Chancellor of universities in the State.The Governor’s Secretariat provides secretarial assistance to the Governor in discharging his constitutional, ceremonial and other State responsibilities and his duties as the Chancellor of universities in the State.</p>
            </div>   
        </div>
    </div>
</asp:Content>
