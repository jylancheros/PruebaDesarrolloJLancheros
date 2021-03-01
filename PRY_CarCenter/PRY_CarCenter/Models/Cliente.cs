using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PRY_CarCenter.Models
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

    }
}