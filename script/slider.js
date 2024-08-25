const slides = document.querySelectorAll('.slide');
const transitionEffects = [
  'fade', 'slide-in', 'grow', 'rotate', 'flip', 'zoom', 
  'slide-up', 'spin', 'bounce', 'fade-slide', 
  'flip-vertical', 'slide-down', 'zoom-out', 
  'flip-horizontal', 'slide-diagonal', 'rotate-zoom', 'bounce-horizontal'
];
let currentSlide = 0;
let autoSlideInterval;

function showSlide(index, auto = true) {
    // Remove active class and effect from the current slide
    slides[currentSlide].classList.remove('active');

    // Update current slide index
    currentSlide = index;

    // Randomly select a transition effect
    const randomEffect = transitionEffects[Math.floor(Math.random() * transitionEffects.length)];

    // Apply the random effect and activate the new slide
    slides[currentSlide].classList.add(randomEffect, 'active');

    // Remove the effect class after 2 seconds
    setTimeout(() => {
        slides[currentSlide].classList.remove(randomEffect);
    }, 2000);

    // Automatically move to the next slide after 4 seconds if auto is true
    if (auto) {
        clearTimeout(autoSlideInterval);
        autoSlideInterval = setTimeout(() => showNextSlide(), 4000);
    }
}

    function showNextSlide(auto = true) {
        const nextSlideIndex = (currentSlide + 1) % slides.length;
        showSlide(nextSlideIndex, auto);
    }

        function nextSlide() {
            const nextSlideIndex = (currentSlide + 1) % slides.length;
            showSlide(nextSlideIndex, false);
        }

        function prevSlide() {
            const prevSlideIndex = (currentSlide - 1 + slides.length) % slides.length;
            showSlide(prevSlideIndex, false);
        }

        // Start the slider with automatic transitions
        autoSlideInterval = setTimeout(showNextSlide, 4000);
