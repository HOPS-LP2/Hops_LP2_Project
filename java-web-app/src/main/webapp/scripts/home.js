//Esse script faz o touch-slider funcionar, favor não mexer sem autorização.

var DA = document.querySelectorAll('input[type=date]');
for (let d of DA)
    d.type='';

const wrapper = document.querySelector(".touch-slider");

let pressed = false;
let startX = 0;

wrapper.addEventListener('mousedown', function (e) {
    pressed = true;
    startX = e.clientX;
    this.style.cursor = 'grabbing';
});

wrapper.addEventListener('mouseleave', function (e) {
    pressed = false;
});

window.addEventListener('mouseup', function (e) {
    pressed = false;
    startX = e.clientX;
    wrapper.style.cursor = 'grab';
});

wrapper.addEventListener('mousemove', function (e) {
    if(!pressed){
        return
    }
    this.scrollLeft += startX - e.clientX;
});

const slides = document.querySelectorAll(".slide");

slides.forEach(element => element.disabled = true);