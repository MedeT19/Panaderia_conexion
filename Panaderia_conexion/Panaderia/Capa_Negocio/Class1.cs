using System.Data;
using Capa_Datos;
using Capa_Entidad;

namespace Capa_Negocio
{
    public class ClassNegocio
    {
        Class_Datos objd = new Class_Datos();

        public DataTable n_listar_producto()
        {
            return objd.D_listar_producto();
        }

        public DataTable n_buscar_producto(ClassEntidad obje)
        {
            return objd.D_buscar_producto(obje);
        }

        public void ModificarCantidadProducto(string nombre, int nuevaCantidad)
        {
            objd.ModificarCantidadProducto(nombre, nuevaCantidad);
        }

        public void EliminarProducto(string nombre)
        {
            objd.EliminarProducto(nombre);
        }

        public void AgregarProducto(ClassEntidad producto)
        {
            objd.AgregarProducto(producto);
        }

        public DataTable ListarSolicitudesPendientes()
        {
            return objd.ListarSolicitudesPendientes();
        }

        public void RegistrarSolicitud(Solicitud solicitud)
        {
            // Llamar al método correspondiente en la capa de datos
            objd.AgregarSolicitud(solicitud);
        }


    }
}