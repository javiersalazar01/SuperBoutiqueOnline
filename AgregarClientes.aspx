<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AgregarClientes.aspx.cs" Inherits="Agregar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="id_cliente" DataSourceID="SqlDataSource1" DefaultMode="Insert" OnPageIndexChanging="FormView1_PageIndexChanging">
        <EditItemTemplate>
            id_cliente:
            <asp:Label ID="id_clienteLabel1" runat="server" Text='<%# Eval("id_cliente") %>' />
            <br />
            nombre:
            <asp:TextBox ID="nombreTextBox" runat="server" Text='<%# Bind("nombre") %>' />
            <br />
            direccion:
            <asp:TextBox ID="direccionTextBox" runat="server" Text='<%# Bind("direccion") %>' />
            <br />
            correo:
            <asp:TextBox ID="correoTextBox" runat="server" Text='<%# Bind("correo") %>' />
            <br />
            telefono:
            <asp:TextBox ID="telefonoTextBox" runat="server" Text='<%# Bind("telefono") %>' />
            <br />
            Credito:
            <asp:TextBox ID="CreditoTextBox" runat="server" Text='<%# Bind("Credito") %>' />
            <br />
            Saldo:
            <asp:TextBox ID="SaldoTextBox" runat="server" Text='<%# Bind("Saldo") %>' />
            <br />
            <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" />
            &nbsp;<asp:Button ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
        </EditItemTemplate>
        <InsertItemTemplate>
            nombre:
            <asp:TextBox ID="nombreTextBox" runat="server" Text='<%# Bind("nombre") %>' />
            <asp:RangeValidator ControlToValidate="nombreTextBox" ID="RangeValidator1" runat="server" ErrorMessage="RangeValidator" Type="String" Text="Solo Letras" MaximumValue="z" MinimumValue="a"></asp:RangeValidator>
            
            <br />
            direccion:
            <asp:TextBox ID="direccionTextBox" runat="server" Text='<%# Bind("direccion") %>' />
            <asp:RangeValidator ControlToValidate="direccionTextBox" ID="RangeValidator2" runat="server" ErrorMessage="RangeValidator" Type="String" Text="Solo Letras" MaximumValue="z" MinimumValue="a"></asp:RangeValidator>
            <br />
            correo:
            <asp:TextBox ID="correoTextBox" runat="server" Text='<%# Bind("correo") %>' />
            <asp:RegularExpressionValidator  ControlToValidate="correoTextBox" ID="RegularExpressionValidator1" runat="server" ErrorMessage="RegularExpressionValidator" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Text="Ingrese Email Valido"></asp:RegularExpressionValidator>
            <br />
            telefono:
            <asp:TextBox ID="telefonoTextBox" runat="server" Text='<%# Bind("telefono") %>' />
            <br />
            Credito:
            <asp:TextBox ID="CreditoTextBox" runat="server" Text='<%# Bind("Credito") %>' />
            <asp:RangeValidator ControlToValidate="CreditoTextBox" ID="RangeValidator3" runat="server" ErrorMessage="RangeValidator" Type="Integer" MinimumValue="0" MaximumValue="20000" Text="Numeros entre  0 y 20000"></asp:RangeValidator>
            <br />
            Saldo:
            <asp:TextBox ID="SaldoTextBox" runat="server" Text='<%# Bind("Saldo") %>' />
            <asp:RangeValidator ControlToValidate="SaldoTextBox" ID="RangeValidator4" runat="server" ErrorMessage="RangeValidator" Type="Integer" MinimumValue="0" MaximumValue="20000" Text="Numeros entre  0 y 20000"></asp:RangeValidator>
            <br />
            <asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insertar" />
            &nbsp;<asp:Button ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
        </InsertItemTemplate>
        <ItemTemplate>
            id_cliente:
            <asp:Label ID="id_clienteLabel" runat="server" Text='<%# Eval("id_cliente") %>' />
            <br />
            nombre:
            <asp:Label ID="nombreLabel" runat="server" Text='<%# Bind("nombre") %>' />
            <br />
            direccion:
            <asp:Label ID="direccionLabel" runat="server" Text='<%# Bind("direccion") %>' />
            <br />
            correo:
            <asp:Label ID="correoLabel" runat="server" Text='<%# Bind("correo") %>' />
            <br />
            telefono:
            <asp:Label ID="telefonoLabel" runat="server" Text='<%# Bind("telefono") %>' />
            <br />
            Credito:
            <asp:Label ID="CreditoLabel" runat="server" Text='<%# Bind("Credito") %>' />
            <br />
            Saldo:
            <asp:Label ID="SaldoLabel" runat="server" Text='<%# Bind("Saldo") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Editar" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Eliminar" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Nuevo" />
        </ItemTemplate>
    </asp:FormView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Conexion %>" DeleteCommand="DELETE FROM CLIENTES WHERE id_cliente = @id_cliente" InsertCommand="INSERT INTO Clientes values (@nombre,@direccion,@correo,@telefono,@Credito,@Saldo)" SelectCommand="SELECT * FROM CLIENTES" UpdateCommand="UPDATE CLIENTES SET nombre = @nombre,direccion = @direccion,correo = @correo,telefono = @telefono,Credito = @Credito,Saldo = @Saldo WHERE id_cliente = @id_cliene">
        <DeleteParameters>
            <asp:Parameter Name="id_cliente" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="id_cliente" />
            <asp:Parameter Name="nombre" />
            <asp:Parameter Name="direccion" />
            <asp:Parameter Name="correo" />
            <asp:Parameter Name="telefono" />
            <asp:Parameter Name="Credito" />
            <asp:Parameter Name="Saldo" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="direccion" />
            <asp:Parameter Name="correo" />
            <asp:Parameter Name="telefono" />
            <asp:Parameter Name="Credito" />
            <asp:Parameter Name="Saldo" />
            <asp:Parameter Name="id_cliene" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </asp:Content>

