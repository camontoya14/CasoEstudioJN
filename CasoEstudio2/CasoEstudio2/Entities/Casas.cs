namespace CasoEstudio2.Entities
{
	public class Casas
	{
		public long IdCasa { get; set; }
		public string DescripcionCasa { get; set; }
		public decimal PrecioCasa { get; set; }
		public string UsuarioAlquiler { get; set; }
		public DateTime? FechaAlquiler { get; set; }
	}
	public class CasasRespuesta
	{
		public CasasRespuesta()
		{
			Codigo = "00";
			Mensaje = string.Empty;
			Dato = null;
			Datos = null;
		}

		public string Codigo { get; set; }
		public string Mensaje { get; set; }
		public Casas? Dato { get; set; }
		public List<Casas>? Datos { get; set; }
	}
}
