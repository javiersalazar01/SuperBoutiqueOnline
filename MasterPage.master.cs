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
        string tipo = (string)Session["tipo"];
        if (!IsPostBack)
            {
                if (tipo == "" || tipo == null)
                    Response.Redirect("~/Login.aspx");
                //Menus superiores
                MenuItem inicio = new MenuItem("Inicio", "", "", "Default.aspx");
                MenuItem ventas = new MenuItem("Ventas", "", "", "Ventas.aspx");
                MenuItem agregar = new MenuItem("Agregar", "", "", "");
                MenuItem consultar = new MenuItem("Consultar", "", "", "");
               // MenuItem editar = new MenuItem("Editar", "", "", "");
                MenuItem cerrarSesion = new MenuItem("Cerrar sesión", "", "", "cerrarSesion.aspx");
                //submenues             
                MenuItem clientesAgregar = new MenuItem("Clientes", "", "", "AgregarClientes.aspx");
                MenuItem articulosAgregar = new MenuItem("Articulos", "", "", "AgregarArticulos.aspx");
              
                 
                agregar.ChildItems.Add(clientesAgregar);
                agregar.ChildItems.Add(articulosAgregar);
                if (tipo=="2")//tipo admin
                {
                    MenuItem ArticulosUsuarios = new MenuItem("Usuarios", "", "", "ConsultarUsuarios.aspx");
                    MenuItem UsuariosAgregar = new MenuItem("Usuarios", "", "", "AgregarUsuarios.aspx");
                    agregar.ChildItems.Add(UsuariosAgregar);
                    consultar.ChildItems.Add(ArticulosUsuarios);
                }
            
                MenuItem clientesConsultar = new MenuItem("Clientes", "", "", "ConsultarClientes.aspx");
                MenuItem ArticulosConsultar = new MenuItem("Articulos", "", "", "ConsultarArticulos.aspx");             
                consultar.ChildItems.Add(clientesConsultar);
                consultar.ChildItems.Add(ArticulosConsultar);
                
                
               
                Menu1.Items.Add(inicio);
                Menu1.Items.Add(ventas);
                Menu1.Items.Add(agregar);
                Menu1.Items.Add(consultar);
                Menu1.Items.Add(cerrarSesion);
               // Menu1.Items.Add(editar);
                
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
