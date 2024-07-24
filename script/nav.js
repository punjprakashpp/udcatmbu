function toggleResponsive() {
    var navbar = document.getElementById("navbar");
    var sidebar = document.getElementById("sidebar");

    if (navbar.classList.contains("responsive")) {
        closeResponsiveMenu(navbar, sidebar);
    } else {
        openResponsiveMenu(navbar, sidebar);
    }
}

function onScroll() {
    navbar.classList.add("fixed");
    if (window.scrollY < 100) {
        navbar.classList.remove("fixed");
    }
}

function openResponsiveMenu(navbar, sidebar) {
    navbar.classList.add("responsive");
    sidebar.classList.add('show');
}

function closeResponsiveMenu(navbar, sidebar) {
    navbar.classList.remove("responsive");
    sidebar.classList.remove('show');

    // Hide all subnav contents and remove active class from all subnav buttons
    document.querySelectorAll('.subnav-content').forEach(content => content.classList.remove('show'));
    document.querySelectorAll('.subnavbtn').forEach(btn => btn.classList.remove('active'));
}

function toggleDropdown(button) {
    var nextElement = button.nextElementSibling;

    // Hide all subnav contents and remove active class from all subnav buttons except the one being clicked
    document.querySelectorAll('.subnav-content').forEach(content => {
        if (content !== nextElement) content.classList.remove('show');
    });

    document.querySelectorAll('.subnavbtn').forEach(btn => {
        if (btn !== button) btn.classList.remove('active');
    });

    // Toggle the current subnav content
    nextElement.classList.toggle('show');
    button.classList.toggle('active');
}
