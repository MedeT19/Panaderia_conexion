using Capa_Entidad;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Capa_Datos
{
    public class Class_Datos
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["sql"].ConnectionString;

        public DataTable D_listar_producto()
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "EXEC sp_listar_producto";
                    SqlDataAdapter adapter = new SqlDataAdapter(query, connection);
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);
                    return dt;
                }
            }
            catch (SqlException sqlEx)
            {
                throw new Exception("Error al ejecutar la consulta SQL: " + sqlEx.Message, sqlEx);
            }
            catch (Exception ex)
            {
                throw new Exception("Error general al acceder a la base de datos: " + ex.Message, ex);
            }
        }

        public DataTable D_buscar_producto(ClassEntidad obje)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "EXEC sp_buscar_producto @nombre";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@nombre", obje.nombre);
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);
                    return dt;
                }
            }
            catch (SqlException sqlEx)
            {
                throw new Exception("Error al ejecutar la consulta SQL: " + sqlEx.Message, sqlEx);
            }
            catch (Exception ex)
            {
                throw new Exception("Error general al acceder a la base de datos: " + ex.Message, ex);
            }
        }

        public void ModificarCantidadProducto(string nombre, int nuevaCantidad)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "EXEC sp_modificar_producto @nombre, @cantidad";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@nombre", nombre);
                    command.Parameters.AddWithValue("@cantidad", nuevaCantidad);
                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                }
            }
            catch (SqlException sqlEx)
            {
                throw new Exception("Error al ejecutar la consulta SQL: " + sqlEx.Message, sqlEx);
            }
            catch (Exception ex)
            {
                throw new Exception("Error general al acceder a la base de datos: " + ex.Message, ex);
            }
        }

        public void EliminarProducto(string nombre)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "EXEC sp_eliminar_producto @nombre";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@nombre", nombre);
                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                }
            }
            catch (SqlException sqlEx)
            {
                throw new Exception("Error al ejecutar la consulta SQL: " + sqlEx.Message, sqlEx);
            }
            catch (Exception ex)
            {
                throw new Exception("Error general al acceder a la base de datos: " + ex.Message, ex);
            }
        }

        public void AgregarProducto(ClassEntidad producto)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "EXEC sp_agregar_producto @nombre, @cantidad";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@nombre", producto.nombre);
                    command.Parameters.AddWithValue("@cantidad", producto.cantidad);
                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                }
            }
            catch (SqlException sqlEx)
            {
                throw new Exception("Error al ejecutar la consulta SQL: " + sqlEx.Message, sqlEx);
            }
            catch (Exception ex)
            {
                throw new Exception("Error general al acceder a la base de datos: " + ex.Message, ex);
            }
        }





        public DataTable ListarSolicitudesPendientes()
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "EXEC sp_listar_solicitudes_pendientes";
                    SqlDataAdapter adapter = new SqlDataAdapter(query, connection);
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);
                    return dt;
                }
            }
            catch (SqlException sqlEx)
            {
                throw new Exception("Error al ejecutar la consulta SQL: " + sqlEx.Message, sqlEx);
            }
            catch (Exception ex)
            {
                throw new Exception("Error general al acceder a la base de datos: " + ex.Message, ex);
            }
        }

        public void AgregarSolicitud(Solicitud solicitud)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "INSERT INTO Solicitud (Evento, Fecha, Hora, NumeroInvitados, ProductosDeseados, PresupuestoEstimado, Nombre, CorreoElectronico, Telefono, Comentarios) " +
                                   "VALUES (@Evento, @Fecha, @Hora, @NumeroInvitados, @ProductosDeseados, @PresupuestoEstimado, @Nombre, @CorreoElectronico, @Telefono, @Comentarios)";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@Evento", solicitud.EventName);
                    command.Parameters.AddWithValue("@Fecha", DateTime.Parse(solicitud.EventDate)); // Convertir a DateTime si es necesario
                    command.Parameters.AddWithValue("@Hora", solicitud.EventTime);
                    command.Parameters.AddWithValue("@NumeroInvitados", int.Parse(solicitud.NumberOfGuests)); // Convertir a int si es necesario
                    command.Parameters.AddWithValue("@ProductosDeseados", solicitud.Products);
                    command.Parameters.AddWithValue("@PresupuestoEstimado", decimal.Parse(solicitud.Budget)); // Convertir a decimal si es necesario
                    command.Parameters.AddWithValue("@Nombre", solicitud.Name);
                    command.Parameters.AddWithValue("@CorreoElectronico", solicitud.Email);
                    command.Parameters.AddWithValue("@Telefono", solicitud.Phone);
                    command.Parameters.AddWithValue("@Comentarios", solicitud.Comentarios);

                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                }
            }
            catch (SqlException sqlEx)
            {
                throw new Exception("Error al ejecutar la consulta SQL: " + sqlEx.Message, sqlEx);
            }
            catch (Exception ex)
            {
                throw new Exception("Error general al acceder a la base de datos: " + ex.Message, ex);
            }
        }




    }
}
