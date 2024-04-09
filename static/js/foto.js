function mostrarPrevisualizacion() {
    var archivo = document.getElementById('formFile').files[0];
    var vistaPrevia = document.getElementById('preview-image');

    var lector = new FileReader();
    lector.onload = function(e) {
        vistaPrevia.src = e.target.result;
        vistaPrevia.style.display = 'block';
    }
    lector.readAsDataURL(archivo);
}
document.addEventListener('DOMContentLoaded', function() {
    document.getElementById('formFile').addEventListener('change', mostrarPrevisualizacion);
});
// Esto lo hizo el chat, yo no se nada de javascript
// Es para que la miniatura de la imagen se vea apenas la subis
