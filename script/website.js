document.addEventListener('DOMContentLoaded', () => {
    const navbar = document.getElementById("navbar");
    const sidebar = document.getElementById("sidebar");
    const topButton = document.getElementById("TopBtn");

    function toggleResponsive() {
        if (navbar.classList.contains("responsive")) {
            closeResponsiveMenu(navbar, sidebar);
        } else {
            openResponsiveMenu(navbar, sidebar);
        }
    }

    function openResponsiveMenu(navbar, sidebar) {
        navbar.classList.add("responsive");
        sidebar.classList.add('show');
    }

    function closeResponsiveMenu(navbar, sidebar) {
        navbar.classList.remove("responsive");
        sidebar.classList.remove('show');
        closeSubMenus();
    }

    function closeSubMenus() {
        document.querySelectorAll('.subnav-content').forEach(content => content.classList.remove('show'));
        document.querySelectorAll('.subnavbtn').forEach(btn => btn.classList.remove('active'));
    }

    function toggleDropdown(button) {
        const nextElement = button.nextElementSibling;

        document.querySelectorAll('.subnav-content').forEach(content => {
            if (content !== nextElement) content.classList.remove('show');
        });

        document.querySelectorAll('.subnavbtn').forEach(btn => {
            if (btn !== button) btn.classList.remove('active');
        });

        nextElement.classList.toggle('show');
        button.classList.toggle('active');
    }

    function navbarFunction() {
        navbar.classList.toggle("fixed", window.scrollY >= 150);
    }

    function scrollFunction() {
        if (window.scrollY > 20) {
            topButton.style.display = "block";
            topButton.style.background = "red";
        } else {
            topButton.style.display = "none";
        }
    }

    function topFunction() {
        window.scrollTo({ top: 0, behavior: "smooth" });
    }

    window.addEventListener('scroll', () => {
        navbarFunction();
        scrollFunction();
    });

    topButton.addEventListener('click', topFunction);
    document.querySelectorAll('.subnavbtn').forEach(button => {
        button.addEventListener('click', () => toggleDropdown(button));
    });
    document.querySelector('.navbar .icon').addEventListener('click', toggleResponsive);
    document.getElementById('close').addEventListener('click', toggleResponsive);
});
