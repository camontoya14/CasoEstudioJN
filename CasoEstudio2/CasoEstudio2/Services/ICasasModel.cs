using CasoEstudio2.Entities;
using Microsoft.Extensions.Configuration;
using static System.Net.WebRequestMethods;

namespace CasoEstudio2.Services
{
	public interface ICasasModel
	{
		public CasasRespuesta? ConsultarCasas();

		public Respuesta? AlquilarCasa(Casas entidad);

	}
}
