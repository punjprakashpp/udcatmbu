<%@ Page Title="" Language="C#" MasterPageFile="~/pages/Pages.master" AutoEventWireup="true" CodeFile="ComputerCenter.aspx.cs" Inherits="pages_ComputerCenter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" type="text/css" href="style/pages.css">
    <title>About Computer Centre</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0;
        }
        .cont {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            border: 2px solid #369;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            animation: fadeIn 1s ease;
        }
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        .title {
            text-align: center;
            font-size: 32px;
            color: #369;
            margin-bottom: 20px;
            animation: slideInDown 1s ease;
        }
        @keyframes slideInDown {
            from {
                transform: translateY(-50px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }
        .image {
            display: block;
            margin: 0 auto;
            width: 100%;
            max-width: 600px;
            height: auto;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            animation: zoomIn 1s ease;
            transition: transform 0.3s ease-in-out;
        }
        .image:hover {
            transform: scale(1.05);
        }
        @keyframes zoomIn {
            from {
                transform: scale(0.9);
                opacity: 0;
            }
            to {
                transform: scale(1);
                opacity: 1;
            }
        }
        .content {
            text-align: justify;
            font-size: 16px;
            line-height: 1.6;
            margin-top: 20px;
            animation: slideInLeft 1s ease;
        }
        @keyframes slideInLeft {
            from {
                transform: translateX(-50px);
                opacity: 0;
            }
            to {
                transform: translateX(0);
                opacity: 1;
            }
        }
        .cont p {
            margin-bottom: 20px;
            animation: fadeInUp 1s ease;
        }
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        /* Additional effect for paragraphs */
        .content:hover {
            color: #FF0000;
            transition: color 0.1s;
        }

        /* Additional effect for title */
        .title:hover {
            color: #FF0000; /* Change color on hover */
            text-decoration: underline; /* Add underline on hover */
            transition: color 0.1s, text-decoration 0.1s; /* Add transition for smoother effect */
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="cont">
        <h1 class="title">About Computer Centre</h1>
        <img src="../img/Dept/AdminBuilding.jpg" alt="Computer Centre" class="image">
        <p class="content">The Computer Centre at T. M. Bhagalpur University, Bhagalpur, stands as a beacon of technological advancement and educational empowerment within the region. Established in 1988 under a generous financial grant by the University Grants Commission (UGC), New Delhi, vide letter no. F60-22/86(T) dated February 20, 1986, this institution has played a pivotal role in fostering computer literacy, facilitating research, and providing essential training to students, faculty, and staff alike.</p>
        <p class="content">From its inception, the Computer Centre was envisioned not only as a hub for introducing computers to the academic environment but also as a catalyst for transformative change in education and research methodologies. Situated east of the eastern gate of T. N. B. College campus, its strategic location has enabled seamless integration with the university's academic ecosystem.</p>
        <p class="content">Over the years, the Computer Centre has evolved into a Nodal Centre for computer training and education, reflecting the broader technological landscape of the region. Its journey mirrors the tireless efforts of individuals committed to bridging the digital divide and empowering communities through knowledge dissemination.</p>
        <p class="content">In our exploration, we will delve into various facets of the Computer Centre, including its infrastructure, programs, achievements, challenges, and future prospects. Through interviews with key stakeholders, archival research, and analysis of relevant data, we aim to provide a comprehensive understanding of this institution and its impact on the academic, social, and economic fabric of Bhagalpur and its surrounding areas.</p>
        <p class="content">Structured to provide a holistic view, our narrative will begin with an examination of the historical context and mission of the Computer Centre, leading into its current initiatives and future aspirations. Key milestones, transformative moments, and the contributions of individuals instrumental in shaping its trajectory will be highlighted.</p>
        <p class="content">Furthermore, we will explore the broader implications of the Computer Centre's work, addressing societal challenges, fostering innovation, and preparing the next generation of digital citizens. Through case studies, testimonials, and empirical evidence, we will assess the effectiveness of its programs and initiatives, showcasing tangible outcomes and intangible benefits for stakeholders.</p>
        <p class="content">Our exploration will extend beyond the confines of the Computer Centre itself, examining the ecosystem of partnerships, collaborations, and networks that have propelled its success. Government agencies, industry partners, educational institutions, and non-profit organizations have all contributed to its growth, forming synergies and alliances that expand its reach.</p>
        <p class="content">Acknowledging the complexities inherent in the intersection of technology and education, we will also explore the hurdles faced by the Computer Centre, from funding constraints to infrastructural challenges. Strategies employed to overcome these obstacles will be examined, offering insights into resilience and adaptability in the face of evolving educational paradigms and technological landscapes.</p>
        <p class="content">In conclusion, the story of the Computer Centre at T. M. Bhagalpur University exemplifies the power of vision, perseverance, and collaboration in driving meaningful change. As we celebrate its legacy, we are reminded of the transformative potential of technology and the enduring importance of education as a catalyst for progress. In a digital age, institutions like the Computer Centre serve as beacons of knowledge, innovation, and empowerment, shaping the future of education and society.</p>
    </div>
</asp:Content>

