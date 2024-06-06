using System;
using System.Data;
using System.Web.UI.WebControls; // Asegúrate de agregar esta referencia para poder utilizar los controles de ASP.NET

/*using Capa_Negocio;
using Capa_Entidad;*/
namespace WebApplication2
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        /*
        protected void btnModificar_Click(object sender, EventArgs e)
        {
            // Obtener el nombre del producto y la nueva cantidad desde los controles de la página
            string nombreProducto = txtNombreProducto.Text;
            int nuevaCantidad = Convert.ToInt32(txtNuevaCantidad.Text);

            // Crear una instancia de la clase de negocio
            ClassNegocio negocio = new ClassNegocio();

            // Llamar al método para modificar la cantidad del producto
            negocio.ModificarCantidadProducto(nombreProducto, nuevaCantidad);

            // Volver a cargar la lista de productos después de la modificación
            CargarListaProductos();
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            // Obtener el nombre del producto desde el control de la página
            string nombreProducto = txtNombreProducto.Text;

            // Crear una instancia de la clase de negocio
            ClassNegocio negocio = new ClassNegocio();

            // Llamar al método para eliminar el producto
            negocio.EliminarProducto(nombreProducto);

            // Volver a cargar la lista de productos después de la eliminación
            CargarListaProductos();
        }


        protected void CargarListaProductos()
        {
            // Crear una instancia de ClassNegocio
            Capa_Negocio.ClassNegocio negocio = new Capa_Negocio.ClassNegocio();

            // Llamar al método n_listar_producto para obtener la lista de productos
            DataTable dtProductos = negocio.n_listar_producto();

            // Mostrar los productos en la lista
            foreach (DataRow row in dtProductos.Rows)
            {
                string nombreProducto = row["nombre"].ToString();
                string cantidadProducto = row["cantidad"].ToString();

                // Crear un ListItem para mostrar el producto en el control ListBox
                ListItem item = new ListItem(nombreProducto + " - Cantidad: " + cantidadProducto);
                listaProductos.Items.Add(item);
            }
        }

        protected void btnBuscarProducto_Click(object sender, EventArgs e)
        {
            // Obtener el texto ingresado en el cuadro de texto
            string productoABuscar = txtBuscarProducto.Text.Trim();

            // Crear una instancia de ClassNegocio
            Capa_Negocio.ClassNegocio negocio = new Capa_Negocio.ClassNegocio();

            // Crear una instancia de ClassEntidad para pasar como parámetro a la función n_buscar_producto
            Capa_Entidad.ClassEntidad entidad = new Capa_Entidad.ClassEntidad();
            entidad.nombre = productoABuscar;

            // Llamar al método n_buscar_producto para obtener los resultados de la búsqueda
            DataTable dtResultados = negocio.n_buscar_producto(entidad);

            // Limpiar el ListBox de resultados antes de mostrar los nuevos resultados
            listaResultados.Items.Clear();

            // Mostrar los resultados en el ListBox de resultados
            foreach (DataRow row in dtResultados.Rows)
            {
                string nombreProducto = row["nombre"].ToString();
                string cantidadProducto = row["cantidad"].ToString();
                listaResultados.Items.Add(nombreProducto + " - Cantidad: " + cantidadProducto);
            }
        }
        */

        // Puedes agregar otros métodos para manejar la interacción del usuario, como agregar, modificar y eliminar productos
    }
}
