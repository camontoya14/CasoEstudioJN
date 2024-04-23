using CasoEstudio2API.Entities;
using Dapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using System.Data;

namespace CasoEstudio2API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CasasController(IConfiguration _configuration) : ControllerBase
    {
        [AllowAnonymous]
        [Route("ConsultarCasas")]
        [HttpGet]
        public IActionResult ConsultarCasas()
        {
            using (var db = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            {
                CasasRespuesta respuesta = new CasasRespuesta();

                var result = db.Query<Casas>("ConsultarCasas",
                    new { },
                    commandType: CommandType.StoredProcedure).ToList();

                if (result == null)
                {
                    respuesta.Codigo = "-1";
                    respuesta.Mensaje = "No hay rutas registradas.";
                }
                else
                {
                    respuesta.Datos = result;
                }

                return Ok(respuesta);
            }
        }

        [AllowAnonymous]
        [Route("AlquilarCasa")]
        [HttpPut]
        public IActionResult AlquilarCasa(Casas entidad)
        {
            using (var db = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            {
                Respuesta respuesta = new Respuesta();

                var result = db.Execute("AlquilarCasa",
                    new { entidad.IdCasa, entidad.DescripcionCasa, entidad.PrecioCasa, entidad.UsuarioAlquiler, entidad.FechaAlquiler },
                    commandType: CommandType.StoredProcedure);

                if (result <= 0)
                {
                    respuesta.Codigo = "-1";
                    respuesta.Mensaje = "Esta Casa no se pudo alquilar.";
                }

                return Ok(respuesta);
            }
        }
        [AllowAnonymous]
        [Route("ConsultarCasa")]
        [HttpGet]
        public IActionResult ConsultarCasa(long IdCasa)
        {
            using (var db = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            {
                CasasRespuesta respuesta = new CasasRespuesta();

                var result = db.Query<Casas>("ConsultarCasa",
                    new { IdCasa },
                    commandType: CommandType.StoredProcedure).FirstOrDefault();

                if (result == null)
                {
                    respuesta.Codigo = "-1";
                    respuesta.Mensaje = "No hay rutas registrados.";
                }
                else
                {
                    respuesta.Dato = result;
                }

                return Ok(respuesta);
            }
        }
    }
}
