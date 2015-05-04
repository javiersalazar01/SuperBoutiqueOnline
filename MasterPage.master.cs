using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            {
                //Menus superiores
                MenuItem inicio = new MenuItem("Inicio", "", "", "Default.aspx");
                MenuItem ventas = new MenuItem("Ventas", "", "", "Ventas.aspx");
                MenuItem agregar = new MenuItem("Agregar", "", "", "");
                MenuItem consultar = new MenuItem("Consultar", "", "", "");
                MenuItem editar = new MenuItem("Editar", "", "", "");
                //submenues
                MenuItem clientesAgregar = new MenuItem("Clientes", "", "", "AgregarClientes.aspx");
                MenuItem articulosAgregar = new MenuItem("Articulos", "", "", "AgregarArticulos.aspx");
                MenuItem UsuariosAgregar = new MenuItem("Usuarios", "", "", "AgregarUsuarios.aspx");
                agregar.ChildItems.Add(clientesAgregar);
                agregar.ChildItems.Add(articulosAgregar);
                agregar.ChildItems.Add(UsuariosAgregar);
                MenuItem clientesConsultar = new MenuItem("Clientes", "", "", "ConsultarClientes.aspx");
                MenuItem ArticulosConsultar = new MenuItem("Articulos", "", "", "ConsultarArticulos.aspx");
                MenuItem ArticulosUsuarios = new MenuItem("Usuarios", "", "", "ConsultarUsuarios.aspx");
                consultar.ChildItems.Add(clientesConsultar);
                consultar.ChildItems.Add(ArticulosConsultar);
                consultar.ChildItems.Add(ArticulosUsuarios);
                
               
                Menu1.Items.Add(inicio);
                Menu1.Items.Add(ventas);
                Menu1.Items.Add(agregar);
                Menu1.Items.Add(consultar);
                Menu1.Items.Add(editar);
                
                Menu1.DataBind();         
        }
    }
    protected void BulletedList1_Click(object sender, BulletedListEventArgs e)
    {

    }

    public void alog()
    {
        Response.Write("hola mundo");

    }
}
