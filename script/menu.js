function toggleResponsive() {
    var navbar = document.getElementById("navbar");
    var subnavContents = document.querySelectorAll('.subnav-content');
    var subnavButtons = document.querySelectorAll('.subnavbtn');

    if (navbar.className === "navbar") {
        navbar.className += " responsive";
    } else {
        navbar.className = "navbar";

        // Hide all subnav contents when closing the responsive menu
        subnavContents.forEach(content => {
            content.classList.remove('show');
        });

        // Remove active class from all subnav buttons
        subnavButtons.forEach(btn => {
            btn.classList.remove('active');
        });
    }
}

function toggleDropdown(button) {
    var subnavContents = document.querySelectorAll('.subnav-content');
    var subnavButtons = document.querySelectorAll('.subnavbtn');
    var nextElement = button.nextElementSibling;

    // Hide all subnav contents except the one being clicked
    subnavContents.forEach(content => {
        if (content !== nextElement) {
            content.classList.remove('show');
        }
    });

    // Remove active class from all subnav buttons except the one being clicked
    subnavButtons.forEach(btn => {
        if (btn !== button) {
            btn.classList.remove('active');
        }
    });

    // Toggle the current subnav content
    if (nextElement.classList.contains('show')) {
        nextElement.classList.remove('show');
        button.classList.remove('active');
    } else {
        nextElement.classList.add('show'); // Adjust max height as needed
        button.classList.add('active');
    }
}