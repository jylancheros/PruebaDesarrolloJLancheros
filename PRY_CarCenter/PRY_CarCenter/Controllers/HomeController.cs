using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.Configuration;
using System.Web.Mvc;

namespace PRY_CarCenter.Controllers
{
    public class HomeController : Controller
    {

        public ActionResult Index()
        {
            return View();
        }

        string url = WebConfigurationManager.AppSettings["urlWebApi"].ToString();

        [HttpPost]
        public async Task<ActionResult> GetListClientes()
        {
            try
            {
                string metodo = "ListClientes";
                List<Models.Cliente> listClientes = new List<Models.Cliente>();

                using (var client = new HttpClient())
                {
                    client.BaseAddress = new Uri(url);
                    client.DefaultRequestHeaders.Clear();
                    client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                    HttpResponseMessage Res = await client.GetAsync(metodo);

                    if (Res.IsSuccessStatusCode)
                    {

                        var Response = Res.Content.ReadAsStringAsync().Result;
                        var jsonResult = JsonConvert.DeserializeObject(Response).ToString();
                        listClientes = JsonConvert.DeserializeObject<List<Models.Cliente>>(jsonResult, new JsonSerializerSettings
                        {
                            NullValueHandling = NullValueHandling.Ignore
                        });

                    }

                    return Json(listClientes, JsonRequestBehavior.AllowGet);
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }


        }


        [HttpPost]
        public async Task<ActionResult> GetCliente(int id)
        {
            try
            {
                string metodo = "Cliente/" + id.ToString();
                Models.Cliente clientes = new Models.Cliente();

                using (var client = new HttpClient())
                {
                    client.BaseAddress = new Uri(url);
                    client.DefaultRequestHeaders.Clear();
                    client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                    HttpResponseMessage Res = await client.GetAsync(metodo);

                    if (Res.IsSuccessStatusCode)
                    {

                        var Response = Res.Content.ReadAsStringAsync().Result;
                        var jsonResult = JsonConvert.DeserializeObject(Response).ToString();
                        clientes = JsonConvert.DeserializeObject<Models.Cliente>(jsonResult, new JsonSerializerSettings
                        {
                            NullValueHandling = NullValueHandling.Ignore
                        });

                    }

                    return Json(clientes, JsonRequestBehavior.AllowGet);
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }


        }


        [HttpPost]
        public async Task<ActionResult> guardarCliente(string tipo, string nro, string primerNom, string segundoNom, string primerApe, string segundoApe, string celular, string direccion, string email)
        {
            try
            {
                string metodo = "GuardarCliente";
                Models.Cliente cliente = new Models.Cliente();
                cliente.tipoDocto = tipo;
                cliente.nroDocto = nro;
                cliente.primerNombre = primerNom;
                cliente.segundoNombre = segundoNom;
                cliente.primerApellido = primerApe;
                cliente.segundoApellido = segundoApe;
                cliente.celular = long.Parse(celular);
                cliente.direccion = direccion;
                cliente.email = email;

                using (var client = new HttpClient())
                {
                    client.BaseAddress = new Uri(url);
                    client.DefaultRequestHeaders.Clear();
                    client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                    var stringContent = new StringContent(JsonConvert.SerializeObject(cliente), UnicodeEncoding.UTF8, "application/json"); // use MediaTypeNames.Application.Json in Core 3.0+ and Standard 2.1+

                    HttpResponseMessage Res = await client.PostAsync(metodo, stringContent);

                    if (Res.IsSuccessStatusCode)
                    {
                        return Json("", JsonRequestBehavior.AllowGet);
                        //var Response = Res.Content.ReadAsStringAsync().Result;
                        //return Json(Response.ToString(), JsonRequestBehavior.AllowGet);

                    }
                    else
                    {
                        var Response = Res.Content.ReadAsStringAsync().Result;
                        return Json("Error:" + Response.ToString(), JsonRequestBehavior.AllowGet);
                    }


                }

            }
            catch (Exception ex)
            {
                throw ex;
            }


        }


        [HttpPost]
        public async Task<ActionResult> actualizarCliente(string tipo, string nro, string primerNom, string segundoNom, string primerApe, string segundoApe, string celular, string direccion, string email, string id)
        {
            try
            {
                string metodo = "ActualizarCliente";
                Models.Cliente cliente = new Models.Cliente();
                cliente.id = int.Parse(id);
                cliente.tipoDocto = tipo;
                cliente.nroDocto = nro;
                cliente.primerNombre = primerNom;
                cliente.segundoNombre = segundoNom;
                cliente.primerApellido = primerApe;
                cliente.segundoApellido = segundoApe;
                cliente.celular = long.Parse(celular);
                cliente.direccion = direccion;
                cliente.email = email;

                using (var client = new HttpClient())
                {
                    client.BaseAddress = new Uri(url);
                    client.DefaultRequestHeaders.Clear();
                    client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                    var stringContent = new StringContent(JsonConvert.SerializeObject(cliente), UnicodeEncoding.UTF8, "application/json"); // use MediaTypeNames.Application.Json in Core 3.0+ and Standard 2.1+

                    HttpResponseMessage Res = await client.PostAsync(metodo, stringContent);

                    if (Res.IsSuccessStatusCode)
                    {
                        return Json("", JsonRequestBehavior.AllowGet);
                        //var Response = Res.Content.ReadAsStringAsync().Result;
                        //return Json(Response.ToString(), JsonRequestBehavior.AllowGet);

                    }
                    else
                    {
                        var Response = Res.Content.ReadAsStringAsync().Result;
                        return Json("Error:" + Response.ToString(), JsonRequestBehavior.AllowGet);
                    }


                }

            }
            catch (Exception ex)
            {
                throw ex;
            }


        }


        [HttpPost]
        public async Task<ActionResult> eliminarCliente(int id)
        {
            try
            {
                string metodo = "EliminarCliente/" + id.ToString();
                Models.Cliente clientes = new Models.Cliente();

                using (var client = new HttpClient())
                {
                    client.BaseAddress = new Uri(url);
                    client.DefaultRequestHeaders.Clear();
                    client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                    HttpResponseMessage Res = await client.GetAsync(metodo);

                    if (Res.IsSuccessStatusCode)
                    {
                        var Response = Res.Content.ReadAsStringAsync().Result;
                        var jsonResult = JsonConvert.DeserializeObject(Response).ToString();
                        return Json(jsonResult, JsonRequestBehavior.AllowGet);

                    }
                    else { 
                    var Response = Res.Content.ReadAsStringAsync().Result;
                    var jsonResult = JsonConvert.DeserializeObject(Response).ToString();
                    return Json(jsonResult, JsonRequestBehavior.AllowGet);
                    }
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }


        }


    }



}