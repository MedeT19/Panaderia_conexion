document.addEventListener("DOMContentLoaded", function () {
    let images = document.querySelectorAll(".image-rotator img");
    let currentImageIndex = 0;

    function showImage(index) {
        images.forEach(img => img.classList.remove("active"));
        images[index].classList.add("active");
    }

    function rotateImages() {
        currentImageIndex = (currentImageIndex + 1) % images.length;
        showImage(currentImageIndex);
    }

    // Cambia la imagen cada 3 segundos (3000 milisegundos)
    setInterval(rotateImages, 3000);
});

