<%@ Page Title="Campus Map" MasterPageFile="Site.master" AutoEventWireup="true" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="Server">
    <style>
        @media (max-width: 1024px) {
            iframe {
                width: 100%;
                height: 600px; /* Ensures the iframe is scrollable and adjusts well on smaller screens */
            }
        }

        @media (max-width: 768px) {
            iframe {
                width: 100%;
                height: 400px; /* Ensures the iframe is scrollable and adjusts well on smaller screens */
            }
        }

        iframe {
            width: 100%;
            height: 800px; /* Default height for larger screens */
            border: none;
        }
    </style>
</asp:Content>

<asp:Content ID="ContentBody" ContentPlaceHolderID="Content" runat="Server">
    <section class="py-5 bg-light">
        <div class="container bg-white rounded shadow-sm py-5 px-4">
            <h1 class="text-center text-primary">Campus Map</h1>
            <p class="text-center mb-4">Below is the interactive campus map. You can zoom in and navigate to view various campus buildings and facilities.</p>
            <iframe src="/pdfjs/web/viewer.html?file=/docs/Uploads/CampusMap.pdf" allowfullscreen webkitallowfullscreen></iframe>
        </div>
    </section>
</asp:Content>
