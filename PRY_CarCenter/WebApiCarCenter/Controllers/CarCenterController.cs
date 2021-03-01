using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Web.Http;
using System.Web.Script.Serialization;
using WebApiCarCenter.Models;

namespace WebApiCarCenter.Controllers
{
    public class CarCenterController : ApiController
    {

        //CRUD PARA CLIENTES

        [HttpGet]
        [ActionName("ListClientes")]
        public HttpResponseMessage ListClientes()
        {
            try
            {
                List<Models.Cliente> listClientes = Models.Cliente.GetClientes();
               
                return Request.CreateResponse(HttpStatusCode.OK, JsonConvert.SerializeObject(listClientes));

            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.NotFound, ex.Message);
            }


        }

        [HttpGet]
        [ActionName("Cliente")]
        public HttpResponseMessage Cliente(string id)
        {
            try
            {
                Models.Cliente clientes = Models.Cliente.GetClienteByID(int.Parse(id));

                return Request.CreateResponse(HttpStatusCode.OK, JsonConvert.SerializeObject(clientes));

            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.NotFound, ex.Message);
            }


        }


        [HttpPost]
        [ActionName("GuardarCliente")]
        public HttpResponseMessage GuardarCliente([FromBody] Models.Cliente cliente)
        {
            try
            {


                string respuesta = cliente.Guardar();

                return Request.CreateResponse(HttpStatusCode.OK, respuesta);

            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.NotFound, ex.Message);
            }


        }

        [HttpPost]
        [ActionName("ActualizarCliente")]
        public HttpResponseMessage ActualizarCliente([FromBody] Models.Cliente cliente)
        {
            try
            {


                string respuesta = cliente.Actualizar();

                return Request.CreateResponse(HttpStatusCode.OK, respuesta);

            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.NotFound, ex.Message);
            }


        }


        [HttpGet]
        [ActionName("EliminarCliente")]
        public HttpResponseMessage EliminarCliente(string id)
        {
            try
            {

                var cliente = Models.Cliente.GetClienteByID(int.Parse(id));
               

                string respuesta = cliente.Eliminar();

                return Request.CreateResponse(HttpStatusCode.OK, respuesta);

            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.NotFound, ex.Message);
            }


        }


    }
}
