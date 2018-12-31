<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="GestionHotelera.Login" %>

<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Creative - Bootstrap 3 Responsive Admin Template">
    <meta name="author" content="GeeksLabs">
    <meta name="keyword" content="Creative, Dashboard, Admin, Template, Theme, Bootstrap, Responsive, Retina, Minimal">
    <link rel="shortcut icon" href="img/favicon.png">

    <title>Login Page 2 | Creative - Bootstrap 3 Responsive Admin Template</title>

    <!-- Bootstrap CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- bootstrap theme -->
    <link href="css/bootstrap-theme.css" rel="stylesheet">
    <!--external css-->
    <!-- font icon -->
    <link href="css/elegant-icons-style.css" rel="stylesheet" />
    <link href="css/font-awesome.css" rel="stylesheet" />
    <!-- Custom styles -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet" />

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 -->
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->

    <!-- =======================================================
      Theme Name: NiceAdmin
      Theme URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
      Author: BootstrapMade
      Author URL: https://bootstrapmade.com
    ======================================================= -->
</head>

<body class="login-img3-body">
        
       <div class="container">
          
        <form class="login-form" runat="server">
            <h3 ><strong>Bienvenidos</strong></h3>
            <div class="login-wrap">
                <p class="login-img"><i class="icon_lock_alt"></i></p>
                <h5>Por favor ingrese su Usuario y Contraseña</h5>
                <div class="input-group">
                    <span class="input-group-addon"><i class="icon_profile"></i></span>
                    <input id="txtUsuario" runat="server" type="text" class="form-control" placeholder="Username" autofocus>
                </div>
                <div class="input-group">
                    <span class="input-group-addon"><i class="icon_key_alt"></i></span>
                    <input id="txtPassword" runat="server" type="password" class="form-control" placeholder="Password">
                </div>
                <div class="input-group">
                    <asp:Label id="lbl_error" runat="server" Text=" " ForeColor="red"></asp:Label>
                </div>
                <label class="checkbox">
                    <input id="txtRecordar" runat="server" type="checkbox" value="remember-me">
                    Recordarme
                <span class="pull-right"><a href="#">Olvidó su contraseña?</a></span>
                   
                </label>
                
                <button id="btnIngresar" runat="server" class="btn btn-primary btn-lg btn-block" onserverclick="btnIngresar_Click">Ingresar</button>
                <button id="btnCancelar" runat="server" class="btn btn-primary btn-lg btn-block" onserverclick="btnCancelar_Click" >Cancelar</button>
               
            </div>
        </form>
        <div class="text-right">
            <div class="credits">
                <!--
            All the links in the footer should remain intact.
            You can delete the links only if you purchased the pro version.
            Licensing information: https://bootstrapmade.com/license/
            Purchase the pro version form: https://bootstrapmade.com/buy/?theme=NiceAdmin
          -->
                Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
            </div>
        </div>
    </div>


</body>

</html>
