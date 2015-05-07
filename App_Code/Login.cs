using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

/// <summary>
/// Descripción breve de Class1
/// </summary>
public static class Class1
{
	
    public static bool Autenticar(string usuario, string password)
    {
        //Declaramos la sentencia SQL
        string sql = @"SELECT COUNT(*)
                       FROM Usuarios
                       WHERE nombre = @usuario AND contraseña = @password";

        //utilizamos using para indicarle al compilador que dentro de este bloque se llame al Método Dispose.
        //para así liberar recursos cuanto antes mejor. en este caso no ocupamos decirle que cierre la conexión a la base de datos.
        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conexion"].ToString()))
        {
            conn.Open();

            SqlCommand command = new SqlCommand(sql, conn);
            command.Parameters.AddWithValue("@usuario", usuario);
            command.Parameters.AddWithValue("@password", password);

            int count = Convert.ToInt32(command.ExecuteScalar());

            if (count == 0)
                return false;
            else
                return true;

        }
    }
    public static DataTable prConsultaUsuario(string usuario, string password)
    {
        string sql = @"SELECT tipo
                            FROM usuarios
                            WHERE nombre = @usuario AND contraseña = @password";


        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conexion"].ToString()))
        {
            SqlCommand command = new SqlCommand(sql, conn);

            command.Parameters.AddWithValue("@usuario", usuario);
            command.Parameters.AddWithValue("@password", password);

            conn.Open();
            SqlDataAdapter daAdaptador = new SqlDataAdapter(command);
            DataTable dtDatos = new DataTable();
            daAdaptador.Fill(dtDatos);
            return dtDatos;
        }
    }
}