// Get the button and navbar elements
let mybutton = document.getElementById("TopBtn");

window.addEventListener('scroll', scrollFunction);

function scrollFunction() {
    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
        mybutton.style.display = "block";
    } else {
        mybutton.style.display = "none";
    }
}

// When the user clicks on the button, scroll to the top of the document with smooth animation
function topFunction() {
    window.scrollTo({
        top: 0,
        behavior: "smooth"
    });
}
