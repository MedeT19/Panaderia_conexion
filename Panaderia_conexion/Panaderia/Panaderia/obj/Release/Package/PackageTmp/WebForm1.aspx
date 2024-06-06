<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Panaderia.WebForm1" %>


<!DOCTYPE html>
<html lang="es">
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Panadería - Inicio</title>
     <style>
        /* Estilos con paleta de colores para una panadería */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f3e6; /* Beige claro para fondo */
        }
        header {
            background-color: #e59866; /* Marrón claro para encabezado */
            padding: 10px 0;
            text-align: center;
            color: #ffffff; /* Texto blanco para contraste */
        }
        nav {
            display: inline-block;
        }
        nav a {
            margin: 0 15px;
            text-decoration: none;
            color: #ffffff; /* Texto blanco para contraste */
            font-weight: bold;
            transition: color 0.3s ease;
        }
        nav a:hover {
            color: #d35400; /* Marrón oscuro para efecto hover */
        }
        .container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 0 15px;
            background-color: #ffffff; /* Fondo blanco para contenido */
            border-radius: 8px; /* Bordes redondeados para contenedor */
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1); /* Sombra ligera */
        }
        .location, .products {
            margin-top: 20px;
            padding: 20px;
            border-top: 1px solid #e59866; /* Línea marrón claro arriba */
        }
        .facebook {
            margin-top: 20px;
            padding: 20px;
            border-top: 1px solid #e59866; /* Línea marrón claro arriba */
        }
        .product-image {
            max-width: 100%;
            height: auto;
            margin-bottom: 20px;
            border-radius: 8px; /* Bordes redondeados para imágenes */
        }
        h1, h2 {
            color: #e59866; /* Marrón claro para títulos */
        }
         .auto-style1 {
             width: 447px;
             height: 403px;
         }
         .auto-style2 {
             width: 476px;
             height: 309px;
         }
         .auto-style3 {
             width: 488px;
             height: 398px;
         }
           /* Estilos para los controles de cantidad */
        .quantity-control {
            display: flex;
            align-items: center;
            margin-left: 10px;
        }
        .quantity-control label {
            margin-right: 5px;
        }
        /* Estilos para el modal */
.modal {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.7);
    z-index: 1000;
}

.modal-content {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    background-color: #ffffff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.close-btn {
    position: absolute;
    top: 10px;
    right: 10px;
    cursor: pointer;
}
/* Estilos base */
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f9f3e6;
}

/* Estilos para dispositivos móviles */
@media (max-width: 768px) {
    .container {
        padding: 10px;
    }

    nav {
        display: block;
        text-align: center;
    }

    nav a {
        display: block;
        margin: 10px 0;
    }

    .product-images img {
        width: 100%;
    }

    .quantity-control {
        flex-direction: column;
        align-items: flex-start;
        margin-left: 0;
    }
}

/* Estilos para tabletas y computadoras */
@media (min-width: 769px) {
    header {
        padding: 20px 0;
    }

    nav {
        display: inline-block;
    }

    nav a {
        margin: 0 15px;
    }

    .product-images {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 20px;
    }
}

    </style>
</head>
<body>
    <header>
        <h3>Panadería "Panaderia Charly"</h3>  <img src="product-image/PanaderiaCharly.jpeg" alt="Panaderia" class="auto-style4"><br />
        <br />
        <nav>
            <a href="#menu">Menú</a>
            <a href="#location">Ubicación</a>
            <a href="https://www.facebook.com/profile.php?id=100066945821755" target="_blank">Facebook</a>
            <!-- Icono de carrito -->
         <a href="#" onclick="openCartModal()"><i class="fas fa-shopping-cart"></i></a>
        </nav>
    </header>

    <div class="container">
        
        <section id="menu">
            <h2>Menú</h2>
            <p>Aquí puedes listar tus productos o categorías de productos.</p>
            <!-- Ejemplo de lista de productos -->
            <ul>
                <li>Bolillo</li>
                <li>Pan Dulce</li>
                <li>Pan salado</li>
                <li>Pan de Miga</li>
                <li>Polvorones</li>
                <li>Pan dorado</li>
                <li>Panes rellenos con dulce</li>
                <li>Pastelillos</li>
            </ul>
        </section>

        <section id="location" class="location">
            <h2>Ubicación</h2>
             <!-- Enlace a Google Maps -->
            <p><a href="https://maps.app.goo.gl/zycCyKwCXxxNakq49" target="_blank">Ver en Google Maps</a></p>
            <p>Dirección: Ruben Gomez Salazar, S/n, Panuco,Ver</p>
            <p>Teléfono: (+52) 846-266-05-04 </p>
            <p>Email: PanaderiaCharly@Gmail.com</p>
        </section>
         <section class="products">
            <h2>Variedad de Panes</h2>
            <!-- Galería de imágenes de productos -->
            <div class="product-images">
                <img src="product-image/bolillo.jpg" alt="Bolillos" class="auto-style3"> 
         <div class="quantity-control">
        <label for="quantity-Bolillo">Cantidad:</label>
        <input type="number" id="quantity-Bolillo" min="1" max="50" value=" ">
        <button onclick="addToCart('Bolillo', parseInt(document.getElementById('quantity-Bolillo').value)); document.getElementById('quantity-Bolillo').value = 0;")">Agregar al Carrito</button>
    </div>
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;
                <img src="product-image/ConchaVainilla.jpg" alt="Conchas de Vainilla" class="auto-style1">
                <div class="quantity-control">
        <label for="quantity-Concha-Vainilla">Cantidad:</label>
        <input type="number" id="quantity-Concha-Vainilla" min="1" max="50" value=" ">
        <button onclick="addToCart('Conchas de Vainilla', parseInt(document.getElementById('quantity-Concha-Vainilla').value)); document.getElementById('quantity-Concha-Vainilla').value = 0;")">Agregar al Carrito</button>
    </div>
                <br />
                <img src="product-image/Cuernito.jpg" alt="Cuernitos" class="auto-style2">
                <div class="quantity-control">
        <label for="quantity-Cuernito">Cantidad:</label>
        <input type="number" id="quantity-Cuernito" min="1" max="50" value=" ">
        <button onclick="addToCart('Cuernito', parseInt(document.getElementById('quantity-Cuernito').value)); document.getElementById('quantity-Cuernito').value = 0;")">Agregar al Carrito</button>
    </div>
                <!-- Agrega más imágenes según la variedad de panes que vendas -->
            </div>
        </section>

        <section class="facebook">
            <h2>Síguenos en Facebook</h2>
            <!-- Aquí puedes agregar un widget de Facebook o simplemente un enlace -->
            <a href="https://www.facebook.com/profile.php?id=100066945821755" target="_blank">Visita nuestra página de Facebook</a>
        </section>


  <section class="cart">
      <!-- Modal del Carrito de compras (oculto por defecto) -->
      <div class="modal" id="cartModal">
    <div class="modal-content">
        <span class="close-btn" onclick="closeCartModal()">&times;</span>
        <h2>Carrito de Compras</h2>
        <div class="cart-items">
            <ul id="cart-items-list">
                    <!-- Los ítems del carrito se añadirán aquí con JavaScript -->
                </ul>
            </div>
            <button class="cart-button" onclick="clearCart()">Vaciar Carrito</button>
        </section>

    </div>

    <script>
        let cart = {}; // Objeto para almacenar los productos del carrito

        // Función para agregar un producto al carrito con cantidad seleccionada
        function addToCart(product, quantity) {
            if (cart[product] === undefined) {
                cart[product] = 0;
            }
            cart[product] += quantity;
            if (cart[product] > 50) {
                cart[product] = 50;
            }
            updateCartDisplay();
        }

        // Función para actualizar la visualización del carrito
        function updateCartDisplay() {
            const cartItemsList = document.getElementById("cart-items-list");
            cartItemsList.innerHTML = ''; // Vaciar la lista
            for (const [product, quantity] of Object.entries(cart)) {
                const listItem = document.createElement("li");
                listItem.innerHTML = `<span>${product}</span> - ${quantity} unidad(es)`;
                cartItemsList.appendChild(listItem);
            }
        }

        // Función para vaciar el carrito
        function clearCart() {
            cart = {};
            updateCartDisplay();
        }
        // Función para mostrar el modal del carrito
        function openCartModal() {
            const cartModal = document.getElementById("cartModal");
            cartModal.style.display = "block";

            // Agregar evento de escucha para cerrar el modal al hacer clic fuera de él
            window.addEventListener("click", closeModalOutside);
        }

        // Función para cerrar el modal del carrito
        function closeCartModal() {
            const cartModal = document.getElementById("cartModal");
            cartModal.style.display = "none";

            // Eliminar evento de escucha para cerrar el modal al hacer clic fuera de él
            window.removeEventListener("click", closeModalOutside);
        }

        // Función para cerrar el modal al hacer clic fuera de él
        function closeModalOutside(event) {
            const cartModal = document.getElementById("cartModal");
            if (event.target === cartModal) {
                closeCartModal();
            }
        }

    </script>

</body>
</html>
