<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GestionSolicitudes.aspx.cs" Inherits="Panaderia.GestionSolicitudes" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Gestión de Solicitudes</title>
    <link rel="stylesheet" href="StyleForm.css" />
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
            <h1>Gestión de Solicitudes</h1>
           <asp:GridView ID="SolicitudesGridView" runat="server" AutoGenerateColumns="False">
    <Columns>
        <asp:BoundField HeaderText="Nombre del Evento" DataField="EventName" />
        <asp:BoundField HeaderText="Fecha del Evento" DataField="EventDate" />
        <asp:BoundField HeaderText="Hora del Evento" DataField="EventTime" />
        <asp:BoundField HeaderText="Número de Invitados" DataField="NumberOfGuests" />
        <asp:BoundField HeaderText="Productos Deseados" DataField="Products" />
        <asp:BoundField HeaderText="Presupuesto Estimado" DataField="Budget" />
        <asp:BoundField HeaderText="Nombre" DataField="Name" />
        <asp:BoundField HeaderText="Correo Electrónico" DataField="Email" />
        <asp:BoundField HeaderText="Teléfono" DataField="Phone" />
        <asp:BoundField HeaderText="Comentarios Adicionales" DataField="Comentarios" />
        <asp:ButtonField CommandName="Aceptar" Text="Aceptar" ButtonType="Button" />
        <asp:ButtonField CommandName="Rechazar" Text="Rechazar" ButtonType="Button" />
    </Columns>
</asp:GridView>
        </div>
    </form>
</body>
</html>
