const slides = document.querySelectorAll('.slide');
const transitionEffects = [
    'fade', 'slide-in', 'grow', 'rotate', 'flip', 'zoom',
    'slide-up', 'spin', 'bounce', 'fade-slide',
    'flip-vertical', 'slide-down', 'zoom-out',
    'flip-horizontal', 'slide-diagonal', 'rotate-zoom', 'bounce-horizontal'
];

let currentSlide = 0;
let autoSlideInterval;

// Function to show a slide with a transition effect
function showSlide(index, auto = true) {
    // Remove the active class and effect from the current slide
    slides[currentSlide].classList.remove('active');

    // Update the current slide index
    currentSlide = index;

    // Randomly select a transition effect
    const randomEffect = transitionEffects[Math.floor(Math.random() * transitionEffects.length)];

    // Apply the random effect and activate the new slide
    slides[currentSlide].classList.add(randomEffect, 'active');

    // Remove the effect class after the transition ends
    setTimeout(() => {
        slides[currentSlide].classList.remove(randomEffect);
    }, 2000);

    // Automatically move to the next slide if auto is true
    if (auto) {
        resetAutoSlide(); // Reset the automatic slide interval
    }
}

    // Function to move to the next slide
    function showNextSlide(auto = true) {
        const nextSlideIndex = (currentSlide + 1) % slides.length;
        showSlide(nextSlideIndex, auto);
    }

        // Function to manually go to the next slide
        function nextSlide() {
            const nextSlideIndex = (currentSlide + 1) % slides.length;
            showSlide(nextSlideIndex, false); // No automatic transition after manual navigation
        }

        // Function to manually go to the previous slide
        function prevSlide() {
            const prevSlideIndex = (currentSlide - 1 + slides.length) % slides.length;
            showSlide(prevSlideIndex, false); // No automatic transition after manual navigation
        }

        // Function to reset the automatic slide interval
        function resetAutoSlide() {
            clearTimeout(autoSlideInterval);
            autoSlideInterval = setTimeout(() => showNextSlide(true), 4000); // Continue auto slide after 4 seconds
        }

        // Start the slider with automatic transitions
        autoSlideInterval = setTimeout(showNextSlide, 4000);

        // Initialize the first slide as active
        slides[currentSlide].classList.add('active');
