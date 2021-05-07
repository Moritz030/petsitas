const changeSliderRange = () => {
    const slider = document.querySelector('#customRange3');
    const sliderRange = document.querySelector('#slider-range');
// console.log(slider.value)
// console.log(sliderRange.innerHTML)
    if (slider) {
        slider.addEventListener('input', () => {  
        sliderRange.innerHTML = slider.value + "km";
        });
    }
}

export { changeSliderRange };