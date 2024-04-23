using CasoEstudio2.Entities;
using CasoEstudio2.Services;
using Microsoft.AspNetCore.Http;
using System.Net.Http.Headers;

namespace CasoEstudio2.Models
{
	public class CasasModel(HttpClient _http,
								IConfiguration _configuration) : ICasasModel
	{
		public CasasRespuesta? ConsultarCasas()
		{
			string url = _configuration.GetSection("settings:UrlApi").Value + "api/Casas/ConsultarCasas";
			var resp = _http.GetAsync(url).Result;

			if (resp.IsSuccessStatusCode)
				return resp.Content.ReadFromJsonAsync<CasasRespuesta>().Result;

			return null;


		}
		public Respuesta? AlquilarCasa(Casas entidad)
		{
			string url = _configuration.GetSection("settings:UrlApi").Value + "api/Casas/AlquilarCasa";
			JsonContent body = JsonContent.Create(entidad);
			var resp = _http.PutAsync(url, body).Result;

			if (resp.IsSuccessStatusCode)
				return resp.Content.ReadFromJsonAsync<Respuesta>().Result;

			return null;
		}
	}
}
