using System;
using System.Data;
using System.Web.UI.WebControls;
using Capa_Datos;
using Capa_Negocio;
using Capa_Entidad;
using System.Web.Script.Serialization;
using System.Collections.Generic;


namespace Panaderia
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Aquí puedes cargar la lista de productos cuando se carga la página por primera vez
                //CargarListaProductos();
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            // Obtener los valores del formulario
            string nombreProducto = nombre.Text;
            int cantidadProducto = int.Parse(cantidad.Text);

            // Crear una instancia de la clase de negocio
            ClassNegocio negocio = new ClassNegocio();

            // Crear una instancia de ClassEntidad y establecer los valores
            ClassEntidad nuevoProducto = new ClassEntidad
            {
                nombre = nombreProducto,
                cantidad = cantidadProducto
            };

            // Llamar al método para agregar el producto
            negocio.AgregarProducto(nuevoProducto);

            // Limpiar los campos del formulario después de la inserción
            nombre.Text = string.Empty;
            cantidad.Text = string.Empty;

            // Volver a cargar la lista de productos
            CargarListaProductos();


        }

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
            string nombreProducto = txtNombreProductoEliminar.Text;

            // Crear una instancia de la clase de negocio
            ClassNegocio negocio = new ClassNegocio();

            // Llamar al método para eliminar el producto
            negocio.EliminarProducto(nombreProducto);

            // Volver a cargar la lista de productos después de la eliminación
            CargarListaProductos();
        }

        private void CargarListaProductos()
        {
            // Crear una instancia de la clase de negocio
            ClassNegocio negocio = new ClassNegocio();

            // Obtener la lista de productos
            DataTable dtProductos = negocio.n_listar_producto();

            // Limpiar el ListBox antes de volver a cargar los productos
            listaProductos.Items.Clear();

            // Agregar los productos al ListBox
            foreach (DataRow row in dtProductos.Rows)
            {
                string nombreProducto = row["nombre"].ToString();
                int cantidadProducto = Convert.ToInt32(row["cantidad"]);
                listaProductos.Items.Add(nombreProducto + " - Cantidad: " + cantidadProducto);
            }
        }

        protected void btnBuscarProducto_Click(object sender, EventArgs e)
        {
            // Obtener el texto ingresado en el cuadro de texto
            string productoABuscar = txtBuscarProducto.Text.Trim();

            // Crear una instancia de ClassNegocio
            ClassNegocio negocio = new ClassNegocio();

            // Crear una instancia de ClassEntidad para pasar como parámetro a la función n_buscar_producto
            ClassEntidad entidad = new ClassEntidad();
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

        [System.Web.Services.WebMethod]
        public static string ObtenerProductos()
        {
            ClassNegocio negocio = new ClassNegocio();
            DataTable dtProductos = negocio.n_listar_producto();

            List<Dictionary<string, object>> productos = new List<Dictionary<string, object>>();
            foreach (DataRow row in dtProductos.Rows)
            {
                Dictionary<string, object> producto = new Dictionary<string, object>();
                foreach (DataColumn col in dtProductos.Columns)
                {
                    producto[col.ColumnName] = row[col];
                }
                productos.Add(producto);
            }

            JavaScriptSerializer js = new JavaScriptSerializer();
            return js.Serialize(productos);
        }
}
}