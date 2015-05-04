using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de VentaItem
/// </summary>
public class VentaItem
{

    public string idArticulo { get; set; }
    public string Descripcion { get; set; }
    public string cantidad { get; set; }
    public string precio { get; set; }
    public string importe { get; set; }


	public VentaItem(string idArticulo,string Descripcion,string cantidad,string precio,string importe)
	{
        this.idArticulo = idArticulo;
        this.Descripcion = Descripcion;
        this.cantidad = cantidad;
        this.precio = precio;
        this.importe = importe;
	}

}