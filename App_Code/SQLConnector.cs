using System;
using System.Collections.Generic;
using System.Collections;

using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

public class SQLConnector
{

    private SqlConnection con;
    private SqlCommand comand;
    private static SQLConnector util;
    private SqlDataReader reader;
    private SqlDataAdapter adapter;
    private DataSet ds;


    public static SQLConnector getInstance()
    {
        if (util == null)
        {
            util = new SQLConnector("Data Source=JAVIER-PC\\SQLEXPRESS; Initial Catalog=BD_boutique; User ID=sa; Password=163955");
        }
        return util;
    }


    private SQLConnector(string sConection)
    {
        try
        {
            con = new SqlConnection(sConection);
            ds = new DataSet();

        }
        catch (Exception ex)
        {

            //MessageBox.Show("Error no posible conectar a BD " + ex.Message);
        }
    }

    public SqlConnection getConection()
    {
        return con;
    }


    /*
        utilicen este metodo para realizar consulas desde c#. sql es el string donde pondran la consulta
     * 
     * ejemplo: DataTable data = <obejto SQLConncetor>.consultar("select * from productos");
     */
    public DataTable consultar(string sql, string tabla)
    {
        try
        {
            con.Open();
            adapter = new SqlDataAdapter(sql, con);
            if (!ds.Tables.Contains(tabla))
            {
                adapter.Fill(ds, tabla);
            }
            con.Close();

        }
        catch (Exception ex)
        {
            // MessageBox.Show("Error no se puede." + ex.Message + ex.StackTrace);
        }
        return ds.Tables[tabla];
    }


    /*
        metodo encargado de realizar modificaciones a las tablas, desde c#, las sentencias update,insert y delete deben ser usadas en este metodo
     * ejemplo: bool res = <objeto sqlConncetor>.modificar("update clientes set nombre = 'panshito' where id = 1");
     * 
     */
    public bool modificar(string query)
    {
        bool res = true;
        try
        {
            con.Open();
            comand = con.CreateCommand();
            comand.CommandText = query;
            if (comand.ExecuteNonQuery() == -1)
            {
                res = false;
            }
            con.Close();

        }
        catch (Exception ex)
        {
            //MessageBox.Show("Imposible modificacion: " + ex.Message + ex.StackTrace);
        }
        return res;
    }


    /*
       ejecuta procedimeinto SIN parametros, y debuelve un DataSet con todas las tablas que arroja el procedimiento almacenado.
     * 
     * ejemplo:
     * HashTable params = new HashTable();
     * params.Add("paramName",paramValue)
     * 
     * ejecutarProcedimiento("dbo.<procedureName>",params)
     * 
     * 
    */

    public DataSet ejecutarProcedimiento(string procName)
    {
        DataSet ds = new DataSet();
        try
        {
            ds = new DataSet();
            comand = con.CreateCommand();
            comand.CommandText = procName;
            comand.CommandType = CommandType.StoredProcedure;

            adapter = new SqlDataAdapter(comand);
            adapter.Fill(ds);
        }
        catch (Exception e)
        {
            // MessageBox.Show("Un error a ocurrido: " + e.Message + e.StackTrace);
        }


        return ds;
    }

    /*
       ejecuta procedimeinto con parametros, y debuelve un DataSet con todas las tablas que arroja el procedimiento almacenado.
     * es incapas de funcionar con procedimientos con variables de salida.
     * 
     * ejemplo:
     * HashTable params = new HashTable();
     * params.Add("paramName",paramValue)
     * 
     * ejecutarProcedimiento("dbo.<procedureName>",params)
     * 
     * 
    */

    public DataSet ejecutarProcedimiento(string procName, Hashtable parameters)
    {
        DataSet ds = new DataSet();
        try
        {
            ds = new DataSet();
            comand = con.CreateCommand();
            comand.CommandText = procName;
            comand.CommandType = CommandType.StoredProcedure;

            foreach (DictionaryEntry pair in parameters)
            {
                comand.Parameters.AddWithValue(Convert.ToString(pair.Key), pair.Value);
            }

            adapter = new SqlDataAdapter(comand);
            adapter.Fill(ds);

        }
        catch (Exception e)
        {

            //MessageBox.Show("Un error a ocurrido: " + e.Message + e.StackTrace);
        }

        return ds;
    }

    public object ejecutarEscalar(string sql)
    {
        object res = "null";
        try
        {
            con.Open();
            comand = con.CreateCommand();
            comand.CommandText = sql;
            res = comand.ExecuteScalar();
            con.Close();

        }
        catch (Exception ex)
        {
            // MessageBox.Show("Error no se puede." + ex.Message + ex.StackTrace);
        }

        return res;
    }
}
