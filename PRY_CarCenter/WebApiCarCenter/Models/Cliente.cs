using CapaDatos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace WebApiCarCenter.Models
{
    public class Cliente
    {

        public int id { get; set; }
        public string tipoDocto { get; set; }
        public string nroDocto { get; set; }
        public string primerNombre { get; set; }
        public string segundoNombre { get; set; }
        public string primerApellido { get; set; }
        public string segundoApellido { get; set; }
        public long celular { get; set; }
        public string direccion { get; set; }
        public string email { get; set; }


        public string Guardar()
        {
            try
            {
                List<Parametros> LstParametros = new List<Parametros>();
                LstParametros.Add(new Parametros("@tipoDocto", this.tipoDocto, SqlDbType.VarChar));
                LstParametros.Add(new Parametros("@nroDocto", this.nroDocto, SqlDbType.VarChar));
                LstParametros.Add(new Parametros("@primerNombre", this.primerNombre, SqlDbType.VarChar));
                LstParametros.Add(new Parametros("@segundoNombre", this.segundoNombre, SqlDbType.VarChar));
                LstParametros.Add(new Parametros("@primerApellido", this.primerApellido, SqlDbType.VarChar));
                LstParametros.Add(new Parametros("@segundoApellido", this.segundoApellido, SqlDbType.VarChar));
                LstParametros.Add(new Parametros("@celular", this.celular, SqlDbType.BigInt));
                LstParametros.Add(new Parametros("@direccion", this.direccion, SqlDbType.VarChar));
                LstParametros.Add(new Parametros("@email", this.email, SqlDbType.VarChar));
                string respuesta = string.Empty;
                respuesta = CapaDatos.Datos.SPGetEscalar("SP_SaveCliente", LstParametros).ToString();
                return respuesta;
            }
            catch (Exception ex)
            {
                return ex.Message;
            }

        }

        public string Actualizar()
        {
            try
            {
                List<Parametros> LstParametros = new List<Parametros>();
                LstParametros.Add(new Parametros("@id", this.id, SqlDbType.Int));
                LstParametros.Add(new Parametros("@tipoDocto", this.tipoDocto, SqlDbType.VarChar));
                LstParametros.Add(new Parametros("@nroDocto", this.nroDocto, SqlDbType.VarChar));
                LstParametros.Add(new Parametros("@primerNombre", this.primerNombre, SqlDbType.VarChar));
                LstParametros.Add(new Parametros("@segundoNombre", this.segundoNombre, SqlDbType.VarChar));
                LstParametros.Add(new Parametros("@primerApellido", this.primerApellido, SqlDbType.VarChar));
                LstParametros.Add(new Parametros("@segundoApellido", this.segundoApellido, SqlDbType.VarChar));
                LstParametros.Add(new Parametros("@celular", this.celular, SqlDbType.BigInt));
                LstParametros.Add(new Parametros("@direccion", this.direccion, SqlDbType.VarChar));
                LstParametros.Add(new Parametros("@email", this.email, SqlDbType.VarChar));
                string respuesta = string.Empty;
                respuesta = CapaDatos.Datos.SPGetEscalar("SP_UpdateCliente", LstParametros).ToString();
                return respuesta;
            }
            catch (Exception ex)
            {
                return ex.Message;
            }

        }


        public string Eliminar()
        {
            try
            {
                List<Parametros> LstParametros = new List<Parametros>();
                LstParametros.Add(new Parametros("@id", this.id, SqlDbType.Int));
                string respuesta = string.Empty;
                respuesta = CapaDatos.Datos.SPGetEscalar("SP_DeleteCliente", LstParametros).ToString();
                return respuesta;
            }
            catch (Exception ex)
            {
                return ex.Message;
            }

        }


        public static List<Cliente> GetClientes()
        {
            try
            {
                DataTable dt = new DataTable();
                dt = CapaDatos.Datos.SPObtenerDataTable("SP_GetClientes");
                List<Cliente> lstClientes = new List<Cliente>();
                foreach (DataRow dr in dt.Rows)
                {
                    Cliente cliente = new Cliente();
                    cliente.id = int.Parse(dr["IDCliente"].ToString());
                    cliente.tipoDocto = dr["tipoDocumentoCliente"].ToString();
                    cliente.nroDocto = dr["documentoCliente"].ToString();
                    cliente.primerNombre = dr["primerNombreCliente"].ToString();
                    cliente.segundoNombre = dr["segundoNombreCliente"].ToString();
                    cliente.primerApellido = dr["primerApellidoCliente"].ToString();
                    cliente.segundoApellido = dr["segundoApellidoCliente"].ToString();
                    cliente.celular = long.Parse(dr["celularCliente"].ToString());
                    cliente.direccion = dr["direccionCliente"].ToString();
                    cliente.email = dr["emailCliente"].ToString();
                    lstClientes.Add(cliente);
                }

                return lstClientes;

            }
            catch (Exception ex)
            {
                throw ex;
            }

        }


        public static Cliente GetClienteByID(int id)
        {
            try
            {
                DataTable dt = new DataTable();
                List<Parametros> LstParametros = new List<Parametros>();
                LstParametros.Add(new Parametros("@id", id, SqlDbType.Int));
                dt = CapaDatos.Datos.SPObtenerDataTable("SP_GetClienteByID", LstParametros);
                Cliente cliente = new Cliente();
                DataRow dr = dt.Rows[0];


                cliente.id = int.Parse(dr["IDCliente"].ToString());
                cliente.tipoDocto = dr["tipoDocumentoCliente"].ToString();
                cliente.nroDocto = dr["documentoCliente"].ToString();
                cliente.primerNombre = dr["primerNombreCliente"].ToString();
                cliente.segundoNombre = dr["segundoNombreCliente"].ToString();
                cliente.primerApellido = dr["primerApellidoCliente"].ToString();
                cliente.segundoApellido = dr["segundoApellidoCliente"].ToString();
                cliente.celular = long.Parse(dr["celularCliente"].ToString());
                cliente.direccion = dr["direccionCliente"].ToString();
                cliente.email = dr["emailCliente"].ToString();



                return cliente;

            }
            catch (Exception ex)
            {
                throw ex;
            }

        }


    }
}