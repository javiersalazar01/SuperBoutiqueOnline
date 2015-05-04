using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ConsultarArticulos : System.Web.UI.Page
{

    SQLConnector sql = SQLConnector.getInstance();  
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

    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        selectAll();
    }
    protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        selectAll();
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        selectAll();
    }
}