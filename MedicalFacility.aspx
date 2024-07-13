<%@ Page MasterPageFile="Root.master" AutoEventWireup="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Health Center</title>
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
            color: #333;
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }
        .cont .heading {
            font-size: 35px;
            color: #369;
            margin-bottom: 20px;
            text-align: center; /* Centering the heading */
        }
        .cont .info-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 30px;
        }
        .cont .info-table th, .info-table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }
        .cont .info-table th {
            background-color: #f2f2f2;
            font-weight: bold;
        }
        .cont .important-contacts th {
            background-color: #00a9ff;
            color: #fff;
        }
        .cont .important-contacts td {
            background-color: #f2f2f2;
        }
        .cont .important-contacts td:nth-child(odd) {
            font-weight: bold;
        }
        .cont .important-contacts td:last-child {
            font-weight: normal;
        }
        .cont .emergency-msg {
            font-size: 18px;
            color: #00AEff;
            margin-bottom: 10px;
            text-align: center; /* Centering the emergency message */
        }
        .cont .quote {
            font-size: 25px;
            text-align: center;
            color: green;
            font-weight: bold;
            margin-top: 30px;
        }
        @media(max-width:880px)
        {
            #extra{display:none;}
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="cont">
        <h1 style="text-align: center; padding: 20px 0; background-color: #369; color: white; font-size: 1.8em; font-weight: bold; text-align: center; text-transform: uppercase; margin-bottom: 20px; border-top-left-radius: 10px; border-top-right-radius: 10px;">Health Center </h1>
        <img src="img/Dept/Health Centre.jpg" alt="Health Center Image" style="max-width: 100%; height: auto; margin-bottom: 20px;">
        
        <table class="info-table">
            <tr><th colspan="2">Health Center Information.</th></tr>
            <tr><td>Doctor</td><td>---</td></tr>
            <tr><td>Working Hours</td><td>10:30 AM - 5:00 PM</td></tr>
            <tr><td>Location</td><td>Opposite of University Department of Computer Applications</td></tr>
        </table>
        
         <p>The University Health Center at Tilka Manjhi Bhagalpur University is primarily funded by the institution itself and caters exclusively to currently enrolled students. We do not issue excuses for missed classes due to illness or injury.</p>

        <p>However, students facing serious illness or significant disabilities can request medical documentation to be placed in their records, accessible to Academic Advising. Withdrawal from classes or the university itself must be requested following university guidelines.</p>

        <p>Encouraging self-management of minor illnesses and injuries is a key aspect of our approach. Many common ailments can be managed without medical intervention, and learning to handle these situations independently fosters valuable coping skills for both academic and professional life.</p>

       <p> It's important to recognize that each individual's experience with illness varies, and our staff cannot predict recovery times or assess the impact of illness on academic performance. Conversations between students and faculty are crucial for finding ways to navigate academic challenges during illness.</p>

        <p> While we provide health tips and resources for a healthier lifestyle, it's essential to understand that the information offered here is general. It cannot replace personalized healthcare or human services. For medical diagnosis or treatment, it's always best to consult with a healthcare professional at the Health Center.</p>
        
        <p class="emergency-msg">For Information / Emergency services, please contact Health Centre Reception Desk at <a href="tel:+919934873798" style="color: #ff0000;">telephone No. 9934873798</a> or <a href="tel:+918292754529" style="color: #ff0000;">telephone No. 8292754529</a></p>
        <div id="extra">
        <h3 class="heading">Important Contacts in Emergency</h3>
        <table class="info-table important-contacts">
            <tr>
                <th>Health Center</th>
                <th>Type/Specialist</th>
                <th>Contacts</th>
            </tr>
            <tr><td>Bhagalpur Sadar Hospital</td><td><a href="https://maps.app.goo.gl/XHy8qJe7DUUjM5127">Hospital (Government)</a></td><td><a href="tel:+916412422052">(+91)-641-2422052</a>,  <a href="tel:+6412400098">(+91)-641-2400098</a></td></tr>
            <tr><td>Life Line</td><td><a href="https://maps.app.goo.gl/3QWRmX9ucpao4z9C9">Hospital (private)</a></td><td><a href="tel:+916412406022">(+91)-641-2406022</a>,  <a href="tel:+6412300481">(+91)-641-2300481</a></td></tr>
            <tr><td>The Appolo Clinic</td><td><a href="https://maps.app.goo.gl/Ro5rfuUiwh3EWPGP9">Hospital (private)</a></td><td><a href="tel:+916412409548">(+91)-641-2409548</a>, <a href="tel:+9934076200">(+91)-9934076200</a></td></tr>
            <tr><td>Garab Nawaz (Dr. Arun kr. Agarwal)</td><td><a href="https://maps.app.goo.gl/KP7aBnVdMWdFa96w5">Hospital (private)</a></td><td><a href="tel:+916412422436">(+91)-641-2422436</a></td></tr>
            <tr><td>ARC Hospital</td><td><a href="https://maps.app.goo.gl/1GGPu44pi2XHCSdo9">Hospital (private)</a></td><td><a href="tel:+916412610001">(+91)-641-2610001</a>, <a href="tel:+8757205555">(+91)-8757205555</a></td></tr>
            <tr><td>Healing Touch (Dr. Sanjay Singh/ Dr. Partibha Singh)</td><td><a href="https://maps.app.goo.gl/3xMTdsGqAo7JWFUC8">Hospital (private)</a></td><td><a href="tel:+916412400587">(+91)-641-2400587</a></td></tr>
            <tr><td>Dr. C.S. Shah</td><td><a href="https://maps.app.goo.gl/nBG2vpTEDhUZBhcD7">Eye</a></td><td><a href="tel:+916412401234">(+91)-641-2401234</a></td></tr>
            <tr><td>Dr.Sanjay Sharma</td><td><a href="https://maps.app.goo.gl/3ExPUhfHcnYaz6uM6">Eye</a></td><td><a href="tel:+916412405673">(+91)-641-2405673</a></td></tr>
            <tr><td>Dr.Santanu Kumar Ghosh</td><td><a href="https://maps.app.goo.gl/dLMaP3WetgTHnXVv9">General Physician</a></td><td><a href="tel:+919431213432">(+91)-9431213432</a></td></tr>
            <tr><td>Dr.Rajeev Shina</td><td><a href="https://maps.app.goo.gl/3FidXPWCsBRRoKJs7">Physician/Gastilogist</a></td><td><a href="tel:+918544313639">(+91)-8544313639</a></td></tr>
            <tr><td>Dr. Arun Kr. Shina</td><td><a href="https://maps.app.goo.gl/FM4SXuFK5m6wripr5">Brain</a></td><td><a href="tel:+916412403709">(+91)-641-2403709</a></td></tr>
        </table>
        </div>
        <p class="quote">"The greatest wealth is health."</p>
    </div>
</asp:Content>

