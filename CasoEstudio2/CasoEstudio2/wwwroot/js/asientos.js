document.addEventListener("DOMContentLoaded", function () {
    const mapaAsientos = document.getElementById("mapaAsientos");
    const inputAsientos = document.getElementById("asientosSeleccionados");
    const inputPagoTotal = document.getElementById("pagoTotal");
    const asientosSeleccionados = []; 
    const precioPorAsiento = 2700;
    const impuesto = 0.13;

    function actualizarInputAsientos() {
        inputAsientos.value = `${asientosSeleccionados.join(", ")}`;
        calcularCostos();
    }

    function calcularCostos() {
        const cantidadAsientosSeleccionados = asientosSeleccionados.length;
        const subtotal = precioPorAsiento * cantidadAsientosSeleccionados;
        const total = subtotal + (subtotal * impuesto);
        const totalFormateado = total.toFixed(2);

        inputPagoTotal.value = `${totalFormateado}`;
    }

    function manejarClickAsiento(event) {
        const asiento = event.target;
        const asientoNumero = parseInt(asiento.getAttribute("data-seat"));

        if (asiento.classList.contains("seleccionado")) {
            asiento.classList.remove("seleccionado");

            const index = asientosSeleccionados.indexOf(asientoNumero);
            if (index !== -1) {
                asientosSeleccionados.splice(index, 1);
            }
        } else {
            asiento.classList.add("seleccionado");
            asientosSeleccionados.push(asientoNumero);
        }

        actualizarInputAsientos();
    }

    for (let i = 1; i <= 48; i += 4) {
        const fila = document.createElement("div");
        fila.classList.add("fila");

        for (let j = i; j < i + 4; j += 2) {
            const asientoPar = document.createElement("div");
            asientoPar.classList.add("asientos-pares");

            for (let k = 0; k < 2; k++) {
                const asiento = document.createElement("div");
                asiento.classList.add("asientos");

                const asientoNumero = j + k;

                if ([1, 2, 3, 4, 13, 14, 15, 16].includes(asientoNumero)) {
                    asiento.classList.add("disabled", "seleccionadoEspecial");
                    asiento.style.pointerEvents = "none";

                    const icon = document.createElement("i");
                    icon.classList.add("fas", "fa-wheelchair");
                    asiento.textContent = `${asientoNumero} `;
                    asiento.appendChild(icon);
                } else {
                    asiento.textContent = asientoNumero;
                }

                asiento.setAttribute("data-seat", asientoNumero);
                asiento.addEventListener("click", manejarClickAsiento);

                asientoPar.appendChild(asiento);
            }

            if (j < i + 3) {
                const espacioEnMedioPares = document.createElement("div");
                espacioEnMedioPares.classList.add("espacio-enmedio-pares");
                asientoPar.appendChild(espacioEnMedioPares);
            }

            fila.appendChild(asientoPar);
        }

        mapaAsientos.appendChild(fila);
    }
});