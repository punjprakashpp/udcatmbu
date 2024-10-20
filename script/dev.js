function adjustWidth() {
    const devs = document.querySelectorAll('.dev');
    if (devs.length > 0) {
        if (window.innerWidth > 768) {
            devs.forEach(dev => dev.style.width = ''); // Reset width before calculation

            let maxDevWidth = Array.from(devs).reduce((maxWidth, dev) => {
                return Math.max(maxWidth, dev.offsetWidth);
            }, 0);

            // Apply the maximum width to all devs
            devs.forEach(dev => {
                dev.style.width = maxDevWidth + 'px';
            });
        } else {
            devs.forEach(dev => {
                dev.style.width = '100%'; // Reset on smaller screens
            });
        }
    }
}

// Debounce function for performance on resize
function debounce(func, delay) {
    let timeout;
    return function () {
        clearTimeout(timeout);
        timeout = setTimeout(() => {
            func();
        }, delay);
    };
}

// Initialize on load and resize with debounced handler
window.addEventListener('load', adjustWidth);
window.addEventListener('resize', debounce(() => {
    adjustWidth(); // Ensure widths are recalculated properly
}, 150));