<%@ Page MasterPageFile="Root.master" AutoEventWireup="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Hostel Accommodation</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap');

        .cont {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            color: #333;
        }

            .cont .container {
                max-width: 800px;
                margin: auto;
                padding: 30px;
                background-color: #fff;
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
                border-radius: 10px;
                text-align: center;
            }

            .cont .title {
                font-size: 36px;
                color: #007bff;
                margin-bottom: 10px;
                font-weight: 700;
                letter-spacing: 1px;
            }

            .cont .tagline {
                font-size: 18px;
                color: #6c757d;
                margin-bottom: 30px;
                font-weight: 400;
            }

            .cont .image {
                width: 100%;
                max-width: 100%;
                height: auto;
                border-radius: 10px;
                transition: transform 0.3s, box-shadow 0.3s;
            }

                .cont .image:hover {
                    transform: scale(1.05);
                    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
                }

            .cont .note,
            .cont .facilities {
                text-align: left;
                margin-bottom: 20px;
            }

                .cont .note h3,
                .cont .facilities h3 {
                    color: #007bff;
                    margin-bottom: 10px;
                    font-weight: 700;
                }

                .cont .note ol {
                    margin-left: 20px;
                    color: #555;
                    font-size: 16px;
                }

                .cont .facilities ul {
                    list-style-type: none;
                    padding: 0;
                }

                .cont .note li,
                .cont .facilities li {
                    margin-bottom: 15px;
                    padding: 15px 20px;
                    background-color: #f8f9fa;
                    border: 1px solid #dee2e6;
                    border-radius: 8px;
                    transition: background-color 0.3s, transform 0.3s;
                    display: flex;
                    align-items: center;
                }

                    .cont .note li:hover,
                    .cont .facilities li:hover {
                        background-color: #e2e6ea;
                        transform: translateX(5px);
                    }

                    .cont .note li i,
                    .cont .facilities li i {
                        margin-right: 15px;
                        font-size: 20px;
                        color: #007bff;
                    }

            .cont hr {
                border: 0;
                border-top: 1px solid #dee2e6;
                margin: 20px 0;
            }

            .cont .button {
                display: inline-block;
                padding: 15px 30px;
                font-size: 16px;
                color: #fff;
                background: linear-gradient(135deg, #007bff 0%, #00a9ff 100%);
                border: none;
                border-radius: 30px;
                cursor: pointer;
                transition: background 0.3s, transform 0.3s;
                text-decoration: none;
            }

                .cont .button:hover {
                    background: linear-gradient(135deg, #0056b3 0%, #00a9ff 100%);
                    transform: translateY(-3px);
                }

                .cont .button:active {
                    transform: translateY(0);
                }

        @media (max-width: 768px) {
            .cont .container {
                padding: 20px;
            }

            .cont .title {
                font-size: 28px;
            }

            .cont .tagline {
                font-size: 16px;
            }

            .cont h3 {
                font-size: 22px;
            }

            .cont ol {
                font-size: 14px;
            }

            .cont li {
                font-size: 14px;
            }

            .cont .button {
                font-size: 14px;
                padding: 12px 24px;
            }
        }

        @media (max-width: 480px) {
            .cont .container {
                padding: 15px;
            }

            .cont .title {
                font-size: 24px;
            }

            .tagline {
                font-size: 14px;
            }

            .cont h3 {
                font-size: 20px;
            }

            .cont ol {
                font-size: 12px;
            }

            .cont li {
                font-size: 12px;
            }

            .cont .button {
                font-size: 12px;
                padding: 10px 20px;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="cont">
        <div class="container">
            <div class="title"><h2>University Hostel</h2></div>
            <div class="tagline">Your Home Away From Home</div>
            <img class="image" src="img/Dept/Boys Hostel.jpg" alt="Boys Hostel"><br />
            <br />
            <p align="justify">&nbsp;&nbsp;&nbsp;&nbsp;T.M. Bhagalpur University offers segregated hostel accommodations for both male and female students. Availability of seats is limited, with allocations made based on university regulations. The hostel charges amount to ₹3800 annually for a double bedroom. These accommodations serve as a conducive living environment for students, fostering a sense of community and providing essential amenities. With a focus on student welfare, the university ensures fair allocation procedures and maintains reasonable pricing, facilitating an enriching academic experience for residents.</p>
            <div class="note">
                <h3>Note:</h3>
                <ol>
                    <li>The allocation of hostel seats is done by the University upon submission of a prescribed application form available at the University Central Office.</li>
                    <li>Mess facilities are available in the hostels for a subsidized charge.</li>
                </ol>
            </div>
            <div class="facilities">
                <h3>Hostel Facilities & Policies</h3>
                <hr>
                <ul>
                    <li><i class="fas fa-smoking-ban"></i>Non-smoking environment</li>

                    <li><i class="fas fa-users"></i>Common room</li>
                    <li><i class="fas fa-praying-hands"></i>Prayer room</li>
                    <li><i class="fas fa-dumbbell"></i>Workout room</li>
                    <li><i class="fas fa-wifi"></i>Free Wi-Fi</li>
                    <li><i class="fas fa-bicycle"></i>Bicycle & bike parking</li>
                    <li><i class="fas fa-luggage-cart"></i>Luggage storage</li>
                    <li><i class="fas fa-water"></i>Pure (RO) and refrigerated water</li>
                    <li><i class="fas fa-chess"></i>Indoor games (e.g., chess, table tennis)</li>
                    <li><i class="fas fa-futbol"></i>Outdoor games (e.g., cricket, volleyball, football, badminton)</li>
                </ul>
            </div>
        </div>
        <div>
</asp:Content>

