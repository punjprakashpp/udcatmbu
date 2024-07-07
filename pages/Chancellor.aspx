<%@ Page Title="" Language="C#" MasterPageFile="Pages.master" AutoEventWireup="true" CodeFile="Chancellor.aspx.cs" Inherits="pages_Chancellor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>About Chancellor</title>
    <link rel="stylesheet" type="text/css" href="style/pages.css">
    <link rel="stylesheet" type="text/css" href="style/adm.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="cont" align="center">
        <h1 class="title">Governer of Bihar</h1>
        <div class="dev">
            <div class="dev-img" align="left">
                <asp:Image ID="imgPerson" runat="server" /><br /><br />
                <h4 align="justify">To know more<a href="https://governor.bih.nic.in/" target="_blank"> Click here</a></h4>
            </div> 
            <div class="dev-des" align="right">
                <h2 style="font-size:large;"><b>Hon'ble</b></h2>
                <h1 style="color:Red; text-align:left;"><b><asp:Label ID="lblName" runat="server" /></b></h1>
                <h2 style="font-size:large; color:blue;">Chancellor of TMBU</h2>
                <p>The Governor of Bihar is the Constitutional Head of the State of Bihar and exercises powers as defined in the Constitution of India. The Governor is also the ex-officio Chancellor of universities in the State.The Governor’s Secretariat provides secretarial assistance to the Governor in discharging his constitutional, ceremonial and other State responsibilities and his duties as the Chancellor of universities in the State.</p>
            </div>   
        </div>
    </div>
</asp:Content>

