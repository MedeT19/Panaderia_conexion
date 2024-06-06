let cart = JSON.parse(localStorage.getItem('cart')) || {};

function getQuantityFromDB(productName, callback) {
    $.ajax({
        type: "POST",
        url: "http://localhost/phpsqlserver/conexion_sql_server.php",
        data: JSON.stringify({ nombre: productName }),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            if (response.error) {
                alert(response.error);
            } else {
                callback(response.cantidad);
            }
        },
        error: function (error) {
            console.log("Error al obtener la cantidad del producto:", error);
        }
    });
}



function increaseQuantity(product) {
    const quantityElement = document.getElementById(`quantity-${product}`);
    let quantity = parseInt(quantityElement.textContent);
    getQuantityFromDB(product, function (availableQuantity) {
        if (quantity < availableQuantity) {
            quantityElement.textContent = quantity + 1;
        } else {
            alert('No hay suficiente stock disponible');
        }
    });
}

function decreaseQuantity(product) {
    const quantityElement = document.getElementById(`quantity-${product}`);
    let quantity = parseInt(quantityElement.textContent);
    if (quantity > 0) {
        quantityElement.textContent = quantity - 1;
    }
}

function updateCartDisplay() {
    const cartItemsList = document.getElementById("cart-items-list");
    cartItemsList.innerHTML = '';
    for (const [product, quantity] of Object.entries(cart)) {
        const listItem = document.createElement("li");
        listItem.innerHTML = `
            <span>${product}</span> - ${quantity} unidad(es)
            <button class="cart-button edit-button" onclick="editQuantity('${product}')">Editar</button>
            <button class="cart-button remove-button" onclick="removeFromCart('${product}')">Eliminar</button>`;
        cartItemsList.appendChild(listItem);
    }
}

function editQuantity(product) {
    const newQuantity = prompt(`Introduce la nueva cantidad para ${product}:`);
    if (newQuantity !== null) {
        cart[product] = parseInt(newQuantity);
        if (cart[product] <= 0) {
            delete cart[product];
        }
        updateCartDisplay();
    }
}

function openCartModal() {
    const cartModal = document.getElementById("cartModal");
    cartModal.style.display = "block";
    window.addEventListener("click", closeModalOutside);
}

function closeCartModal() {
    const cartModal = document.getElementById("cartModal");
    cartModal.style.display = "none";
    window.removeEventListener("click", closeModalOutside);
}

function closeModalOutside(event) {
    const cartModal = document.getElementById("cartModal");
    if (event.target === cartModal) {
        closeCartModal();
    }
}

function sendOrder() {
    if (Object.keys(cart).length === 0) {
        alert('El carrito está vacío. Por favor, añade productos antes de enviar el pedido.');
        return;
    }

    if (confirm('¿Estás seguro de enviar el pedido?')) {
        localStorage.setItem('cart', JSON.stringify(cart));
        alert('Pedido enviado. Gracias por tu compra.');
        openOrderForm();
    }
}

function openOrderForm() {
    window.location.href = 'Pedido.html'; // Asegúrate de que la ruta sea correcta
}



function openOrderForm() {
    window.location.href = 'Pedido.html'; // Asegúrate de que la ruta sea correcta
}


function openOrderForm() {
    window.location.href = 'ResumenPedido.html';
}

window.onscroll = function () { scrollFunction() };

function scrollFunction() {
    const scrollTopBtn = document.getElementById("scrollTopBtn");
    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
        scrollTopBtn.style.display = "block";
    } else {
        scrollTopBtn.style.display = "none";
    }
}

function scrollToTop() {
    window.scrollTo({
        top: 0,
        behavior: "smooth"
    });
}

function showNotification(message) {
    const notificationModal = document.getElementById("notificationModal");
    const notificationMessage = document.getElementById("notificationMessage");
    notificationMessage.textContent = message;
    notificationModal.style.display = "block";
    setTimeout(() => {
        notificationModal.style.display = "none";
    }, 1000);
}

function closeNotificationModal() {
    document.getElementById("notificationModal").style.display = "none";
}
$(document).ready(function () {
    $.ajax({
        type: "POST",
        url: "WebForm1.aspx/ObtenerProductos",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            const productos = JSON.parse(response.d);
            const productContainer = $(".product-images");
            productContainer.empty();

            productos.forEach(producto => {
                const productName = producto.nombre;
                const imageSrc = "product-image/" + productName.replace(/ /g, "") + ".jpg"; // Asumiendo que la imagen sigue esta convención
                const description = "Cantidad disponible: " + producto.cantidad; // Añade una descripción básica
                productContainer.append(createProductElement(productName, imageSrc, description));
            });
        },
        error: function (error) {
            console.log("Error al cargar los productos:", error);
        }
    });
});
window.onload = function () {
    // Función para mostrar el resumen del pedido
    function mostrarResumenPedido() {
        var elementoCantidad = document.getElementById("cantidadProducto");
        if (elementoCantidad) {
            // Código para actualizar la cantidad
            elementoCantidad.innerHTML = "Nueva cantidad";
        } else {
            console.error("Elemento con ID 'cantidadProducto' no encontrado.");
        }
    }

    window.onload = function () {
        mostrarResumenPedido();
    };


    mostrarResumenPedido(); // Llamar a la función cuando se cargue la página

    // Agregar evento de escucha para el envío del formulario
    const formularioPedido = document.getElementById('formularioPedido');
    formularioPedido.addEventListener('submit', function () {
        // Limpiar el contenido del resumen del pedido después de enviar el formulario
        document.getElementById('resumenPedido').innerHTML = '';
    });
};

function mostrarResumenPedido() {
    var elementoCantidad = document.getElementById("cantidadProducto");
    if (elementoCantidad) {
        // Código para actualizar la cantidad
        elementoCantidad.innerHTML = "Nueva cantidad";
    } else {
        console.error("Elemento con ID 'cantidadProducto' no encontrado.");
    }
}

window.onload = function () {
    mostrarResumenPedido();

    // Agregar evento de escucha para el envío del formulario
    const formularioPedido = document.getElementById('formularioPedido');
    if (formularioPedido) {
        formularioPedido.addEventListener('submit', function () {
            localStorage.removeItem('cart'); // Limpiar el carrito de localStorage
            document.getElementById('resumenPedido').innerHTML = ''; // Limpiar el contenido del resumen del pedido
        });
    } else {
        console.error("Elemento con ID 'formularioPedido' no encontrado.");
    }
};



function initializeCart() {
    const savedCart = JSON.parse(localStorage.getItem('cart')) || {};
    if (Object.keys(savedCart).length > 0) {
        cart = savedCart;
        updateCartDisplay();
    }
}

// Llama a initializeCart() cuando el documento esté listo
$(document).ready(function() {
    initializeCart();
});

function updateCart() {
    localStorage.setItem('cart', JSON.stringify(cart));
    updateCartDisplay();
}

function addToCart(product, quantity) {
    if (quantity <= 0 || isNaN(quantity)) {
        alert('Por favor, introduce una cantidad válida mayor a 0.');
        return;
    }

    getQuantityFromDB(product, function (availableQuantity) {
        if (quantity > availableQuantity) {
            alert('No hay suficiente stock disponible');
            return;
        }

        if (!cart[product]) {
            cart[product] = 0;
        }
        cart[product] += quantity;
        cart[product] = Math.min(cart[product], availableQuantity);

        updateCart();
        showNotification(`¡${quantity} ${product}(s) añadido(s) al carrito!`);
    });
}

function removeFromCart(product) {
    delete cart[product];
    updateCart();
}

function clearCart() {
    cart = {};
    updateCart();
}

function editQuantity(product) {
    const newQuantity = prompt(`Introduce la nueva cantidad para ${product}:`);
    if (newQuantity !== null) {
        cart[product] = parseInt(newQuantity);
        if (cart[product] <= 0) {
            delete cart[product];
        }
        updateCart();
    }
}

function searchProducts() {
    console.log("Buscando productos...");
    const searchTerm = document.getElementById('searchInput').value.toLowerCase(); // Obtén el valor del campo de entrada y conviértelo a minúsculas
    const productElements = $(".container .products .table-container .product-images").children(".im");

    if (searchTerm === "") {
        // Si el término de búsqueda está vacío, muestra todos los productos
        productElements.show();
    } else {
        // Filtrar elementos basados en el término de búsqueda
        const filteredElements = productElements.filter(function () {
            const productName = $(this).find(".card-title").text().toLowerCase();
            const productDescription = $(this).find("p:first").text().toLowerCase();
            return productName.includes(searchTerm) || productDescription.includes(searchTerm);
        });

        // Ocultar todos los elementos
        productElements.hide();

        // Mostrar solo los elementos filtrados
        filteredElements.show();
    }
}
