using System;
using System.Net;
using System.Net.Mail;
using System.Web.UI;
using Capa_Entidad;
using Capa_Negocio;
using static Panaderia.GestionSolicitudes;

namespace Panaderia
{
    public partial class SolicitudCotizacion : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Este método se ejecutará cuando se cargue la página.
            // Aquí puedes realizar cualquier inicialización necesaria.
        }



        protected void EnviarSolicitud(object sender, EventArgs e)
        {
            // Captura de los datos del formulario
            string eventName = Request.Form["eventName"];
            string eventDate = Request.Form["eventDate"];
            string eventTime = Request.Form["eventTime"];
            string numberOfGuests = Request.Form["numberOfGuests"];
            string products = Request.Form["products"];
            string budget = Request.Form["budget"];
            string name = Request.Form["name"];
            string email = Request.Form["email"];
            string phone = Request.Form["phone"];
            string comentarios = Request.Form["Comentarios"];

            // Crear objeto de la entidad solicitud
            var solicitud = new Solicitud
            {
                EventName = eventName,
                EventDate = eventDate,
                EventTime = eventTime,
                NumberOfGuests = numberOfGuests,
                Products = products,
                Budget = budget,
                Name = name,
                Email = email,
                Phone = phone,
                Comentarios = comentarios
            };

            // Llamar a la capa de negocio para procesar la solicitud
            var negocio = new ClassNegocio();
            negocio.RegistrarSolicitud(solicitud);

            // Después de procesar los datos, enviar un correo de confirmación al cliente.
            EnviarCorreoConfirmacion(email);
        }

        protected void EnviarCorreoConfirmacion(string correo)
        {
            string asunto = "Confirmación de Solicitud de Cotización";
            string mensaje = "Gracias por enviar tu solicitud de cotización. Nos pondremos en contacto contigo pronto.";

            using (MailMessage mail = new MailMessage())
            {
                mail.From = new MailAddress("panaderiacharly00@gmail.com", "Panaderia Charly");
                mail.To.Add(correo);
                mail.Subject = asunto;
                mail.Body = mensaje;
                mail.IsBodyHtml = true;

                using (SmtpClient smtp = new SmtpClient("smtp.dominio.com", 587))
                {
                    smtp.Credentials = new NetworkCredential("panaderiacharly00@gmail.com", "Panaderia_Char");
                    smtp.EnableSsl = true;
                    smtp.Send(mail);
                }
            }
        }
    }
}
