<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Ventas.aspx.cs" Inherits="Ventas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="ventas">
        <asp:Label ID="Label1" runat="server" Text="Folio: "></asp:Label>
        <asp:TextBox ID="txtFolio" runat="server"></asp:TextBox>
        <br/>
        <asp:Label ID="Label2" runat="server" Text="Cliente: "></asp:Label>
        <asp:TextBox ID="txtIdCliente" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtNombreCliente" runat="server"></asp:TextBox>
        <br/>
        <asp:Label ID="Label3" runat="server" Text="Modo De Pago"></asp:Label>
        <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            <asp:ListItem>Efectivo</asp:ListItem>
            <asp:ListItem>Tarjeta de Credito/Debito</asp:ListItem>
            <asp:ListItem>Credito de cliente</asp:ListItem>
        </asp:DropDownList>

        <div class="botones">
            <asp:Button ID="btnNuevo" runat="server" Text="Nuevo" OnClick="btnNuevo_Click" />
            <asp:Button ID="Button3" runat="server" Text="Buscar Cliente" OnClick="Button3_Click" />
            <asp:Button ID="btnBuscarArt" runat="server" Text="Buscar Articulo" OnClick="Button5_Click" />
        </div>
     </div>
    <asp:GridView ID="GridView1" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ButtonType="Button" ShowSelectButton="True" SelectText="Eliminar"/>
        </Columns>

    </asp:GridView>
    <div class="terminar"> 
        <div class="calcular">   
            <asp:Label ID="Label5" runat="server" Text="Fecha"></asp:Label>
            <br />
            <asp:Label ID="Label4" runat="server" Text="Total"></asp:Label>
            <asp:TextBox ID="txtTotal" runat="server"></asp:TextBox>
            <asp:Button ID="Button4" runat="server" Text="Calcular" OnClick="Button4_Click" />
        </div>
        <div class="pagar"> 
            <asp:Label ID="Label6" runat="server" Text="Pago: "></asp:Label>
            <asp:TextBox ID="txtPago" runat="server"></asp:TextBox>
            <asp:Button ID="btnPagar" runat="server" Text="Pagar" OnClick="btnPagar_Click" />
            <br />  
            <asp:Label ID="Label7" runat="server" Text="Cambio: "></asp:Label>
            <asp:Label ID="lblCambio" runat="server" Text="$0"></asp:Label>

        </div>
    </div>
    
</asp:Content>

