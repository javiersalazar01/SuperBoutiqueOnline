<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SeleccionarClientes.aspx.cs" Inherits="Consultar" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <asp:Panel runat="server">
        <asp:Label ID="Label1" runat="server" Text="Id Cliente: " ></asp:Label>
        <asp:TextBox ID="clienteid" runat="server"></asp:TextBox>
        <asp:Label ID="Label2" runat="server" Text="Nombre: "></asp:Label>
        <asp:TextBox ID="nombreCliente" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Buscar" OnClick="Button1_Click" />
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Todos Los Regsitros" />
    </asp:Panel>
    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="id_cliente" AllowSorting="True" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="id_cliente" HeaderText="id_cliente" InsertVisible="False" ReadOnly="True" SortExpression="id_cliente" />
            <asp:BoundField DataField="nombre" HeaderText="nombre" SortExpression="nombre" />
            <asp:BoundField DataField="direccion" HeaderText="direccion" SortExpression="direccion" />
            <asp:BoundField DataField="correo" HeaderText="correo" SortExpression="correo" />
            <asp:BoundField DataField="telefono" HeaderText="telefono" SortExpression="telefono" />
            <asp:BoundField DataField="Credito" HeaderText="Credito" SortExpression="Credito" />
            <asp:BoundField DataField="Saldo" HeaderText="Saldo" SortExpression="Saldo" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" DeleteCommand="DELETE FROM [Clientes] WHERE [id_cliente] = @original_id_cliente" InsertCommand="INSERT INTO [Clientes] ([nombre], [direccion], [correo], [telefono], [Credito], [Saldo]) VALUES (@nombre, @direccion, @correo, @telefono, @Credito, @Saldo)"  UpdateCommand="UPDATE [Clientes] SET [nombre] = @nombre, [direccion] = @direccion, [correo] = @correo, [telefono] = @telefono, [Credito] = @Credito, [Saldo] = @Saldo WHERE [id_cliente] = @original_id_cliente" ConnectionString="<%$ ConnectionStrings:Conexion %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Clientes] WHERE (([id_cliente] = @id_cliente) OR ([nombre] LIKE '%' + @nombre + '%'))">
        <DeleteParameters>
            <asp:Parameter Name="original_id_cliente" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="nombre" Type="String" />
            <asp:Parameter Name="direccion" Type="String" />
            <asp:Parameter Name="correo" Type="String" />
            <asp:Parameter Name="telefono" Type="String" />
            <asp:Parameter Name="Credito" Type="Decimal" />
            <asp:Parameter Name="Saldo" Type="Decimal" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="clienteid" Name="id_cliente" PropertyName="Text" Type="Int32" DefaultValue="0" />
            <asp:ControlParameter ControlID="nombreCliente" DefaultValue=" " Name="nombre" PropertyName="Text" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="nombre" Type="String" />
            <asp:Parameter Name="direccion" Type="String" />
            <asp:Parameter Name="correo" Type="String" />
            <asp:Parameter Name="telefono" Type="String" />
            <asp:Parameter Name="Credito" Type="Decimal" />
            <asp:Parameter Name="Saldo" Type="Decimal" />
            <asp:Parameter Name="original_id_cliente" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

