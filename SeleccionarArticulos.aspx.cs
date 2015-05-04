using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class ConsultarArticulos : System.Web.UI.Page
{
    Venta v = Venta.GetInstance();
    SQLConnector sql = SQLConnector.getInstance();
    int inf = 0;
    int sup = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            selectAll();
        }
        
        
    }
    protected void button3_Click(object sender, EventArgs e)
    {
        selectAll();
    }

    public void selectAll()
    {
        SqlDataSource1.SelectCommand = "SELECT * FROM Articulos";
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        decimal can = Convert.ToInt32(txtCantidad.Text);
        int stock = Convert.ToInt32(GridView1.SelectedRow.Cells[4].Text);
        if (can <= stock)
        {
            decimal pre = Convert.ToDecimal(GridView1.SelectedRow.Cells[2].Text);
            VentaItem item = new VentaItem(
                    GridView1.SelectedRow.Cells[0].Text,
                    GridView1.SelectedRow.Cells[1].Text,
                    txtCantidad.Text,
                    GridView1.SelectedRow.Cells[2].Text,
                    Convert.ToString(can * pre)
                );

            v.añadirItem(item);
            Response.Redirect("Ventas.aspx");
        }
        else
        {
            CustomValidator1.Text = "Ingrese una cantidad entre 0 y " + stock;
            CustomValidator1.IsValid = false;
        }
        
        
        
    }
}