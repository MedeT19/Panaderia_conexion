<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SolicitudCotizacion.aspx.cs" Inherits="Panaderia.SolicitudCotizacion" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="Resumen.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <script src="cart.js" defer></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Solicitud de Cotización - Panadería Charly</title>
</head>
<body class="fondo-suave">
    <header>
        <h3>Panadería "Charly"</h3>
        <img src="product-image/PanaderiaCharly.jpeg" alt="Panaderia" class="auto-style4" style="border-radius:100px;"><br />
        <nav>
            <a href="Principal.html"><i class="fas fa-home"></i></a>
            <a href="variedad-de-panes.html">Menú <i class="fas fa-bars"></i></a>
            <a href="https://www.facebook.com/profile.php?id=100066945821755" target="_blank"><i class="fab fa-facebook"></i></a>
        </nav>
    </header>
    <a href="Contacto.html" class="floating-contact-btn" id="floatingContactBtn"><i class="fas fa-envelope"></i></a>
    <!-- Contenido de la página -->
    <div class="form-container">
        <h2>Solicitud de Cotización para Evento</h2>
        <form action="solicitud.php" method="POST">
            <!-- Detalles del Evento -->
            <div class="form-group">
                <label for="eventName">Nombre del Evento:</label>
                <input type="text" name="eventName" required>
            </div>

            <div class="form-group">
                <label for="eventDate">Fecha del Evento:</label>
                <input type="date" name="eventDate" required>
            </div>

            <div class="form-group">
                <label for="eventTime">Hora del Evento:</label>
                <input type="time" name="eventTime" required>
            </div>

            <div class="form-group">
                <label for="numberOfGuests">Número de Invitados:</label>
                <input type="number" name="numberOfGuests" required>
            </div>

            <!-- Solicitud de Productos -->
            <div class="form-group">
                <label for="products">Productos Deseados:</label>
                <textarea name="products" rows="3" placeholder="Especifica los productos y cantidades que deseas cotizar" required></textarea>
            </div>

            <div class="form-group">
                <label for="budget">Presupuesto Estimado:</label>
                <input type="number" name="budget" placeholder="Opcional">
            </div>

            <!-- Información de Contacto -->
            <div class="form-group">
                <label for="name">Nombre Completo:</label>
                <input type="text" name="name" required>
            </div>

            <div class="form-group">
                <label for="email">Correo Electrónico:</label>
                <input type="email" name="email" required>
            </div>

            <div class="form-group">
                <label for="phone">Teléfono:</label>
                <input type="tel" name="phone" required>
            </div>

            <div class="form-group">
                <label for="Comentarios">Comentarios Adicionales:</label>
                <textarea name="Comentarios" rows="3" placeholder="Especifica cualquier requerimiento adicional" required></textarea>
            </div>
            <button type="submit" class="btn" >Enviar Solicitud</button>
            <input type="hidden" name="_next" value="" />
        </form>


    </div>
</body>
</html>
