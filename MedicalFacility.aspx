<%@ Page Title="Medical Facility" MasterPageFile="Site.master" AutoEventWireup="true" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="Content/pages.css">
</asp:Content>

<asp:Content ID="ContentBody" ContentPlaceHolderID="Content" runat="Server">
    <section class="py-4 bg-light">
        <div class="container contain bg-white rounded shadow-sm p-4">
            <!-- Title Section -->
            <div class="text-center text-primary p-4 rounded">
                <h1>Health Center</h1>
            </div>

            <!-- Health Center Image Section -->
            <div class="text-center mt-4 mb-4">
                <img class="img-fluid rounded shadow-sm" src="img/Dept/Health Centre.jpg" alt="Health Center Image">
            </div>

            <!-- Health Center Information Table -->
            <table class="table table-bordered mb-4">
                <thead>
                    <tr>
                        <th colspan="2" class="text-center">Health Center Information</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Doctor</td>
                        <td>---</td>
                    </tr>
                    <tr>
                        <td>Working Hours</td>
                        <td>10:30 AM - 5:00 PM</td>
                    </tr>
                    <tr>
                        <td>Location</td>
                        <td>Opposite of University Department of Computer Applications</td>
                    </tr>
                </tbody>
            </table>

            <!-- Health Center Description -->
            <p>The University Health Center at Tilka Manjhi Bhagalpur University is primarily funded by the institution itself and caters exclusively to currently enrolled students. We do not issue excuses for missed classes due to illness or injury.</p>
            <p>However, students facing serious illness or significant disabilities can request medical documentation to be placed in their records, accessible to Academic Advising. Withdrawal from classes or the university itself must be requested following university guidelines.</p>
            <p>Encouraging self-management of minor illnesses and injuries is a key aspect of our approach. Many common ailments can be managed without medical intervention, and learning to handle these situations independently fosters valuable coping skills for both academic and professional life.</p>
            <p>It's important to recognize that each individual's experience with illness varies, and our staff cannot predict recovery times or assess the impact of illness on academic performance. Conversations between students and faculty are crucial for finding ways to navigate academic challenges during illness.</p>
            <p>While we provide health tips and resources for a healthier lifestyle, it's essential to understand that the information offered here is general. It cannot replace personalized healthcare or human services. For medical diagnosis or treatment, it's always best to consult with a healthcare professional at the Health Center.</p>

            <!-- Contact Information Section -->
            <p>
                For Information / Emergency services, please contact the Health Centre Reception Desk at 
            <a href="tel:+919934873798" class="text-danger">telephone No. 9934873798</a> or 
            <a href="tel:+918292754529" class="text-danger">telephone No. 8292754529</a>.
            </p>

            <!-- Emergency Contacts Section -->
            <h3 class="text-center text-primary mt-5">Important Contacts in Emergency</h3>
            <div class="table-responsive">
                <table class="table table-striped mt-3">
                    <thead>
                        <tr>
                            <th>Health Center</th>
                            <th>Type/Specialist</th>
                            <th>Contacts</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Bhagalpur Sadar Hospital</td>
                            <td><a href="https://maps.app.goo.gl/XHy8qJe7DUUjM5127">Hospital (Government)</a></td>
                            <td><a href="tel:+916412422052">(+91)-641-2422052</a>, <a href="tel:+6412400098">(+91)-641-2400098</a></td>
                        </tr>
                        <tr>
                            <td>Life Line</td>
                            <td><a href="https://maps.app.goo.gl/3QWRmX9ucpao4z9C9">Hospital (Private)</a></td>
                            <td><a href="tel:+916412406022">(+91)-641-2406022</a>, <a href="tel:+6412300481">(+91)-641-2300481</a></td>
                        </tr>
                        <tr>
                            <td>The Appolo Clinic</td>
                            <td><a href="https://maps.app.goo.gl/Ro5rfuUiwh3EWPGP9">Hospital (Private)</a></td>
                            <td><a href="tel:+916412409548">(+91)-641-2409548</a>, <a href="tel:+9934076200">(+91)-9934076200</a></td>
                        </tr>
                        <tr>
                            <td>Garab Nawaz (Dr. Arun Kr. Agarwal)</td>
                            <td><a href="https://maps.app.goo.gl/KP7aBnVdMWdFa96w5">Hospital (Private)</a></td>
                            <td><a href="tel:+916412422436">(+91)-641-2422436</a></td>
                        </tr>
                        <tr>
                            <td>ARC Hospital</td>
                            <td><a href="https://maps.app.goo.gl/1GGPu44pi2XHCSdo9">Hospital (Private)</a></td>
                            <td><a href="tel:+916412610001">(+91)-641-2610001</a>, <a href="tel:+8757205555">(+91)-8757205555</a></td>
                        </tr>
                        <tr>
                            <td>Healing Touch (Dr. Sanjay Singh / Dr. Partibha Singh)</td>
                            <td><a href="https://maps.app.goo.gl/3xMTdsGqAo7JWFUC8">Hospital (Private)</a></td>
                            <td><a href="tel:+916412400587">(+91)-641-2400587</a></td>
                        </tr>
                        <tr>
                            <td>Dr. C.S. Shah</td>
                            <td><a href="https://maps.app.goo.gl/nBG2vpTEDhUZBhcD7">Eye</a></td>
                            <td><a href="tel:+916412401234">(+91)-641-2401234</a></td>
                        </tr>
                        <tr>
                            <td>Dr. Sanjay Sharma</td>
                            <td><a href="https://maps.app.goo.gl/3ExPUhfHcnYaz6uM6">Eye</a></td>
                            <td><a href="tel:+916412405673">(+91)-641-2405673</a></td>
                        </tr>
                        <tr>
                            <td>Dr. Santanu Kumar Ghosh</td>
                            <td><a href="https://maps.app.goo.gl/dLMaP3WetgTHnXVv9">General Physician</a></td>
                            <td><a href="tel:+919431213432">(+91)-9431213432</a></td>
                        </tr>
                        <tr>
                            <td>Dr. Rajeev Shina</td>
                            <td><a href="https://maps.app.goo.gl/3FidXPWCsBRRoKJs7">Physician / Gastroenterologist</a></td>
                            <td><a href="tel:+918544313639">(+91)-8544313639</a></td>
                        </tr>
                        <tr>
                            <td>Dr. Arun Kr. Shina</td>
                            <td><a href="https://maps.app.goo.gl/FM4SXuFK5m6wripr5">Brain</a></td>
                            <td><a href="tel:+916412403709">(+91)-641-2403709</a></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </section>
</asp:Content>
