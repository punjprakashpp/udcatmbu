<%@ Page Title="Campus Map" MasterPageFile="Website.master" AutoEventWireup="true" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="Server">
    <style>
        @media (max-width: 1024px) {
            iframe {
                width: 100%;
                height: 600px; /* Ensures the iframe is scrollable and adjusts well on smaller screens */
            }
        }

        iframe {
            width: 100%;
            height: 800px; /* Default height for larger screens */
            border: none;
        }

        .container {
            padding: 20px;
        }

        .my-h1 {
            font-size: 2rem;
            font-weight: bold;
            text-align: center;
            margin-bottom: 20px;
            color: #007bff; /* A blue color for headings */
        }
    </style>
</asp:Content>

<asp:Content ID="ContentBody" ContentPlaceHolderID="Content" runat="Server">
    <div class="container">
        <h1 class="my-h1">Campus Map</h1>
        <p class="text-center mb-4">Below is the interactive campus map. You can zoom in and navigate to view various campus buildings and facilities.</p>
        <iframe src="/pdfjs/web/viewer.html?file=/docs/Uploads/CampusMap.pdf" allowfullscreen webkitallowfullscreen></iframe>
    </div>
</asp:Content>
