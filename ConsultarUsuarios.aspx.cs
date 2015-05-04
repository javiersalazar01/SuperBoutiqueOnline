using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ConsultarUsuarios : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            selectAll();
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        selectAll();
    }

    public void selectAll() 
    {
        SqlDataSource1.SelectCommand = "select * from Usuarios";
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