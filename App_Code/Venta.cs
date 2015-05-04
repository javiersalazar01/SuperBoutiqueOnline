using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de Venta
/// </summary>
public class Venta
{
    private DataTable dt;

    SQLConnector sql = SQLConnector.getInstance();

    private static Venta venta;
    public string folio { get; set; }
    public string clienteId { get; set; }
    public string clienteNombre { get; set; }
    public int modoDPago { get; set; }

    private decimal totalT;
    public string total 
    { 
        get 
        {
            decimal suma = 0;
            foreach (VentaItem i in detalleVenta)
            {
                suma = suma + Convert.ToDecimal(i.importe);
            }
            totalT = suma;
            return Convert.ToString(totalT);
        }
        set 
        {
            totalT = Convert.ToDecimal(value);
        }
    }

    private List<VentaItem> detalleVenta;



    public static Venta GetInstance()
    {
        if (venta == null)
	    {
            venta = new Venta();
	    }
        return venta;
    }



	private Venta()
    {
        dt = new DataTable();
        detalleVenta = new List<VentaItem>();
        nuevaVenta();
        totalT = 0;
        dt.Columns.Add("id_articulo", typeof(string));
        dt.Columns.Add("Descripcion", typeof(string));
        dt.Columns.Add("Cantidad", typeof(string));
        dt.Columns.Add("Precio", typeof(string));
        dt.Columns.Add("Importe", typeof(string));
	}

    public void añadirItem(VentaItem i) 
    {
        detalleVenta.Add(i);
    }

    public void eliminarArt(int index) 
    {
        detalleVenta.RemoveAt(index);
    }

    public DataTable itemsToDataTable() 
    {
        dt.Rows.Clear();
        foreach (VentaItem i in detalleVenta)
        {
            dt.Rows.Add(i.idArticulo,i.Descripcion,i.cantidad,i.precio,i.importe);
        }
        return dt;
    }

    public void nuevaVenta() 
    {
        dt.Clear();
        detalleVenta.Clear();
        folio = "";
        clienteId = "";
        clienteNombre = "";
        modoDPago = 0;
        totalT = 0;
    }

    public decimal realizarVenta(decimal pago) 
    {
        
        decimal res = 0;
       
            string MDP = "";
            switch (modoDPago)
            {
                case 1:
                    MDP = "Efectivo";
                    break;
                case 2:
                    MDP = "Tarjeta de Credito/Debito";
                    break;
                case 3:
                    MDP = "Credito de cliente";
                    break;
            }
            decimal total = Convert.ToDecimal(this.total);
            Hashtable h = new Hashtable();
            h.Add("precioTotal", total);
            h.Add("fecha", DateTime.Now);
            h.Add("modoPago", MDP);
            h.Add("idCliente", this.clienteId);

            try
            {
                sql.ejecutarProcedimiento("dbo.nuevaVenta", h);
                foreach (VentaItem i in detalleVenta)
                {
                    h = new Hashtable();
                    h.Add("id_articulo", i.idArticulo);
                    h.Add("id_venta", folio);
                    h.Add("cantidadAComprar", i.cantidad);
                    h.Add("precioVenta", i.precio);
                    h.Add("total", i.importe);
                    sql.ejecutarProcedimiento("dbo.nuevoDetalleVenta", h);
                }
                res = pago - totalT;
            }
            catch (Exception ex)
            {
                
            }
            return res;
        }
        
        
    }

