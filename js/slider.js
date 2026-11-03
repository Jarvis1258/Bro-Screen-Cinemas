const slider = document.querySelector('.slider');
const nextButton = document.querySelector('.next');
const prevButton = document.querySelector('.prev');

let currentIndex = 0;
const slideWidth = document.querySelector('.content-4').offsetWidth + 20; // Card width + margin
const totalSlides = document.querySelectorAll('.content-4').length;

nextButton.addEventListener('click', () => {
    if (currentIndex < totalSlides - 4) { // Adjust based on visible slides (4 in this case)
        currentIndex++;
    } else {
        currentIndex = 0; // Reset to first slide
    }
    slider.style.transform = `translateX(-${currentIndex * slideWidth}px)`;
});

prevButton.addEventListener('click', () => {
    if (currentIndex > 0) {
        currentIndex--;
    } else {
        currentIndex = totalSlides - 4; // Adjust based on visible slides
    }
    slider.style.transform = `translateX(-${currentIndex * slideWidth}px)`;

});

var promoLeft = document.querySelector('#promoLeft');
var promoRight = document.querySelector('#promoRight');
var promoSlide = document.querySelector('#promoSlide');
var margin = 0;

promoLeft.addEventListener('click', () => {
    if (margin == 0) {
        margin = 400;
    } else {
        margin -= 100;
    }

    promoSlide.style.marginLeft = '-' + margin + '%';
})

promoRight.addEventListener('click', () => {
    if (margin == 400) {
        margin = 0;
    } else {
        margin += 100;
    }

    promoSlide.style.marginLeft = '-' + margin + '%';
})
