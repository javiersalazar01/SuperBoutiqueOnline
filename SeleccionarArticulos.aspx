<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SeleccionarArticulos.aspx.cs" Inherits="ConsultarArticulos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div class="buscador">
        <asp:Label ID="Label1" runat="server" Text="ID: "></asp:Label>
        <asp:TextBox ID="idclient" runat="server"></asp:TextBox>
        <asp:Label ID="Label2" runat="server" Text="Descripcion: "></asp:Label>
        <asp:TextBox ID="desc" runat="server"></asp:TextBox>
        <asp:Button ID="Button2" runat="server" Text="Buscar" />
        <asp:Button ID="button3" runat="server" Text="Todos Los Registros" OnClick="button3_Click" />
    </div>

     <asp:GridView ID="GridView1" CssClass="mGrid" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="id_articulo" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical" AllowSorting="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="id_articulo" HeaderText="id_articulo" InsertVisible="False" ReadOnly="True" SortExpression="id_articulo" />
            <asp:BoundField DataField="descripcion" HeaderText="descripcion" SortExpression="descripcion" />
            <asp:BoundField DataField="precioVenta" HeaderText="precioVenta" SortExpression="precioVenta" />
            <asp:BoundField DataField="precioCompra" HeaderText="precioCompra" SortExpression="precioCompra" />
            <asp:BoundField DataField="cantidadStock" HeaderText="cantidadStock" SortExpression="cantidadStock" />
            <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
        </Columns>
        <FooterStyle BackColor="#CCCC99" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#F7F7DE" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FBFBF2" />
        <SortedAscendingHeaderStyle BackColor="#848384" />
        <SortedDescendingCellStyle BackColor="#EAEAD3" />
        <SortedDescendingHeaderStyle BackColor="#575357" />
    </asp:GridView>
    <asp:Label ID="Label3" runat="server" Text="Cantidad: "></asp:Label>
    <asp:TextBox ID="txtCantidad" runat="server"></asp:TextBox>
    <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="CustomValidator" ControlToValidate="txtCantidad"></asp:CustomValidator>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Conexion %>" DeleteCommand="DELETE FROM [Articulos] WHERE [id_articulo] = @original_id_articulo" InsertCommand="INSERT INTO [Articulos] ([descripcion], [precioVenta], [precioCompra], [cantidadStock]) VALUES (@descripcion, @precioVenta, @precioCompra, @cantidadStock)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Articulos] WHERE (([id_articulo] = @id_articulo) OR ([descripcion] LIKE '%' + @descripcion + '%'))" UpdateCommand="UPDATE [Articulos] SET [descripcion] = @descripcion, [precioVenta] = @precioVenta, [precioCompra] = @precioCompra, [cantidadStock] = @cantidadStock WHERE [id_articulo] = @original_id_articulo">
        <DeleteParameters>
            <asp:Parameter Name="original_id_articulo" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="descripcion" Type="String" />
            <asp:Parameter Name="precioVenta" Type="Decimal" />
            <asp:Parameter Name="precioCompra" Type="Decimal" />
            <asp:Parameter Name="cantidadStock" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="idclient" DefaultValue="0" Name="id_articulo" PropertyName="Text" Type="Int32" />
            <asp:ControlParameter ControlID="desc" DefaultValue=" " Name="descripcion" PropertyName="Text" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="descripcion" Type="String" />
            <asp:Parameter Name="precioVenta" Type="Decimal" />
            <asp:Parameter Name="precioCompra" Type="Decimal" />
            <asp:Parameter Name="cantidadStock" Type="Int32" />
            <asp:Parameter Name="original_id_articulo" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

