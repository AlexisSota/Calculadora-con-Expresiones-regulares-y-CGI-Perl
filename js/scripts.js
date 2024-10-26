document.getElementById('calc-form').addEventListener('submit', function(event) {
    event.preventDefault();
    const expression = document.getElementById('expression').value;
    try {
        const result = eval(expression);
        document.getElementById('output').innerText = result;
    } catch (error) {
        document.getElementById('output').innerText = 'Error en la expresión';
    }
});
