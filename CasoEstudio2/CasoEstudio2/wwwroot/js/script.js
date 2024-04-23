$(function () {
    var slides = $('.slides'),
        images = slides.find('img');

    images.each(function (i) {
        $(this).attr('data-id', i + 1);
    })

    var typed = new Typed('.typed-words', {
        strings: [" Dota.", " Tarrazú.", " León Cortés.", " Pérez Zeledón."],
        typeSpeed: 80,
        backSpeed: 80,
        backDelay: 4000,
        startDelay: 1000,
        loop: true,
        showCursor: true,
        preStringTyped: (arrayPos, self) => {
            arrayPos++;
            console.log(arrayPos);
            $('.slides img').removeClass('active');
            $('.slides img[data-id="' + arrayPos + '"]').addClass('active');
        }

    });
})

function obtenerFechaActual() {
    const ahora = new Date();
    const year = ahora.getFullYear();
    const month = (ahora.getMonth() + 1).toString().padStart(2, '0');
    const day = ahora.getDate().toString().padStart(2, '0');
    return `${year}-${month}-${day}`;
}

const fechaInput = document.getElementById('fecha');
fechaInput.min = obtenerFechaActual();