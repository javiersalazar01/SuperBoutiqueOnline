using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Consultar : System.Web.UI.Page
{
    Venta v = Venta.GetInstance();
    SQLConnector sql = SQLConnector.getInstance();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            selectAll();
            
        }
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        
        v.clienteId = GridView1.SelectedRow.Cells[0].Text;
        v.clienteNombre = GridView1.SelectedRow.Cells[1].Text;
        Response.Redirect("Ventas.aspx");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

    }


    protected void Button2_Click(object sender, EventArgs e)
    {
        selectAll();
    }

    public void selectAll() 
    {
        
        SqlDataSource1.SelectCommand = "SELECT * FROM CLIENTES";
    }
}