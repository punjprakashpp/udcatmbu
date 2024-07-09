<%@ Page Title="" Language="C#" MasterPageFile="Root.master" AutoEventWireup="true" CodeFile="AntiRagging.aspx.cs" Inherits="pages_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<title>Anti-Ragging Policy</title>
<style>
        #cont {
            margin: 0;
            padding: 0;
            background-color: #f2f2f2;
            background-size: 50px 50px;
        }
        #cont .container {
            max-width: 800px;
            margin: 20px auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            animation: fadeIn 0.5s ease-in-out;
        }
        #cont img
        {
            width: 100%;
        }
        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }
        #cont h1 {
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
        #cont h2, h3 {
            color: #333;
            text-align: center;
            border-bottom: 2px solid #4CAF50;
            padding-bottom: 10px;
            margin-bottom: 20px;
            text-transform: uppercase;
        }
        #cont p {
            color: #666;
            line-height: 1.6;
            margin-bottom: 20px;
        }
        #cont .important {
            color: #c00;
            font-weight: bold;
        }
        #cont .contact-info {
            margin-top: 20px;
            text-align: center;
        }
        #cont .contact-info p {
            margin: 5px 0;
        }
        #cont .contact-info p span {
            font-weight: bold;
        }
        #cont .policy-list {
            margin-top: 20px;
            text-align: justify;
        }
        #cont .policy-list ul {
            list-style-type: disc;
            margin-left: 20px;
        }
        /* Button effect */
        #cont .button {
            display: inline-block;
            background-color: #4CAF50;
            border: none;
            color: white;
            padding: 12px 24px;
            text-align: center;
            text-decoration: none;
            font-size: 16px;
            margin: 20px auto;
            transition-duration: 0.4s;
            cursor: pointer;
            border-radius: 8px;
            display: block;
            width: 50%;
            margin-left: auto;
            margin-right: auto;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        #cont .button:hover {
            background-color: #45a049;
        }
        /* Image hover effect */
        #cont .policy-list img {
            max-width: 100%;
            height: auto;
            border-radius: 8px;
            transition: transform 0.3s ease-in-out;
            display: block;
            margin-left: auto;
            margin-right: auto;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        #cont .policy-list img:hover {
            
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="cont">
<div class="container">
    <h1>Anti-Ragging Policy</h1>
    <p align="center" class="important">Ragging is strictly prohibited in this institution.</p>
    <img src="img/other/ragg.jpeg" alt="Measures Taken" /><br /><br />
    <p>
        We believe in providing a safe and conducive environment for all our students. Ragging in any form
        is a violation of human rights and dignity. Our institution has a zero-tolerance policy towards ragging.
    </p>
    <h2>What Constitutes Ragging?</h2>
    <p>
        Ragging includes any conduct by any student or students whether by words spoken or written or by an
        act which has the effect of teasing, treating or handling with rudeness a fresher or any other student.
        Indulging in rowdy or indisciplined activities which causes or is likely to cause annoyance, hardship,
        physical or psychological harm or to raise fear or apprehension thereof in a fresher or any other student.
    </p>
    <h2>Penalties for Ragging</h2>
    <p>
        Any student found guilty of ragging or abetting ragging is liable to be punished appropriately which
        may include expulsion from the institution, suspension from the institution or classes for a limited period,
        fine with a public apology, and withholding of scholarships or other benefits.
    </p>
    <h2>Measures Taken by the Institution</h2>
    <div class="policy-list">
        <h3>Our institution takes the following measures to prevent ragging:</h3>
        <ul>
            <li>Orientation programs for new students to raise awareness about the anti-ragging policy.</li>
            <li>Regular sensitization workshops and seminars for students and staff.</li>
            <li>Formation of Anti-Ragging Committee and Anti-Ragging Squad comprising faculty members, administrative staff, and student representatives.</li>
            <li>Regular monitoring of campus premises through CCTV cameras.</li>
            <li>Providing counseling and support services to victims of ragging.</li>
            <li>Encouraging students to report ragging incidents without fear of retaliation.</li>
            <li>Strict enforcement of disciplinary actions against perpetrators.</li>
        </ul>
        
    </div>
    <h2>Reporting Ragging</h2>
    <p>
        Any student who faces ragging or witnesses any ragging activity is encouraged to report it immediately
        to the Anti-Ragging Committee or the Anti-Ragging Squad. Confidentiality of the complainant will be maintained.
    </p>
    <div class="contact-info">
        <h3>Contact Information:</h3>
        <p><span>Anti-Ragging Helpline:</span> 1800-180-5522</p>
        <p><span>Email:</span> helpline@antiragging.in</p>
        <p><span>Address:</span> UDCA Department TMBU</p>
    </div>
</div>
</div>
</asp:Content>

