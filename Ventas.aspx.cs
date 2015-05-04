using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Ventas : System.Web.UI.Page
{
    public DataTable dt = new DataTable();
    Venta v = Venta.GetInstance();
    SQLConnector sql = SQLConnector.getInstance();
    protected void Page_Load(object sender, EventArgs e)
    {

        v.modoDPago = DropDownList1.SelectedIndex;
        int id = Convert.ToInt32(sql.ejecutarEscalar("SELECT IDENT_CURRENT('Ventas')")) + 1;
        v.folio = Convert.ToString(id);

        txtFolio.Text = v.folio;
        txtIdCliente.Text = v.clienteId;
        txtNombreCliente.Text = v.clienteNombre;
        DropDownList1.SelectedIndex = v.modoDPago;
        txtTotal.Text = v.total;
        Label5.Text = DateTime.Now.ToString("dd/MM/yyyy hh:mm:ss tt");
        
        GridView1.DataSource = v.itemsToDataTable();
        GridView1.DataBind();
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        Response.Redirect("SeleccionarArticulos.aspx");
    }

    protected void btnNuevo_Click(object sender, EventArgs e)
    {
        v.nuevaVenta();
        Response.Redirect("Ventas.aspx");
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("SeleccionarClientes.aspx");
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        v.eliminarArt(GridView1.SelectedIndex);
        Response.Redirect("Ventas.aspx");
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void btnPagar_Click(object sender, EventArgs e)
    {
       decimal cambio = 0;
       decimal pago = Convert.ToDecimal(txtPago.Text);
        
       if (pago >= Convert.ToDecimal(v.total))
        {
            cambio = v.realizarVenta(pago);
            Response.Write("<script>alert('venta realizada con exito')</script>");
            lblCambio.Text = Convert.ToString(cambio);
            v.nuevaVenta();
            Response.Redirect("Ventas.aspx");
        }
       else
       {
           Response.Write("<script>alert('Su pago debe ser mayor que el monto total')</script>");
       }
      
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        decimal cambio = 0;
        decimal pago = Convert.ToDecimal(txtPago.Text);
        txtTotal.Text = v.total;
        if (pago >= Convert.ToDecimal(v.total))
        {
            cambio = pago - Convert.ToDecimal(v.total);
            lblCambio.Text = Convert.ToString(cambio);
        }
    }
}