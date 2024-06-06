using System;
using System.Collections.Generic;
using System.Data;
using System.Web.UI.WebControls;
using Capa_Entidad;
using Capa_Negocio;

namespace Panaderia
{
    public partial class GestionSolicitudes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Aquí recibes los datos de la base de datos y los muestras en el GridView
                List<Solicitud> solicitudes = ObtenerSolicitudes();

                SolicitudesGridView.DataSource = solicitudes;
                SolicitudesGridView.DataBind();
            }
        }

        // Método para obtener las solicitudes desde la capa de negocio
        private List<Solicitud> ObtenerSolicitudes()
        {
            ClassNegocio negocio = new ClassNegocio();
            DataTable dt = negocio.ListarSolicitudesPendientes();

            List<Solicitud> solicitudes = new List<Solicitud>();

            foreach (DataRow row in dt.Rows)
            {
                Solicitud solicitud = new Solicitud();
                solicitud.EventName = row["EventName"].ToString();
                solicitud.EventDate = row["EventDate"].ToString();
                solicitud.EventTime = row["EventTime"].ToString();
                solicitud.NumberOfGuests = row["NumberOfGuests"].ToString();
                solicitud.Products = row["Products"].ToString();
                solicitud.Budget = row["Budget"].ToString();
                solicitud.Name = row["Name"].ToString();
                solicitud.Email = row["Email"].ToString();
                solicitud.Phone = row["Phone"].ToString();
                solicitud.Comentarios = row["Comentarios"].ToString();

                solicitudes.Add(solicitud);
            }

            return solicitudes;
        }


        protected void SolicitudesGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Aceptar" || e.CommandName == "Rechazar")
            {
                // Obtener el índice de la fila donde se hizo clic en el botón
                int index = Convert.ToInt32(e.CommandArgument);

                // Obtener el GridViewRow correspondiente al índice
                GridViewRow row = SolicitudesGridView.Rows[index];

                // Obtener el ID de la solicitud de la fila
                int solicitudID = Convert.ToInt32(SolicitudesGridView.DataKeys[index].Value);

                // Aquí puedes realizar acciones como aceptar o rechazar la solicitud
                // Puedes obtener los datos de la fila si es necesario
                string eventName = row.Cells[0].Text;
                string eventDate = row.Cells[1].Text;
                // Obtener otros datos según las celdas del GridView

                if (e.CommandName == "Aceptar")
                {
                    // Lógica para aceptar la solicitud
                    // Puedes llamar a métodos en la capa de negocio para realizar operaciones
                    // Por ejemplo: negocio.AceptarSolicitud(solicitudID);
                }
                else if (e.CommandName == "Rechazar")
                {
                    // Lógica para rechazar la solicitud
                    // Por ejemplo: negocio.RechazarSolicitud(solicitudID);
                }

                // Actualizar el GridView después de realizar las operaciones
                List<Solicitud> solicitudes = ObtenerSolicitudes();
                SolicitudesGridView.DataSource = solicitudes;
                SolicitudesGridView.DataBind();
            }
        }
    }
}
