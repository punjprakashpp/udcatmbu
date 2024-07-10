﻿<%@ Page Title="" Language="C#" MasterPageFile="Root.master" AutoEventWireup="true" CodeFile="SelectionProcedure.aspx.cs" Inherits="Acedemic_selection" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Admission Selection Process</title>
    <style>
        .cont {
            max-width: 1000px;
            margin: 0 auto;
            padding: 20px;
        }
        .cont h1, .cont h2 {
            color: #369;
        }
        .cont ul {
            list-style-type: none;
            padding: 0;
        }
        .cont ul li {
            margin-bottom: 10px;
        }
        .cont a {
            color: blue;
            text-decoration: none;
        }
        .cont a:hover {
            text-decoration: underline;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="cont">
        <h1 style="text-align: center; padding: 20px 0; background-color: #369; color: white; font-size: 1.8em; font-weight: bold; text-align: center; text-transform: uppercase; margin-bottom: 20px; border-top-left-radius: 10px; border-top-right-radius: 10px;">Progressive Guidelines for MCA Course Admission</h1><br />
        <ul>
            <li>
                <h2>Admission Guidelines for MCA Course</h2><br />
                <p>The University will conduct an Entrance Test for selecting candidates. This test will adhere to standardized procedures aligning with national specifications.</p>
                <ul>
                    <li>Entrance Test: The University will conduct an Entrance Test for selecting candidates. This test will adhere to standardized procedures aligning with national specifications.</li>
                    <li>Online Application Process: Candidates seeking admission must apply online by submitting the application form. The application fee is set at Rs. 750/- for students of this University and Rs. 850/- for students from other Universities.</li>
                    <li>Application Processing: Applications received will undergo processing based on specified qualifications and conditions.</li>
                    <li>All India Basis Entrance Test: The Entrance Test will be conducted on a nationwide scale to ensure fairness and inclusivity in the selection process.</li>
                    <li>Interview for Selected Candidates: Selected candidates will be invited for an interview as part of the final selection process. Admission decisions will be made strictly based on performance in the Entrance Test and interview.</li>
                    <li>University's Discretion: The University reserves the right to make decisions regarding all matters related to admission.</li>
                    <li>Single Master’s Course Registration: Candidates are prohibited from registering simultaneously for more than one Master’s Course offered by T. M. Bhagalpur University.</li>
                </ul>
            </li>
            <li>
                <h2>Reservation</h2><br />
                <p>Admission seat reservations will adhere to the rules set by the State Government or T. M. Bhagalpur University. Under no circumstances will the reservation percentage set by the State Government be exceeded.</p>
            </li>
        </ul>      
    </div>
</asp:Content>