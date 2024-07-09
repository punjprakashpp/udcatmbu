<%@ Page Title="" Language="C#" MasterPageFile="Root.master" AutoEventWireup="true" CodeFile="CentralLibrary.aspx.cs" Inherits="pages_Library" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Central Library</title>
    <style>
        .cont p
        {
            font-size: 16px;
            color: black;  /* Adjust text color as needed */
            text-shadow: none;  /* Remove default shadow if needed */
            transition: font-size 0.2s ease, text-shadow 0.2s ease;  /* Adjust transition speed and type */
        }
        .cont p:hover
        {
            font-size: 1.125em;  /* Increase font size on hover (adjust percentage as needed) */
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5);  /* Adjust shadow offset, blur, and color */
        }
    </style>
    <style>
        .cont {
            line-height: 1.6;
            max-width: 800px;
            margin: 20px auto;
            padding: 0 20px;
        }
        .cont .header {
            font-size: 24px;
            color: #00a9ff;
            margin-bottom: 20px;
            text-align: center; /* Centering the header */
        }
        
        .cont .title {
                color: #007bff;
                margin-bottom: 10px;
                font-weight: 700;
                letter-spacing: 1px;
            }
        .cont .library-image {
            display: block;
            margin: 0 auto 20px; /* Centering the image */
            max-width: 100%;
            height: auto;
        }
        .cont .description {
            text-align: justify;
            margin-bottom: 20px;
        }
        .cont .box {
            border: 2px solid #ccc;
            padding: 10px;
            margin-bottom: 20px;
        }
        .cont .timing, .collection {
            color: Black;
            font-size: 15px;
            font-weight: bold;
        }
        .cont .timing b, .collection b {
            color: #00a9ff;
        }
        .cont .mission {
            font-size: 18px;
            font-weight: bold;
            color: #00a9ff;
            margin-bottom: 20px;
        }
        .cont ol {
            padding-left: 20px;
        }
        .cont li {
            margin-bottom: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="cont">
        <div class="title header"><h2>Central Library </h2></div>
        <img class="library-image" src="img/facilities/central library.jpg" alt="Central Library">
        <p class="description">
            The <span style="color: #ff0000;">CENTRAL LIBRARY ,</span>  designated as the <b>APEX BODY</b> of Tilka Manjhi Bhagalpur University's library system, serves as the cornerstone of academic resources. It stands as the primary repository for all publications affiliated with the institution, housing an extensive collection of books, journals, and printed materials. Beyond its comprehensive offerings, the library boasts a collection of rare documents, carefully preserved for posterity. Situated amidst a picturesque 4-acre expanse within the University's administrative campus, it not only collects and disseminates printed material but also serves as a hub for scholarly engagement and preservation efforts.
        </p>
        <div class="box timing">
            <p>
                <b>Library Timing:</b> The Central Library of TILKA MANJHI BHAGALPUR UNIVERSITY is kept <span style="color: red;">open from 10:30 am to 5 pm</span> on all the week days and weekend days, except university holidays.
            </p>
        </div>
        <div class="dot box collection">
            <p>
                <b>Library Collection (print and e-resources):</b> The Library is having a collection of more than 1.5 Lakh documents, subscribing about 300 print journals and several abstracting databases. The collection consists of Books, Back-volumes of Periodicals, Theses, Conference Proceedings, Standards, Reports, Databases, and Audiovisual materials.
            </p>
        </div>
        <p class="description">
            With the developments in computers, microelectronics, and communication technologies, the behavioral characteristics of the information seekers have been changing rapidly and the library is trying its best to adapt with the technological advancement. For the last six decades, the library has been the lifeline of the academic activities of the University. It has been catering to the needs of the sixty thousand students of undergraduates, postgraduates, research scholar, two hundred faculty members and more than thousand staff members of the 36 university departments, 29 Constituent Colleges, 04 Self Financing Courses and 05 research facilities of the University.
        </p>
        <h2 class="mission">Mission of the Central Library, Tilka Manjhi Bhagalpur University, Bhagalpur</h2>
        <ol>
            <li>Procuring and safeguarding all noteworthy printed materials produced by the university, excluding ephemeral content.</li>
            <li>Curating a collection of printed materials relevant to academic pursuits, regardless of their place of publication, and extending this mandate further.</li>
            <li>Acquiring and preserving foreign materials essential for the university's academic needs.</li>
            <li>Providing bibliographical and document services for both contemporary and archival materials, encompassing a wide spectrum of general and specialized subjects.</li>
            <li>Serving as a central hub for disseminating comprehensive and accurate information, offering robust referral services.</li>
            <li>Expanding initiatives to digitize and archive materials for enhanced accessibility and long-term preservation.</li>
            <li>Collaborating with academic departments and research centers to develop tailored collections and resources that support evolving scholarly needs.</li>
            <li>Facilitating interdisciplinary collaboration and knowledge exchange by curating multi-disciplinary resources and fostering a culture of interdisciplinary inquiry.</li>
        </ol>
    </div>
</asp:Content>

