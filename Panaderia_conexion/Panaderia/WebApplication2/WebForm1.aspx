<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication2.WebForm1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CRUD de Productos</title>
    <link rel="stylesheet" href="StyleForm.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="crud-container">
            <h1>CRUD de Productos</h1>

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
            <div class="form-section">
                <h2>Modificar Producto</h2>
                <label for="txtNombreProducto">Nombre del Producto:</label>
                <asp:TextBox ID="txtNombreProducto" runat="server" CssClass="form-control"></asp:TextBox>
                <label for="txtNuevaCantidad">Nueva Cantidad:</label>
                <asp:TextBox ID="txtNuevaCantidad" runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
                <asp:Button ID="btnModificar" runat="server" Text="Modificar Producto" CssClass="btn" OnClick="btnModificar_Click" />
            </div>

            <!-- Formulario para eliminar un producto -->
            <div class="form-section">
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
</body>
</html>
