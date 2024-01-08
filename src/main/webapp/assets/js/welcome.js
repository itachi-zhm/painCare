const slider = document.querySelector('.slider');

function activate(e) {
    const items = document.querySelectorAll('.item');
    e.target.matches('.next') && slider.append(items[0])
    e.target.matches('.prev') && slider.prepend(items[items.length-1]);
}

document.addEventListener('click',activate,false);

const heroSwitch = document.querySelector('.hero__switch');
const heroImage = document.querySelector('.hero__image');
const heroOverlay = document.querySelector('.hero__overlay');

heroSwitch.addEventListener("click", function (e) {
    heroImage.classList.toggle('freedom');
    heroSwitch.classList.toggle('freedom')
    heroOverlay.classList.toggle('freedom');
});