<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AgregarArticulos.aspx.cs" Inherits="AgregarArticulos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:FormView ID="FormView1" CssClass="container" runat="server" DataKeyNames="id_articulo" DataSourceID="SqlDataSource1" DefaultMode="Insert">
        <EditItemTemplate>
            
            id_articulo:
            <asp:Label ID="id_articuloLabel1" runat="server" Text='<%# Eval("id_articulo") %>' />
            <br />

            descripcion:
            <asp:TextBox ID="descripcionTextBox" runat="server" Text='<%# Bind("descripcion") %>' />
            <br />
            precioVenta:
            <asp:TextBox ID="precioVentaTextBox" runat="server" Text='<%# Bind("precioVenta") %>' />
            <br />
            precioCompra:
            <asp:TextBox ID="precioCompraTextBox" runat="server" Text='<%# Bind("precioCompra") %>' />
            <br />
            cantidadStock:
            <asp:TextBox ID="cantidadStockTextBox" runat="server" Text='<%# Bind("cantidadStock") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
        </EditItemTemplate>
        <InsertItemTemplate>
            <fieldset>
              <legend>Agregar artículos</legend>
            <div class="form-group">
                <asp:Label ID="Label1" runat="server" CssClass="col-md-4 control-label" Text="Descripción"></asp:Label>
                <div class="col-md-4">
                  <asp:TextBox ID="descripcionTextBox" CssClass="form-control input-md" runat="server" Text='<%# Bind("descripcion") %>' />

                </div>
            </div>
       
            <div class="form-group">
                <asp:Label ID="Label2" runat="server" CssClass="col-md-4 control-label" Text="Precio Venta:"></asp:Label>
                <div class="col-md-2">
                   <asp:TextBox ID="precioVentaTextBox" CssClass="form-control input-md" runat="server" Text='<%# Bind("precioVenta", "{0:C}") %>' ValidateRequestMode="Enabled" />
                   <asp:RangeValidator ControlToValidate="precioVentaTextBox" ID="RangeValidator2" runat="server" ErrorMessage="RangeValidator" Type="Double" Text="Solo Numeros"></asp:RangeValidator>
                </div>
            </div>
          
            <div class="form-group">
                <asp:Label ID="Label3" runat="server" CssClass="col-md-4 control-label" Text="Precio Compra:"></asp:Label>
                <div class="col-md-2">
                    
            <asp:TextBox ID="precioCompraTextBox" CssClass="form-control input-md"  runat="server" Text='<%# Bind("precioCompra", "{0:C}") %>' ValidateRequestMode="Enabled" />
            <asp:RangeValidator ControlToValidate="precioCompraTextBox" ID="RangeValidator3" runat="server" ErrorMessage="RangeValidator" Type="Double" Text="Solo Numeros"></asp:RangeValidator>
          
                </div>
            </div>     

            <div class="form-group">
                <asp:Label ID="Label4" runat="server" CssClass="col-md-4 control-label" Text="Cantidad Stock:"></asp:Label>
                <div class="col-md-2">
                    <asp:TextBox ID="cantidadStockTextBox" CssClass="form-control input-md"  runat="server" Text='<%# Bind("cantidadStock", "{0:N}") %>' ValidateRequestMode="Enabled" />
            <asp:RangeValidator ControlToValidate="cantidadStockTextBox" ID="RangeValidator1" runat="server" ErrorMessage="RangeValidator" Type="Double" Text="Solo Numeros"></asp:RangeValidator>

                </div>
            </div>

            <div class="form-group">
                <asp:Label ID="Label5" runat="server" CssClass="col-md-4 control-label" Text=""></asp:Label>
                <div class="col-md-4">
                    <asp:Button ID="InsertButton" runat="server" CssClass="btn btn-success"  CausesValidation="True" CommandName="Insert" Text="Insertar" ValidateRequestMode="Enabled" />
            &nbsp;<asp:Button ID="InsertCancelButton" runat="server" CssClass="btn btn-danger"  CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
     
                </div>
            </div>
            </fieldset>
               </InsertItemTemplate>
        <ItemTemplate>
            id_articulo:
            <asp:Label ID="id_articuloLabel" runat="server" Text='<%# Eval("id_articulo") %>' />
            <br />
            descripcion:
            <asp:Label ID="descripcionLabel" runat="server" Text='<%# Bind("descripcion") %>' />
            <br />
            precioVenta:
            <asp:Label ID="precioVentaLabel" runat="server" Text='<%# Bind("precioVenta") %>' />
            <br />
            precioCompra:
            <asp:Label ID="precioCompraLabel" runat="server" Text='<%# Bind("precioCompra") %>' />
            <br />
            cantidadStock:
            <asp:Label ID="cantidadStockLabel" runat="server" Text='<%# Bind("cantidadStock") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Editar" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Eliminar" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Nuevo" />
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Conexion %>" DeleteCommand="DELETE FROM [Articulos] WHERE [id_articulo] = @id_articulo" InsertCommand="INSERT INTO [Articulos] ([descripcion], [precioVenta], [precioCompra], [cantidadStock]) VALUES (@descripcion, @precioVenta, @precioCompra, @cantidadStock)" SelectCommand="SELECT * FROM [Articulos]" UpdateCommand="UPDATE [Articulos] SET [descripcion] = @descripcion, [precioVenta] = @precioVenta, [precioCompra] = @precioCompra, [cantidadStock] = @cantidadStock WHERE [id_articulo] = @id_articulo">
        <DeleteParameters>
            <asp:Parameter Name="id_articulo" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="descripcion" Type="String" />
            <asp:Parameter Name="precioVenta" Type="Decimal" />
            <asp:Parameter Name="precioCompra" Type="Decimal" />
            <asp:Parameter Name="cantidadStock" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="descripcion" Type="String" />
            <asp:Parameter Name="precioVenta" Type="Decimal" />
            <asp:Parameter Name="precioCompra" Type="Decimal" />
            <asp:Parameter Name="cantidadStock" Type="Int32" />
            <asp:Parameter Name="id_articulo" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

