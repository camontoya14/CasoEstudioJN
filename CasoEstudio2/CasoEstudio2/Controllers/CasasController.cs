using CasoEstudio2.Entities;
using CasoEstudio2.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace CasoEstudio2.Controllers
{
	public class CasasController(ICasasModel _casasModel) : Controller
	{
		[HttpGet]
		public IActionResult ConsultarCasas()
		{
			var resp = _casasModel.ConsultarCasas();

			if (resp?.Codigo == "00")
				return View(resp?.Datos);
			else
			{
				ViewBag.MsjPantalla = resp?.Mensaje;
				return View(new List<Casas>());
			}
		}
		private void CargarCasas()
		{
			var lista = new List<SelectListItem> { new SelectListItem { Value = string.Empty, Text = "Seleccione..."  } };

			foreach (var item in _casasModel.ConsultarCasas()?.Datos!)
				lista.Add(new SelectListItem { Value = item.IdCasa.ToString(), Text = item.DescripcionCasa });

			ViewBag.Casas = lista;
		}

		[HttpGet]
		public IActionResult AlquilarCasa()
		{
			CargarCasas();
			return View();
		}

		[HttpPost]
		public IActionResult AlquilarCasa(Casas entidad)
		{

            entidad.FechaAlquiler = DateTime.Now;
            var resp = _casasModel.AlquilarCasa(entidad);

			if (resp?.Codigo == "00")
				return RedirectToAction("ConsultarCasas", "Casas");
			else
			{
				
				ViewBag.MsjPantalla = resp?.Mensaje;
				return View();
			}
		}
	}
}
