﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AgregarUsuarios : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string tipo = (string)Session["tipo"];
        if (tipo!="2")
        {
            Response.Redirect("~/Default.aspx");
        }
    }
}