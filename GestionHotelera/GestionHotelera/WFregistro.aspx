<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WFregistro.aspx.cs" Inherits="GestionHotelera.WFregistro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registro</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="Creative - Bootstrap 3 Responsive Admin Template" />
    <meta name="author" content="GeeksLabs" />
    <meta name="keyword" content="Creative, Dashboard, Admin, Template, Theme, Bootstrap, Responsive, Retina, Minimal" />
    <link rel="shortcut icon" href="img/favicon.png" />



    <!-- Bootstrap CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <!-- bootstrap theme -->
    <link href="css/bootstrap-theme.css" rel="stylesheet" />
    <!--external css-->
    <!-- font icon -->
    <link href="css/elegant-icons-style.css" rel="stylesheet" />
    <link href="css/font-awesome.css" rel="stylesheet" />
    <!-- Custom styles -->
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/style-responsive.css" rel="stylesheet" />

    <!-- Script para el carrusel de imagenes -->
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function () {
            $('.myCarousel').carousel()
            interval: 3000
        });
    </script>

    <!-- Script para validar documentos -->
    <script type="text/javascript">
        function validarDocumento() {
            //validarDocumento  = function() {

            numero = document.getElementById('ruc').value;
            /* alert(numero); */
            var suma = 0;
            var residuo = 0;
            var pri = false;
            var pub = false;
            var nat = false;
            var numeroProvincias = 22;
            var modulo = 11;

            /* Verifico que el campo no contenga letras */
            var ok = 1;
            for (i = 0; i < numero.length && ok == 1; i++) {
                var n = parseInt(numero.charAt(i));
                if (isNaN(n)) ok = 0;
            }
            if (ok == 0) {
                alert("No puede ingresar caracteres en el número");
                return false;
            }

            if (numero.length < 10) {
                alert('El número ingresado no es válido');
                return false;
            }

            /* Los primeros dos digitos corresponden al codigo de la provincia */
            provincia = numero.substr(0, 2);
            if (provincia < 1 || provincia > numeroProvincias) {
                alert('El código de la provincia (dos primeros dígitos) es inválido');
                return false;
            }
            /* Aqui almacenamos los digitos de la cedula en variables. */
            d1 = numero.substr(0, 1);
            d2 = numero.substr(1, 1);
            d3 = numero.substr(2, 1);
            d4 = numero.substr(3, 1);
            d5 = numero.substr(4, 1);
            d6 = numero.substr(5, 1);
            d7 = numero.substr(6, 1);
            d8 = numero.substr(7, 1);
            d9 = numero.substr(8, 1);
            d10 = numero.substr(9, 1);

            /* El tercer digito es: */
            /* 9 para sociedades privadas y extranjeros   */
            /* 6 para sociedades publicas */
            /* menor que 6 (0,1,2,3,4,5) para personas naturales */
            if (d3 == 7 || d3 == 8) {
                alert('El tercer dígito ingresado es inválido');
                return false;
            }

            /* Solo para personas naturales (modulo 10) */
            if (d3 < 6) {
                nat = true;
                p1 = d1 * 2; if (p1 >= 10) p1 -= 9;
                p2 = d2 * 1; if (p2 >= 10) p2 -= 9;
                p3 = d3 * 2; if (p3 >= 10) p3 -= 9;
                p4 = d4 * 1; if (p4 >= 10) p4 -= 9;
                p5 = d5 * 2; if (p5 >= 10) p5 -= 9;
                p6 = d6 * 1; if (p6 >= 10) p6 -= 9;
                p7 = d7 * 2; if (p7 >= 10) p7 -= 9;
                p8 = d8 * 1; if (p8 >= 10) p8 -= 9;
                p9 = d9 * 2; if (p9 >= 10) p9 -= 9;
                modulo = 10;
            }
            /* Solo para sociedades publicas (modulo 11) */
            /* Aqui el digito verficador esta en la posicion 9, en las otras 2 en la pos. 10 */
            else if (d3 == 6) {
                pub = true;
                p1 = d1 * 3;
                p2 = d2 * 2;
                p3 = d3 * 7;
                p4 = d4 * 6;
                p5 = d5 * 5;
                p6 = d6 * 4;
                p7 = d7 * 3;
                p8 = d8 * 2;
                p9 = 0;
            }

            /* Solo para entidades privadas (modulo 11) */
            else if (d3 == 9) {
                pri = true;
                p1 = d1 * 4;
                p2 = d2 * 3;
                p3 = d3 * 2;
                p4 = d4 * 7;
                p5 = d5 * 6;
                p6 = d6 * 5;
                p7 = d7 * 4;
                p8 = d8 * 3;
                p9 = d9 * 2;
            }

            suma = p1 + p2 + p3 + p4 + p5 + p6 + p7 + p8 + p9;
            residuo = suma % modulo;
            /* Si residuo=0, dig.ver.=0, caso contrario 10 - residuo*/
            digitoVerificador = residuo == 0 ? 0 : modulo - residuo;
            /* ahora comparamos el elemento de la posicion 10 con el dig. ver.*/
            if (pub == true) {
                if (digitoVerificador != d9) {
                    alert('El ruc de la empresa del sector público es incorrecto.');
                    return false;
                }
                /* El ruc de las empresas del sector publico terminan con 0001*/
                if (numero.substr(9, 4) != '0001') {
                    alert('El ruc de la empresa del sector público debe terminar con 0001');
                    return false;
                }
            }
            else if (pri == true) {
                if (digitoVerificador != d10) {
                    alert('El ruc de la empresa del sector privado es incorrecto.');
                    return false;
                }
                if (numero.substr(10, 3) != '001') {
                    alert('El ruc de la empresa del sector privado debe terminar con 001');
                    return false;
                }
            }
            else if (nat == true) {
                if (digitoVerificador != d10) {
                    alert('El número de cédula de la persona natural es incorrecto.');
                    return false;
                }
                if (numero.length > 10 && numero.substr(10, 3) != '001') {
                    alert('El ruc de la persona natural debe terminar con 001');
                    return false;
                }
            }
            return true;
        }
</script>

    <!-- Script para Cconfirmar datos y redireccionar paginas -->
    <script type="text/javascript">
    function confirmacion() {
        var answer = confirm("¿Esta seguro que desea continuar?")
        if (answer) {
            alert("Datos guardados correctamente")
            window.location.href = "WFCrearUsuario.aspx";
        }
        else {
            alert("Verifique la información")
        }

        return false;
    }
    </script>

</head>
<body>

    <br />
    <br />

    <div class="col-lg-5">
        <section class="panel">
            <header class="panel-heading">
                Registro de datos personales
            </header>
            <div class="panel-body">
                <div class="form">
                    <form class="form-validate form-horizontal" id="feedback_form" method="get" action="" novalidate="novalidate" runat="server">
                        <div class="col-lg-5">
                        Ingrese el número de identificación
                         </div>
                        <div class="col-lg-5">
                        <asp:TextBox ID="ruc" runat="server" CssClass="form-control error" MaxLength="13" placeholder="# de identificacion"></asp:TextBox>
                        </div>



                        <br />
                        <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="300px" AutoGenerateRows="False" DataKeyNames="id_persona" DataSourceID="sqldsPersona" DefaultMode="Insert" GridLines="None" HorizontalAlign="Center" CssClass="form-validate form-horizontal">

                            <Fields>
                                <asp:BoundField DataField="id_persona" HeaderText="id_persona" InsertVisible="False" ReadOnly="True" SortExpression="id_persona" Visible="False" />
                                <asp:TemplateField HeaderText="tipo de identificación" SortExpression="descripcion_identificacion">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("descripcion_identificacion") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="sqldsIdentificacionesInsertar" DataTextField="descripcion_identificacion" DataValueField="id_identificacion" SelectedValue='<%# Bind("id_identificacion") %>' Width="100%" CssClass="form-control">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="sqldsIdentificacionesInsertar" runat="server" ConnectionString="<%$ ConnectionStrings:gestionHoteleraConnectionString %>" SelectCommand="SELECT [id_identificacion], [descripcion_identificacion] FROM [tbl_identificacion] WHERE ([estado_identificacion] = @estado_identificacion)">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="A" Name="estado_identificacion" Type="String" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("descripcion_identificacion") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="# identificación" SortExpression="numero_identificacionpersona">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("numero_identificacionpersona") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" MaxLength="13" Text='<%# Bind("numero_identificacionpersona") %>' CssClass="form-control error" onblur="validarDocumento();" placeholder="digite nuevamente el # de identificacion"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Debe ingresar el # de identificación" ForeColor="Red" ValidationGroup="insertarPersona">*</asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Solo números" ForeColor="Blue" ValidationExpression="^(0|[0-9]\d*)$" ValidationGroup="insertarPersona">*</asp:RegularExpressionValidator>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("numero_identificacionpersona") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>




                                <asp:BoundField DataField="id_identificacion" HeaderText="id_identificacion" SortExpression="id_identificacion" Visible="False" />

                                <asp:TemplateField HeaderText="tipo de persona" SortExpression="descripcion_tipopersona">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("descripcion_tipopersona") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="sqldsTipoPersonaInsertar" DataTextField="descripcion_tipopersona" DataValueField="id_tipopersona" SelectedValue='<%# Bind("id_tipopersona") %>' Width="100%" CssClass="form-control">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="sqldsTipoPersonaInsertar" runat="server" ConnectionString="<%$ ConnectionStrings:gestionHoteleraConnectionString %>" SelectCommand="SELECT id_tipopersona, descripcion_tipopersona FROM tbl_tipo_persona WHERE (estado_tipopersona = @estado_tipopersona) AND (descripcion_tipopersona = @descripcion_tipopersona)">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="A" Name="estado_tipopersona" Type="String" />
                                                <asp:Parameter DefaultValue="CLIENTE" Name="descripcion_tipopersona" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("descripcion_tipopersona") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:BoundField DataField="id_tipopersona" HeaderText="id_tipopersona" SortExpression="id_tipopersona" Visible="False" />

                                <asp:TemplateField HeaderText="apellido1" SortExpression="apellido1_persona">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("apellido1_persona") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" MaxLength="20" Text='<%# Bind("apellido1_persona") %>' CssClass="form-control error"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Debe ingresar el primer apellido" ForeColor="Red" ValidationGroup="insertarPersona">*</asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Solo letras MAYÚSC" ForeColor="Blue" ValidationExpression="[A-Z]*" ValidationGroup="insertarPersona">*</asp:RegularExpressionValidator>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("apellido1_persona") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="apellido2" SortExpression="apellido2_persona">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("apellido2_persona") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("apellido2_persona") %>' CssClass="form-control error"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="Debe ingresar el segundo apellido" ForeColor="Red" ValidationGroup="insertarPersona">*</asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="Solo letras MAYÚSC" ForeColor="Blue" ValidationExpression="[A-Z]*" ValidationGroup="insertarPersona">*</asp:RegularExpressionValidator>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("apellido2_persona") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="nombre1" SortExpression="nombre1_persona">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("nombre1_persona") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("nombre1_persona") %>' CssClass="form-control error"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="Debe ingresar el primer nombre" ForeColor="Red" ValidationGroup="insertarPersona">*</asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="Solo letras MAYÚSC" ForeColor="Blue" ValidationExpression="[A-Z]*" ValidationGroup="insertarPersona">*</asp:RegularExpressionValidator>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("nombre1_persona") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="nombre2" SortExpression="nombre2_persona">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("nombre2_persona") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("nombre2_persona") %>' CssClass="form-control error"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox5" ErrorMessage="Debe ingresar el segundo nombre" ForeColor="Red" ValidationGroup="insertarPersona">*</asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="TextBox5" ErrorMessage="Solo letras MAYÚSC" ForeColor="Blue" ValidationExpression="[A-Z]*" ValidationGroup="insertarPersona">*</asp:RegularExpressionValidator>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("nombre2_persona") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="dirección" SortExpression="direccion_persona">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("direccion_persona") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("direccion_persona") %>' CssClass="form-control error"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox6" ErrorMessage="Debe ingresar la direción" ForeColor="Red" ValidationGroup="insertarPersona">*</asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="TextBox6" ErrorMessage="Solo letras MAYÚSC" ForeColor="Blue" ValidationExpression="[A-Z ]*" ValidationGroup="insertarPersona">*</asp:RegularExpressionValidator>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("direccion_persona") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="celular" SortExpression="celular_persona">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("celular_persona") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox7" runat="server" MaxLength="10" Text='<%# Bind("celular_persona") %>' CssClass="form-control error"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox7" ErrorMessage="Debe ingresar el # celular" ForeColor="Red" ValidationGroup="insertarPersona">*</asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="TextBox7" ErrorMessage="Solo números" ForeColor="Blue" ValidationExpression="^(0|[0-9]\d*)$" ValidationGroup="insertarPersona">*</asp:RegularExpressionValidator>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("celular_persona") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="teléfono" SortExpression="telefono_persona">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("telefono_persona") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox8" runat="server" MaxLength="10" Text='<%# Bind("telefono_persona") %>' CssClass="form-control error"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBox8" ErrorMessage="Debe ingresar el # de teléfono" ForeColor="Red" ValidationGroup="insertarPersona">*</asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ControlToValidate="TextBox8" ErrorMessage="Solo números" ForeColor="Blue" ValidationExpression="^(0|[0-9]\d*)$" ValidationGroup="insertarPersona">*</asp:RegularExpressionValidator>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label10" runat="server" Text='<%# Bind("telefono_persona") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="email" SortExpression="email_persona">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("email_persona") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("email_persona") %>' CssClass="form-control error" onblur="confirmacion();"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TextBox9" ErrorMessage="Debe ingresar el correo" ForeColor="Red" ValidationGroup="insertarPersona">*</asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ControlToValidate="TextBox9" ErrorMessage="Correo no válido" ForeColor="Blue" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="insertarPersona">*</asp:RegularExpressionValidator>
                                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="insertarPersona" />
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label11" runat="server" Text='<%# Bind("email_persona") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:BoundField DataField="creacion_persona" HeaderText="creación" SortExpression="creacion_persona" Visible="False" />
                                <asp:BoundField DataField="actualizacion_persona" HeaderText="actualizacion_persona" SortExpression="actualizacion_persona" Visible="False" />
                                <asp:BoundField DataField="estado_persona" HeaderText="estado_persona" SortExpression="estado_persona" Visible="False" />
                                <asp:TemplateField ShowHeader="False">
                                    <InsertItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Insert" CssClass="btn btn-primary" Text="Insertar" ValidationGroup="insertarPersona"></asp:LinkButton>
                                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancelar" CssClass="btn btn-success" Text="Cancelar" PostBackUrl="~/Login.aspx"></asp:LinkButton>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="New" Text="New"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Fields>
                        </asp:DetailsView>
                </div>

            </div>
        </section>
    </div>

    <div class="col-lg-7">
        Registre su información, y verifique que sea la correcta.
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <div id="myCarousel" class="carousel slide">
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
                <li data-target="#myCarousel" data-slide-to="3"></li>
                <li data-target="#myCarousel" data-slide-to="4"></li>
            </ol>
            <!-- Carousel items -->
            <div class="carousel-inner">
                <div class="active item">
                    <img src="img/blue.jpg" alt="banner1" />
                </div>
                <div class="item">
                    <img src="img/purple.jpg" alt="banner2" />
                </div>
                <div class="item">
                    <img src="img/red.jpg" alt="banner3" />
                </div>
                <div class="item">
                    <img src="img/blue.jpg" alt="banner4" />
                </div>
                <div class="item">
                    <img src="img/purple.jpg" alt="banner5" />
                </div>

            </div>
            <!-- Carousel nav -->
            <a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
            <a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
        </div>
    </div>




    <asp:SqlDataSource ID="sqldsPersona" runat="server" ConnectionString="<%$ ConnectionStrings:gestionHoteleraConnectionString %>" DeleteCommand="UPDATE tbl_persona SET estado_persona = 'I' WHERE (id_persona = @original_id_persona)" InsertCommand="INSERT INTO [tbl_persona] ([id_identificacion], [id_tipopersona], [numero_identificacionpersona], [apellido1_persona], [apellido2_persona], [nombre1_persona], [nombre2_persona], [direccion_persona], [celular_persona], [telefono_persona], [email_persona], [creacion_persona], [actualizacion_persona], [estado_persona]) VALUES (@id_identificacion, @id_tipopersona, @numero_identificacionpersona, @apellido1_persona, @apellido2_persona, @nombre1_persona, @nombre2_persona, @direccion_persona, @celular_persona, @telefono_persona, @email_persona, GETDATE(), @actualizacion_persona, 'A')" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT tbl_persona.id_persona, tbl_persona.id_identificacion, tbl_persona.id_tipopersona, tbl_persona.numero_identificacionpersona, tbl_persona.apellido1_persona, tbl_persona.apellido2_persona, tbl_persona.nombre1_persona, tbl_persona.nombre2_persona, tbl_persona.direccion_persona, tbl_persona.celular_persona, tbl_persona.telefono_persona, tbl_persona.email_persona, tbl_persona.creacion_persona, tbl_persona.actualizacion_persona, tbl_persona.estado_persona, tbl_identificacion.descripcion_identificacion, tbl_tipo_persona.descripcion_tipopersona FROM tbl_persona INNER JOIN tbl_identificacion ON tbl_persona.id_identificacion = tbl_identificacion.id_identificacion INNER JOIN tbl_tipo_persona ON tbl_persona.id_tipopersona = tbl_tipo_persona.id_tipopersona WHERE (tbl_persona.estado_persona = @estado_persona)" UpdateCommand="UPDATE [tbl_persona] SET [id_identificacion] = @id_identificacion, [id_tipopersona] = @id_tipopersona, [numero_identificacionpersona] = @numero_identificacionpersona, [apellido1_persona] = @apellido1_persona, [apellido2_persona] = @apellido2_persona, [nombre1_persona] = @nombre1_persona, [nombre2_persona] = @nombre2_persona, [direccion_persona] = @direccion_persona, [celular_persona] = @celular_persona, [telefono_persona] = @telefono_persona, [email_persona] = @email_persona, [creacion_persona] = @creacion_persona, [actualizacion_persona] = GETDATE(), [estado_persona] = @estado_persona WHERE [id_persona] = @original_id_persona">
        <DeleteParameters>
            <asp:Parameter Name="original_id_persona" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="id_identificacion" Type="Int32" />
            <asp:Parameter Name="id_tipopersona" Type="Int32" />
            <asp:Parameter Name="numero_identificacionpersona" Type="String" />
            <asp:Parameter Name="apellido1_persona" Type="String" />
            <asp:Parameter Name="apellido2_persona" Type="String" />
            <asp:Parameter Name="nombre1_persona" Type="String" />
            <asp:Parameter Name="nombre2_persona" Type="String" />
            <asp:Parameter Name="direccion_persona" Type="String" />
            <asp:Parameter Name="celular_persona" Type="String" />
            <asp:Parameter Name="telefono_persona" Type="String" />
            <asp:Parameter Name="email_persona" Type="String" />
            <asp:Parameter Name="actualizacion_persona" Type="DateTime" />
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter DefaultValue="A" Name="estado_persona" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="id_identificacion" Type="Int32" />
            <asp:Parameter Name="id_tipopersona" Type="Int32" />
            <asp:Parameter Name="numero_identificacionpersona" Type="String" />
            <asp:Parameter Name="apellido1_persona" Type="String" />
            <asp:Parameter Name="apellido2_persona" Type="String" />
            <asp:Parameter Name="nombre1_persona" Type="String" />
            <asp:Parameter Name="nombre2_persona" Type="String" />
            <asp:Parameter Name="direccion_persona" Type="String" />
            <asp:Parameter Name="celular_persona" Type="String" />
            <asp:Parameter Name="telefono_persona" Type="String" />
            <asp:Parameter Name="email_persona" Type="String" />
            <asp:Parameter Name="creacion_persona" Type="DateTime" />
            <asp:Parameter Name="estado_persona" Type="String" />
            <asp:Parameter Name="original_id_persona" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>


    </form>

     





    <%-- <div class="text-right">
        <div class="credits">
            <!--
            All the links in the footer should remain intact.
            You can delete the links only if you purchased the pro version.
            Licensing information: https://bootstrapmade.com/license/
            Purchase the pro version form: https://bootstrapmade.com/buy/?theme=NiceAdmin
          -->
            Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
        </div>
    </div>--%>
</body>
</html>
