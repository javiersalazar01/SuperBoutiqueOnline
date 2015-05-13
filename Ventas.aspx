<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Ventas.aspx.cs" Inherits="Ventas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    <fieldset>
<legend>Realizar Venta</legend>
        <!--Folio-->
        <div class="form-group">
            <asp:Label ID="Label1" CssClass="col-md-4 control-label" runat="server" Text="Folio: "></asp:Label>
            <div class="col-md-1">
                <asp:TextBox ID="txtFolio" CssClass="form-control input-md" runat="server" Enabled="False"></asp:TextBox>
            </div>      
        </div>
        <!--Cliente-->
        <div class="form-group">
            <asp:Label ID="Label2" CssClass="col-md-4 control-label" runat="server" Text="Cliente: "></asp:Label>
            <div class="col-md-3">
                <asp:TextBox ID="txtIdCliente" CssClass="form-control input-md" runat="server" Enabled="False"></asp:TextBox>
                <br />
                <asp:TextBox ID="txtNombreCliente" CssClass="form-control input-md" runat="server" Enabled="False"></asp:TextBox>
            </div>
        </div>
        <!--Modo Pago-->
        <div class="form-group">
        <asp:Label ID="Label3" CssClass="col-md-4 control-label" runat="server" Text="Modo De Pago"></asp:Label>
            <div class="col-md-3">
                <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            <asp:ListItem>Efectivo</asp:ListItem>
            <asp:ListItem>Tarjeta de Credito/Debito</asp:ListItem>
            <asp:ListItem>Credito de cliente</asp:ListItem>
        </asp:DropDownList>
            </div>
        </div>
        <!--botonez-->
       
        <div class="form-group">
            <asp:Label ID="Label8" CssClass="col-md-4 control-label" runat="server" Text=""></asp:Label>
            <div class="col-md-8">
             <asp:Button ID="btnNuevo" runat="server" CssClass="btn btn-default" Text="Nuevo" OnClick="btnNuevo_Click" />
            <asp:Button ID="Button3" runat="server"  CssClass="btn btn-info"  Text="Buscar Cliente" OnClick="Button3_Click" />
            <asp:Button ID="btnBuscarArt" runat="server"  CssClass="btn btn-info"  Text="Buscar Articulo" OnClick="Button5_Click" />
            </div>
        </div>
   
     
    <asp:GridView ID="GridView1" CssClass="mGrid" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ButtonType="Button" ShowSelectButton="True" SelectText="Eliminar"/>
        </Columns>

    </asp:GridView>
   
       
            <div class="form-group">
                  <asp:Label ID="Label5" CssClass="col-md-6 control-label" runat="server" Text="Fecha"></asp:Label>
            </div>
          
            <div class="form-group">
                <asp:Label ID="Label4" CssClass="col-md-4 control-label" runat="server" Text="Total"></asp:Label>
                <div class="col-md-3">
                <asp:TextBox ID="txtTotal" CssClass="form-control input-md" runat="server" required="required"></asp:TextBox>
                    <br />
                <asp:Button ID="Button4" CssClass="btn btn-primary" runat="server" Text="Calcular" OnClick="Button4_Click" />
                </div>
            </div>
            <!--pago-->

        <div class="form-group">
 <asp:Label ID="Label6" CssClass="col-md-4 control-label" runat="server" Text="Pago: "></asp:Label>
            <div class="col-md-3">
                    <asp:TextBox ID="txtPago" CssClass="form-control input-md"  runat="server"></asp:TextBox>
                <br />
                       <asp:Button ID="btnPagar" runat="server" CssClass="btn btn-primary" Text="Pagar" OnClick="btnPagar_Click" />
            </div>
        </div>
       
            <!---->
            
            <div class="form-group">
             <asp:Label ID="Label7" CssClass="col-md-4 control-label" runat="server" Text="Cambio: "></asp:Label>
                <div class="col-md-3">
             <asp:Label ID="lblCambio" CssClass="col-md-3 control-label" runat="server" Text="$0" Font-Bold="True" ForeColor="Red"></asp:Label>
                </div>
         
            </div>
           </fieldset>

 
    
</asp:Content>

