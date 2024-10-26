document.addEventListener('DOMContentLoaded', function () {
    const calcularButton = document.getElementById('calcular');
    
    calcularButton.addEventListener('click', function () {
        const input = document.getElementById('expresion').value;
        alert('La expresión ingresada es: ' + input);
    });
});
