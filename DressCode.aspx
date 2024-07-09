<%@ Page Title="" Language="C#" MasterPageFile="Root.master" AutoEventWireup="true" CodeFile="DressCode.aspx.cs" Inherits="pages_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Dress Code Policy</title>
    <style>
        .cont {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f2f2f2;
        }
        .cont .container {
            max-width: 800px;
            margin: 20px auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .cont h1 {
            text-align: center;
            color: #fff;
            font-size: 36px;
            font-weight: bold;
            padding: 20px;
            background-image: linear-gradient(to right, #4A90E2, #36D1DC);
            border-radius: 10px 10px 0 0;
            margin-top: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .cont  h2, h3 {
            color: #333;
            text-align: center;
            border-bottom: 2px solid #4CAF50;
            padding-bottom: 10px;
            margin-bottom: 20px;
            text-transform: uppercase;
        }
        .cont p {
            color: #666;
            line-height: 1.6;
            margin-bottom: 20px;
        }
        .cont .list-item {
            margin-bottom: 10px;
        }
        .cont .list-item strong {
            color: #4CAF50;
        }
        .cont .footer {
            text-align: center;
            margin-top: 40px;
            color: #999;
        }
        /* Dress Code Colors */
        .cont .grey-pants, .grey-salwar {
            color: #000;
            font-weight: bold;
        }
        .cont .white-shirt, .white-pajama {
            color: #000;
            font-weight: bold;
        }
        .cont .black-shoes {
            color: #000;
            font-weight: bold;
        }
        .cont .image-section {
            text-align: center;
            margin-bottom: 30px;
        }
        .cont .image-section img {
            max-width: 100%;
            height: auto;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="cont">
<div class="container">
    <h1>Dress Code Policy</h1>
    <p>In order to maintain a professional and respectful environment, all students are required to adhere to the following dress code:</p>

    <h2>General Guidelines</h2>
    <ul>
        <li class="list-item">Clothing should be clean, neat, and in good condition.</li>
        <li class="list-item">For boys: Clothing should consist of <span class="grey-pants">grey pants</span>, <span class="white-shirt">white shirt</span>, and <span class="black-shoes">black shoes</span>.</li>
        <li class="list-item">For girls: Clothing should consist of <span class="grey-salwar">grey salwar</span>, <span class="white-pajama">white pajama</span>, and <span class="black-shoes">black shoes</span>.</li>
        <li class="list-item">Offensive slogans or images on clothing are not permitted.</li>
    </ul>

    <h2>Specific Requirements</h2>
    <p>Depending on the context, specific dress code requirements may apply:</p>
    <ul>
        <li class="list-item"><strong>Business Attire:</strong> Required for presentations, meetings, and formal events.</li>
        <li class="list-item"><strong>Casual Attire:</strong> Acceptable for day-to-day activities, but should still be presentable.</li>
        <li class="list-item"><strong>Sports Attire:</strong> Allowed for sports activities only, not suitable for other occasions.</li>
    </ul>

    <h2></h2>
    <div class="image-section">
        <h3>Examples of Acceptable Dress Code:</h3>
        <img src="img/other/dress.jpg" alt="Acceptable Dress Code ">
    </div>

    <p>Please ensure that you are aware of any specific dress code requirements for your classes, events, or activities.</p>
</div>
</div>
</asp:Content>

