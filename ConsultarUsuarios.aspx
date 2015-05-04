<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ConsultarUsuarios.aspx.cs" Inherits="ConsultarUsuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="buscar">   
        <asp:Label ID="Label1" runat="server" Text="Nombre: "></asp:Label>
        <asp:TextBox ID="nombre" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Buscar" />
        <asp:Button ID="Button2" runat="server" Text="Todos Los Registros" OnClick="Button2_Click" />
    </div>
    
    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="id_usuario" ForeColor="Black" GridLines="Vertical" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleted="GridView1_RowDeleted" OnRowEditing="GridView1_RowEditing">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="id_usuario" HeaderText="id_usuario" InsertVisible="False" ReadOnly="True" SortExpression="id_usuario" />
            <asp:BoundField DataField="nombre" HeaderText="nombre" SortExpression="nombre" />
            <asp:BoundField DataField="contraseña" HeaderText="contraseña" SortExpression="contraseña" />
            <asp:BoundField DataField="tipo" HeaderText="tipo" SortExpression="tipo" />
            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Conexion %>" DeleteCommand="DELETE FROM [Usuarios] WHERE [id_usuario] = @id_usuario" InsertCommand="INSERT INTO [Usuarios] ([nombre], [contraseña], [tipo]) VALUES (@nombre, @contraseña, @tipo)" SelectCommand="SELECT * FROM [Usuarios] WHERE ([nombre] LIKE '%' + @nombre + '%')" UpdateCommand="UPDATE [Usuarios] SET [nombre] = @nombre, [contraseña] = @contraseña, [tipo] = @tipo WHERE [id_usuario] = @id_usuario">
        <DeleteParameters>
            <asp:Parameter Name="id_usuario" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="nombre" Type="String" />
            <asp:Parameter Name="contraseña" Type="String" />
            <asp:Parameter Name="tipo" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="nombre" DefaultValue=" " Name="nombre" PropertyName="Text" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="nombre" Type="String" />
            <asp:Parameter Name="contraseña" Type="String" />
            <asp:Parameter Name="tipo" Type="Int32" />
            <asp:Parameter Name="id_usuario" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

