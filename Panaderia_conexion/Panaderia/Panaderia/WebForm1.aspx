<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Panaderia.WebForm1" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CRUD de Productos</title>
    <link rel="stylesheet" href="StyleForm.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
</head>
<body>
    <header>
        <h3>Panadería "Charly"</h3>
        <img src="product-image/PanaderiaCharly.jpeg" alt="Panaderia" class="auto-style4" style="border-radius:100px;"> <br /> 
        <nav>
            <a href="Principal.html"><i class="fas fa-home"></i></a>
            <a href="variedad-de-panes.html">Menú <i class="fas fa-bars"></i></a>
            <a href="https://www.facebook.com/profile.php?id=100066945821755" target="_blank"><i class="fab fa-facebook"></i></a>
            <a href="#" onclick="openCartModal()"><i class="fas fa-shopping-cart"></i></a>
        </nav>
    </header>
    <form id="form1" runat="server">
        <div class="crud-container">
            <h1>Inventario de Productos</h1>

            <!-- Formulario para añadir un nuevo producto -->
            <div class="form-section">
                <h2>Añadir Nuevo Producto</h2>
                <label for="nombre">Nombre:</label>
                <asp:TextBox ID="nombre" runat="server" CssClass="form-control"></asp:TextBox>
                <label for="cantidad">Cantidad:</label>
                <asp:TextBox ID="cantidad" runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
                <asp:Button ID="btnAgregar" runat="server" Text="Agregar Producto" CssClass="btn" OnClick="btnAgregar_Click" />
            </div>

            <!-- Lista de productos -->
            <div class="form-section">
                <h2>Lista de Productos</h2>
                <asp:ListBox ID="listaProductos" runat="server" CssClass="list-box"></asp:ListBox>
            </div>

            <!-- Formulario para modificar un producto -->
            <div class="form-section" id="modifySection">
                <h2>Modificar Producto</h2>
                <label for="txtNombreProducto">Nombre del Producto:</label>
                <asp:TextBox ID="txtNombreProducto" runat="server" CssClass="form-control"></asp:TextBox>
                <label for="txtNuevaCantidad">Nueva Cantidad:</label>
                <asp:TextBox ID="txtNuevaCantidad" runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
                <asp:Button ID="btnModificar" runat="server" Text="Modificar Producto" CssClass="btn" OnClick="btnModificar_Click" />
            </div>

            <!-- Formulario para eliminar un producto -->
            <div class="form-section" id="deleteSection">
                <h2>Eliminar Producto</h2>
                <label for="txtNombreProductoEliminar">Nombre del Producto:</label>
                <asp:TextBox ID="txtNombreProductoEliminar" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:Button ID="btnEliminar" runat="server" Text="Eliminar Producto" CssClass="btn" OnClick="btnEliminar_Click" />
            </div>

            <!-- Formulario para buscar un producto -->
            <div class="form-section">
                <h2>Buscar Producto</h2>
                <label for="txtBuscarProducto">Nombre del Producto:</label>
                <asp:TextBox ID="txtBuscarProducto" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:Button ID="btnBuscarProducto" runat="server" Text="Buscar Producto" CssClass="btn" OnClick="btnBuscarProducto_Click" />
                <asp:ListBox ID="listaResultados" runat="server" CssClass="list-box"></asp:ListBox>
            </div>
        </div>
    </form>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {
            const userRole = localStorage.getItem('userRole');

            if (userRole === 'vendedor') {
                $('#modifySection').hide();
                $('#deleteSection').hide();
            }
        });
    </script>
</body>
</html>
