<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WFCrearUsuario.aspx.cs" Inherits="GestionHotelera.WFCrearUsuario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CrearUsuario</title>
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

     <!-- Script para Cconfirmar datos y redireccionar paginas -->
    <script type="text/javascript">
        function confirmacionCreaUsuario() {
            var answer = confirm("¿Esta seguro que desea continuar?")
            if (answer) {
                alert("Datos guardados correctamente")
                window.location.href = "Login.aspx";
                 
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
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <section class="panel">

            <header class="panel-heading">
                Crear Usuario
            </header>
            <div class="panel-body">
                <div class="form">
                    <form class="form-validate form-horizontal" id="feedback_form" method="get" action="" novalidate="novalidate" runat="server">

                        <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="293px" AutoGenerateRows="False" DataKeyNames="id_usuario" DataSourceID="sqldsUsuarios" DefaultMode="Insert" CssClass="form-validate form-horizontal" GridLines="None" HorizontalAlign="Center">
                            <Fields>
                                <asp:BoundField DataField="id_usuario" HeaderText="id_usuario" InsertVisible="False" ReadOnly="True" SortExpression="id_usuario" Visible="False" />
                                <asp:TemplateField HeaderText="Seleccione el usuario" SortExpression="Usuario">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Usuario") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="sqldsListarPersonasInsertar" DataTextField="Usuario" DataValueField="id_persona" SelectedValue='<%# Bind("id_persona") %>' Width="100%" CssClass="form-control error">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="sqldsListarPersonasInsertar" runat="server" ConnectionString="<%$ ConnectionStrings:gestionHoteleraConnectionString %>" SelectCommand="SELECT tbl_persona.id_persona, tbl_persona.apellido1_persona + ' - ' + tbl_persona.nombre1_persona AS Usuario FROM tbl_persona INNER JOIN tbl_tipo_persona ON tbl_persona.id_tipopersona = tbl_tipo_persona.id_tipopersona WHERE (tbl_persona.estado_persona = @estado_persona) AND (tbl_tipo_persona.descripcion_tipopersona = @descripcion_tipopersona)">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="A" Name="estado_persona" Type="String" />
                                                <asp:Parameter DefaultValue="CLIENTE" Name="descripcion_tipopersona" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Usuario") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="id_persona" SortExpression="id_persona" Visible="False">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("id_persona") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("id_persona") %>'></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("id_persona") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Selecione el rol de usuario" SortExpression="descripcion_rol">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("descripcion_rol") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="sqldsRolesInsertar" DataTextField="descripcion_rol" DataValueField="id_rol" SelectedValue='<%# Bind("id_rol") %>' Width="100%" CssClass="form-control error">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="sqldsRolesInsertar" runat="server" ConnectionString="<%$ ConnectionStrings:gestionHoteleraConnectionString %>" SelectCommand="SELECT id_rol, descripcion_rol FROM tbl_rol WHERE (estado_rol = @estado_rol) AND (descripcion_rol = @descripcion_rol)">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="A" Name="estado_rol" Type="String" />
                                                <asp:Parameter DefaultValue="CLIENTE" Name="descripcion_rol" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("descripcion_rol") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="id_rol" HeaderText="id_rol" SortExpression="id_rol" Visible="False" />
                                <asp:TemplateField HeaderText="nick" SortExpression="nick_usuario">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("nick_usuario") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("nick_usuario") %>' CssClass="form-control error"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox4" ErrorMessage="Debe asignar un nick de usuario" ForeColor="Red" ValidationGroup="insertarUsuario">*</asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox4" ErrorMessage="Solo letras MAYÚSC" ForeColor="Blue" ValidationExpression="[A-Z]*" ValidationGroup="insertarUsuario">*</asp:RegularExpressionValidator>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("nick_usuario") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="clave" SortExpression="clave_usuario">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("clave_usuario") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("clave_usuario") %>' CssClass="form-control error"  onblur="confirmacionCreaUsuario();"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox5" ErrorMessage="Debe ingresar una contraseña" ForeColor="Red" ValidationGroup="insertarUsuario">*</asp:RequiredFieldValidator>
                                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="insertarUsuario" />
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("clave_usuario") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="creacion_usuario" HeaderText="creacion_usuario" SortExpression="creacion_usuario" Visible="False" />
                                <asp:BoundField DataField="actualizacion_usuario" HeaderText="actualizacion_usuario" SortExpression="actualizacion_usuario" Visible="False" />
                                <asp:BoundField DataField="estado_usuario" HeaderText="estado_usuario" SortExpression="estado_usuario" Visible="False" />
                                <asp:TemplateField ShowHeader="False">
                                    <InsertItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Insert" Text="Insertar" ValidationGroup="insertarUsuario" CssClass="btn btn-primary"></asp:LinkButton>
                                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" CssClass="btn btn-success" PostBackUrl="~/WFregistro.aspx"></asp:LinkButton>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="New" Text="New"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Fields>
                        </asp:DetailsView>

                        <asp:SqlDataSource ID="sqldsUsuarios" runat="server" ConnectionString="<%$ ConnectionStrings:gestionHoteleraConnectionString %>" DeleteCommand="UPDATE [tbl_usuario] SET [estado_usuario] ='I' WHERE [id_usuario] = @id_usuario" InsertCommand="INSERT INTO [tbl_usuario] ([id_persona], [id_rol], [nick_usuario], [clave_usuario], [creacion_usuario], [actualizacion_usuario], [estado_usuario]) VALUES (@id_persona, @id_rol, @nick_usuario, @clave_usuario, GETDATE(), @actualizacion_usuario, 'A')" SelectCommand="SELECT tbl_usuario.id_usuario, tbl_usuario.id_persona, tbl_usuario.id_rol, tbl_usuario.nick_usuario, tbl_usuario.clave_usuario, tbl_usuario.creacion_usuario, tbl_usuario.actualizacion_usuario, tbl_usuario.estado_usuario, tbl_persona.apellido1_persona + ' - ' + tbl_persona.nombre1_persona AS Usuario, tbl_rol.descripcion_rol FROM tbl_usuario INNER JOIN tbl_persona ON tbl_usuario.id_persona = tbl_persona.id_persona INNER JOIN tbl_rol ON tbl_usuario.id_rol = tbl_rol.id_rol WHERE (tbl_usuario.estado_usuario = @estado_usuario)" UpdateCommand="UPDATE [tbl_usuario] SET [id_persona] = @id_persona, [id_rol] = @id_rol, [nick_usuario] = @nick_usuario, [clave_usuario] = @clave_usuario, [creacion_usuario] = @creacion_usuario, [actualizacion_usuario] = GETDATE(), [estado_usuario] = @estado_usuario WHERE [id_usuario] = @id_usuario">
                            <DeleteParameters>
                                <asp:Parameter Name="id_usuario" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="id_persona" Type="Int32" />
                                <asp:Parameter Name="id_rol" Type="Int32" />
                                <asp:Parameter Name="nick_usuario" Type="String" />
                                <asp:Parameter Name="clave_usuario" Type="String" />
                                <asp:Parameter Name="actualizacion_usuario" Type="DateTime" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:Parameter DefaultValue="A" Name="estado_usuario" Type="String" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="id_persona" Type="Int32" />
                                <asp:Parameter Name="id_rol" Type="Int32" />
                                <asp:Parameter Name="nick_usuario" Type="String" />
                                <asp:Parameter Name="clave_usuario" Type="String" />
                                <asp:Parameter Name="creacion_usuario" Type="DateTime" />
                                <asp:Parameter Name="estado_usuario" Type="String" />
                                <asp:Parameter Name="id_usuario" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                </div>

            </div>
        </section>
    </div>

    <div class="col-lg-7">

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
