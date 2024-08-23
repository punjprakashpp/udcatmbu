const slides = document.querySelectorAll('.slide');
const transitionEffects = [
  'fade', 'slide-in', 'grow', 'rotate', 'flip', 'zoom', 
  'slide-up', 'spin', 'bounce', 'fade-slide', 
  'flip-vertical', 'slide-down', 'zoom-out', 'flip-horizontal', 
  'skew-horizontal', 'slide-diagonal', 'rotate-zoom', 'bounce-horizontal'
];
let currentSlide = 0;

function showNextSlide(auto = true) {
    slides[currentSlide].classList.remove('active');
  
    // Update current slide index and handle circular navigation
    currentSlide = auto ? (currentSlide + 1) % slides.length : currentSlide;
  
    // Randomly select a transition effect
    const randomEffect = transitionEffects[Math.floor(Math.random() * transitionEffects.length)];
  
    // Apply random effect and activate the next slide
    slides[currentSlide].classList.add(randomEffect, 'active');
  
    // Remove the effect class after 2 seconds
    setTimeout(() => {
        slides[currentSlide].classList.remove(randomEffect);
    }, 2000);
  
    // Automatically move to the next slide after 4 seconds if auto is true
    if (auto) {
        setTimeout(showNextSlide, 4000);
    }
}

    function nextSlide() {
        slides[currentSlide].classList.remove('active');
        currentSlide = (currentSlide + 1) % slides.length;
        showNextSlide(false);
    }

    function prevSlide() {
        slides[currentSlide].classList.remove('active');
        currentSlide = (currentSlide - 1 + slides.length) % slides.length;
        showNextSlide(false);
    }

    // Start the slider with automatic transitions
    setTimeout(showNextSlide, 4000);
