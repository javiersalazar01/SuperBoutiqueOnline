using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;


public partial class Default2 : System.Web.UI.Page
{
    SQLConnector sql = SQLConnector.getInstance();
    protected void Page_Load(object sender, EventArgs e)
    {
       

    }
    protected void btnIniciar_Click(object sender, EventArgs e)
    {
        SQLConnector sql = SQLConnector.getInstance();
        //variables
        string usuario = this.txtUser.Text.Replace(";", "").Replace("--", "");
        string password = this.txtPassword.Text.Replace(";", "").Replace("--", "");

        if (Class1.Autenticar(usuario, password) == true)
        {
           //Se verifica que este en la bd y se guardan los datos en una tb
            
            DataTable tbUsuario = Class1.prConsultaUsuario(usuario, password);
            //Guardamos nombre y tipo
            Session["tipo"] = tbUsuario.Rows[0]["tipo"].ToString();
           // Session["tipo"] = tbUsuario.Rows[0]["tipo"].ToString();
            //Manda a la principal en caso de ser correcto el login
            Response.Redirect("~/Default.aspx");
        }
        else
        {
            lbMensaje.Text = "Usuario y/o contraseña incorrectos.";
        }
    }
    

    
}