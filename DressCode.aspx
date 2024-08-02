<%@ Page MasterPageFile="Website.master" AutoEventWireup="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Dress Code Policy</title>
    <link rel="stylesheet" type="text/css" href="style/campus.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content1" runat="Server">
    <div class="content">
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

