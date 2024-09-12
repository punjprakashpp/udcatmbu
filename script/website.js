document.addEventListener('DOMContentLoaded', () => {
    const navbar = document.getElementById("navbar");
    const sidebar = document.getElementById("sidebar");
    const topButton = document.getElementById("TopBtn");

    // Toggles the responsive class on the navbar and sidebar
    function toggleResponsive() {
        if (navbar.classList.contains("responsive")) {
            closeResponsiveMenu();
        } else {
            openResponsiveMenu();
        }
    }

    // Opens the responsive menu
    function openResponsiveMenu() {
        navbar.classList.add("responsive");
        if (sidebar) {
            sidebar.classList.add('show');
        }
    }

    // Closes the responsive menu
    function closeResponsiveMenu() {
        navbar.classList.remove("responsive");
        if (sidebar) {
            sidebar.classList.remove('show');
        }
        closeSubMenus();
    }

    // Closes all submenus
    function closeSubMenus() {
        document.querySelectorAll('.subnav-content').forEach(content => content.classList.remove('show'));
        document.querySelectorAll('.subnavbtn').forEach(btn => btn.classList.remove('active'));
    }

    // Toggles a dropdown menu
    function toggleDropdown(button) {
        const nextElement = button.nextElementSibling;

        // Close other dropdowns
        document.querySelectorAll('.subnav-content').forEach(content => {
            if (content !== nextElement) content.classList.remove('show');
        });

        document.querySelectorAll('.subnavbtn').forEach(btn => {
            if (btn !== button) btn.classList.remove('active');
        });

        // Toggle the clicked dropdown
        nextElement.classList.toggle('show');
        button.classList.toggle('active');
    }

    // Makes the navbar sticky on scroll
    function navbarFunction() {
        navbar.classList.toggle("fixed", window.scrollY >= 150);
    }

    // Shows or hides the back-to-top button based on scroll position
    function scrollFunction() {
        if (window.scrollY > 20) {
            topButton.style.display = "block";
            topButton.style.background = "red";
        } else {
            topButton.style.display = "none";
        }
    }

    // Scrolls to the top of the page
    function topFunction() {
        window.scrollTo({ top: 0, behavior: "smooth" });
    }

    // Event listeners
    window.addEventListener('scroll', () => {
        navbarFunction();
        scrollFunction();
    });

    if (topButton) {
        topButton.addEventListener('click', topFunction);
    }

    document.querySelectorAll('.subnavbtn').forEach(button => {
        button.addEventListener('click', () => toggleDropdown(button));
    });

    const navbarIcon = document.querySelector('.navbar .icon');
    if (navbarIcon) {
        navbarIcon.addEventListener('click', toggleResponsive);
    }

    const closeButton = document.getElementById('close');
    if (closeButton) {
        closeButton.addEventListener('click', toggleResponsive);
    }
});
