<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AgregarUsuarios.aspx.cs" Inherits="AgregarUsuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="id_usuario" DataSourceID="SqlDataSource1" DefaultMode="Insert">
        <EditItemTemplate>
            id_usuario:
            <asp:Label ID="id_usuarioLabel1" runat="server" Text='<%# Eval("id_usuario") %>' />
            <br />
            nombre:
            <asp:TextBox ID="nombreTextBox" runat="server" Text='<%# Bind("nombre") %>' />
            <br />
            contraseña:
            <asp:TextBox ID="contraseñaTextBox" runat="server" Text='<%# Bind("contraseña") %>' />
            <br />
            tipo:
            <asp:TextBox ID="tipoTextBox" runat="server" Text='<%# Bind("tipo") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
        </EditItemTemplate>
        <InsertItemTemplate>
            nombre:
            <asp:TextBox ID="nombreTextBox" runat="server" Text='<%# Bind("nombre") %>' />
            <br />
            contraseña:
            <asp:TextBox ID="contraseñaTextBox" runat="server" Text='<%# Bind("contraseña") %>' />
            <br />
            tipo:
            <asp:DropDownList ID="tipoTextBox" runat="server" Text='<%# Bind("tipo") %>' >
                <asp:ListItem Selected="True" Value="1">1 - Empleado</asp:ListItem>
                <asp:ListItem Value="2">2 - Administrador</asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insertar" />
            &nbsp;<asp:Button ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
        </InsertItemTemplate>
        <ItemTemplate>
            id_usuario:
            <asp:Label ID="id_usuarioLabel" runat="server" Text='<%# Eval("id_usuario") %>' />
            <br />
            nombre:
            <asp:Label ID="nombreLabel" runat="server" Text='<%# Bind("nombre") %>' />
            <br />
            contraseña:
            <asp:Label ID="contraseñaLabel" runat="server" Text='<%# Bind("contraseña") %>' />
            <br />
            tipo:
            <asp:Label ID="tipoLabel" runat="server" Text='<%# Bind("tipo") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Editar" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Eliminar" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Nuevo" />
        </ItemTemplate>
    </asp:FormView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Conexion %>" DeleteCommand="DELETE FROM [Usuarios] WHERE [id_usuario] = @id_usuario" InsertCommand="INSERT INTO [Usuarios] ([nombre], [contraseña], [tipo]) VALUES (@nombre, @contraseña, @tipo)" SelectCommand="SELECT * FROM [Usuarios]" UpdateCommand="UPDATE [Usuarios] SET [nombre] = @nombre, [contraseña] = @contraseña, [tipo] = @tipo WHERE [id_usuario] = @id_usuario">
        <DeleteParameters>
            <asp:Parameter Name="id_usuario" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="nombre" Type="String" />
            <asp:Parameter Name="contraseña" Type="String" />
            <asp:Parameter Name="tipo" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="nombre" Type="String" />
            <asp:Parameter Name="contraseña" Type="String" />
            <asp:Parameter Name="tipo" Type="Int32" />
            <asp:Parameter Name="id_usuario" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>

