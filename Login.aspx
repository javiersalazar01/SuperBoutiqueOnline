<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=1,initial-scale=1,user-scalable=1" />
<link href="http://fonts.googleapis.com/css?family=Lato:100italic,100,300italic,300,400italic,400,700italic,700,900italic,900" rel="stylesheet" type="text/css"/>

    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script src="scripts/jquery-1.11.2.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
<link href="CSS/login.css" rel="stylesheet" />
    <title>Login Boutique</title>
</head>
<body>

  	<section class="container login-form">
		<form id="form1" runat="server" role="main">
			<section>
                <asp:Image ID="Image1" runat="server" />
				<img src="img/logo.png" alt="" class="img-responsive" />
		
				<div class="form-group">
                    
                    <asp:TextBox ID="txtUser" placeholder="Nombre de usuario" runat="server" CssClass="form-control input-lg" required="Ingrese usuario, porfavor"></asp:TextBox>
	   				
				</div>

				<div class="form-group">
                
                        <asp:TextBox ID="txtPassword" TextMode="Password" placeholder="Contraseña" runat="server" CssClass="form-control input-lg" required="Ingrese contraseña, porfavor"></asp:TextBox>
                    
				</div>
                <asp:Button ID="Button1" CssClass="btn btn-lg btn-block btn-info" runat="server" Onclick="btnIniciar_Click" Text="Iniciar Sesión" />
		
			    <br />
			    <asp:Label ID="lbMensaje" runat="server"></asp:Label>
			</section>
		</form>
	</section>
	  
</body>
</html>
