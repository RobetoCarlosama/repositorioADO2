<%@ Page Title="" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="WFReservarCliente.aspx.cs" Inherits="GestionHotelera.WFReservarCliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>ReservarCliente</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Script para Cconfirmar datos y redireccionar paginas -->
    <script type="text/javascript">
        function confirmacionReserva() {
            var answer = confirm("¿Esta seguro que desea continuar con los datos selecionados?")
            if (answer) {
                alert("Reserva gurdada correctamente")
                window.location.href = "WFDetalleReservaCliente.aspx";
            }
            else {
                alert("Verifique la información")
            }

            return false;
        }
    </script>

    <div class="col-lg-5">
        <br />
        <br />
        <br />
        <br />
        <br />
        
        <section class="panel">

            <header class="panel-heading">
                Realizar Reserva
            </header>
            <div class="panel-body">
                <div class="form">
                    

                        <asp:DetailsView ID="DetailsView1" runat="server" Height="100%" Width="100%" AutoGenerateRows="False" DataKeyNames="id_reservacion" DataSourceID="sqldsReservacion" DefaultMode="Insert" CssClass="table-responsive table-striped table-advance table-hover" GridLines="None" HorizontalAlign="Center">
                                <Fields>
                                    <asp:BoundField DataField="id_reservacion" HeaderText="id_reservacion" InsertVisible="False" ReadOnly="True" SortExpression="id_reservacion" Visible="False" />
                                    <asp:TemplateField HeaderText="número de habitación" SortExpression="numero_habitacion">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("numero_habitacion") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="sqldsListarNumHabitacionInsertar" DataTextField="numero_habitacion" DataValueField="id_habitacion" SelectedValue='<%# Bind("id_habitacion") %>' CssClass="form-control error">
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="sqldsListarNumHabitacionInsertar" runat="server" ConnectionString="<%$ ConnectionStrings:gestionHoteleraConnectionString %>" SelectCommand="SELECT [id_habitacion], [numero_habitacion] FROM [tbl_habitacion] WHERE (([estado_habitacion] = @estado_habitacion) AND ([disponibilidad_habitacion] = @disponibilidad_habitacion))">
                                                <SelectParameters>
                                                    <asp:Parameter DefaultValue="A" Name="estado_habitacion" Type="String" />
                                                    <asp:Parameter DefaultValue="DISPONIBLE" Name="disponibilidad_habitacion" Type="String" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("numero_habitacion") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="id_habitacion" HeaderText="id_habitacion" SortExpression="id_habitacion" Visible="False" />
                                    <asp:TemplateField HeaderText="Usuario" SortExpression="Usuario">
                                        <EditItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Usuario") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="sqldsListarUsuariosInsertar" DataTextField="Usuario" DataValueField="id_usuario" SelectedValue='<%# Bind("id_usuario") %>' CssClass="form-control error">
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="sqldsListarUsuariosInsertar" runat="server" ConnectionString="<%$ ConnectionStrings:gestionHoteleraConnectionString %>" SelectCommand="SELECT tbl_usuario.id_usuario, tbl_persona.apellido1_persona + ' - ' + tbl_persona.nombre1_persona + ' : ' + tbl_usuario.nick_usuario AS Usuario FROM tbl_usuario INNER JOIN tbl_persona ON tbl_usuario.id_persona = tbl_persona.id_persona WHERE (tbl_usuario.estado_usuario = @estado_usuario) AND (tbl_persona.id_tipopersona = @id_tipopersona)">
                                                <SelectParameters>
                                                    <asp:Parameter DefaultValue="A" Name="estado_usuario" Type="String" />
                                                    <asp:Parameter DefaultValue="3" Name="id_tipopersona" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("Usuario") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="id_usuario" HeaderText="id_usuario" SortExpression="id_usuario" Visible="False" />
                                    <asp:TemplateField HeaderText="fecha de entrada" SortExpression="fechaentrada_reservacion">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("fechaentrada_reservacion") %>'></asp:TextBox>

                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("fechaentrada_reservacion") %>' CssClass="form-control error"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender ID="TextBox1_CalendarExtender" runat="server" TargetControlID="TextBox1" Format="dd/MM/yyyy" StartDate="<%# DateTime.Now.Date %>" CssClass="black" />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Debe seleccionar la fecha de entrada" ValidationGroup="insertarReservacion" ForeColor="Red" CssClass="black">*</asp:RequiredFieldValidator>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("fechaentrada_reservacion") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="fecha de salida" SortExpression="fechasalida_reservacion">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("fechasalida_reservacion") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("fechasalida_reservacion") %>' CssClass="form-control error"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender ID="TextBox2_CalendarExtender" runat="server" TargetControlID="TextBox2" Format="dd/MM/yyyy" StartDate="<%# DateTime.Now.Date %>" CssClass="black" />

                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Debe selecionar la fecha de salida" ForeColor="Red" ValidationGroup="insertarReservacion">*</asp:RequiredFieldValidator>
                                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="insertarReservacion" />

                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("fechasalida_reservacion") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="creacion_reservacion" HeaderText="creacion_reservacion" SortExpression="creacion_reservacion" Visible="False" />
                                    <asp:BoundField DataField="actualizacion_reservacion" HeaderText="actualizacion_reservacion" SortExpression="actualizacion_reservacion" Visible="False" />
                                    <asp:BoundField DataField="estado_reservacion" HeaderText="estado_reservacion" SortExpression="estado_reservacion" Visible="False" />
                                    <asp:TemplateField ShowHeader="False">
                                        <InsertItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Insert" CssClass="btn btn-primary" Text="Insertar" ValidationGroup="insertarReservacion" PostBackUrl="~/WFDetalleReservaCliente.aspx" OnClientClick="return confirm('¿Seguro que desea continuar con los datos selecionados?');"></asp:LinkButton>
                                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="btn btn-success" Text="Cancelar"></asp:LinkButton>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="New" Text="New"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Fields>
                            </asp:DetailsView>

                        <asp:SqlDataSource ID="sqldsReservacion" runat="server" ConnectionString="<%$ ConnectionStrings:gestionHoteleraConnectionString %>" DeleteCommand="UPDATE [tbl_reservacion] SET [estado_reservacion] ='I' WHERE [id_reservacion] = @id_reservacion" InsertCommand="INSERT INTO [tbl_reservacion] ([id_habitacion], [id_usuario], [fechaentrada_reservacion], [fechasalida_reservacion], [creacion_reservacion], [actualizacion_reservacion], [estado_reservacion]) VALUES (@id_habitacion, @id_usuario, @fechaentrada_reservacion, @fechasalida_reservacion, GETDATE(), @actualizacion_reservacion, 'A')" SelectCommand="SELECT tbl_reservacion.id_reservacion, tbl_reservacion.id_habitacion, tbl_reservacion.id_usuario, tbl_reservacion.fechaentrada_reservacion, tbl_reservacion.fechasalida_reservacion, tbl_reservacion.creacion_reservacion, tbl_reservacion.actualizacion_reservacion, tbl_reservacion.estado_reservacion, tbl_habitacion.numero_habitacion, tbl_persona.apellido1_persona + ' -' + tbl_persona.apellido2_persona + ' : ' + tbl_usuario.nick_usuario AS Usuario FROM tbl_reservacion INNER JOIN tbl_habitacion ON tbl_reservacion.id_habitacion = tbl_habitacion.id_habitacion INNER JOIN tbl_usuario ON tbl_reservacion.id_usuario = tbl_usuario.id_usuario INNER JOIN tbl_persona ON tbl_usuario.id_persona = tbl_persona.id_persona WHERE (tbl_reservacion.estado_reservacion = @estado_reservacion)" UpdateCommand="UPDATE [tbl_reservacion] SET [id_habitacion] = @id_habitacion, [id_usuario] = @id_usuario, [fechaentrada_reservacion] = @fechaentrada_reservacion, [fechasalida_reservacion] = @fechasalida_reservacion, [creacion_reservacion] = @creacion_reservacion, [actualizacion_reservacion] = GETDATE(), [estado_reservacion] = @estado_reservacion WHERE [id_reservacion] = @id_reservacion">
                <DeleteParameters>
                    <asp:Parameter Name="id_reservacion" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="id_habitacion" Type="Int32" />
                    <asp:Parameter Name="id_usuario" Type="Int32" />
                    <asp:Parameter Name="fechaentrada_reservacion" Type="DateTime" />
                    <asp:Parameter Name="fechasalida_reservacion" Type="DateTime" />
                    <asp:Parameter Name="actualizacion_reservacion" Type="DateTime" />
                </InsertParameters>
                <SelectParameters>
                    <asp:Parameter DefaultValue="A" Name="estado_reservacion" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="id_habitacion" Type="Int32" />
                    <asp:Parameter Name="id_usuario" Type="Int32" />
                    <asp:Parameter Name="fechaentrada_reservacion" Type="DateTime" />
                    <asp:Parameter Name="fechasalida_reservacion" Type="DateTime" />
                    <asp:Parameter Name="creacion_reservacion" Type="DateTime" />
                    <asp:Parameter Name="estado_reservacion" Type="String" />
                    <asp:Parameter Name="id_reservacion" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
                </div>

            </div>
            
        </section>
    </div>

     <div class="col-md-7 portlets">
        <div class="panel panel-default" style="margin: 10px;">
            <div class="panel-heading">Calendario</div>
            <div class="panel-body">
                <div id="calendar" class="calendar">
                    <div class="calendar-header panel panel-default">
                        <table>
                            <%--<th class="prev"><span class="glyphicon glyphicon-chevron-left"></span></th>
                            <th class="year-title year-neighbor2 hidden-sm hidden-xs">2017</th>
                            <th class="year-title year-neighbor hidden-xs">2018</th>--%>
                            <th class="year-title">2019</th>
                            <%--<th class="year-title year-neighbor hidden-xs">2020</th>
                            <th class="year-title year-neighbor2 hidden-sm hidden-xs">2021</th>--%>
                            <th class="next"><span class="glyphicon glyphicon-chevron-right"></span></th>
                        </table>
                    </div>
                    <div class="months-container" style="display: block;">
                        <div class="month-container col-xs-4">
                            <table class="month">
                                <thead>
                                    <tr>
                                        <th class="month-title" colspan="7">January</th>
                                    </tr>
                                    <tr>
                                        <th class="day-header">Su</th>
                                        <th class="day-header">Mo</th>
                                        <th class="day-header">Tu</th>
                                        <th class="day-header">We</th>
                                        <th class="day-header">Th</th>
                                        <th class="day-header">Fr</th>
                                        <th class="day-header">Sa</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="day old"></td>
                                        <td class="day old"></td>
                                        <td class="day">
                                            <div class="day-content">1</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">2</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">3</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">4</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">5</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="day">
                                            <div class="day-content">6</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">7</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">8</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">9</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">10</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">11</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">12</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="day">
                                            <div class="day-content">13</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">14</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">15</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">16</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">17</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">18</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">19</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="day">
                                            <div class="day-content">20</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">21</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">22</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">23</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">24</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">25</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">26</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="day">
                                            <div class="day-content">27</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">28</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">29</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">30</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">31</div>
                                        </td>
                                        <td class="day new"></td>
                                        <td class="day new"></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="month-container col-xs-4">
                            <table class="month">
                                <thead>
                                    <tr>
                                        <th class="month-title" colspan="7">February</th>
                                    </tr>
                                    <tr>
                                        <th class="day-header">Su</th>
                                        <th class="day-header">Mo</th>
                                        <th class="day-header">Tu</th>
                                        <th class="day-header">We</th>
                                        <th class="day-header">Th</th>
                                        <th class="day-header">Fr</th>
                                        <th class="day-header">Sa</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="day old"></td>
                                        <td class="day old"></td>
                                        <td class="day old"></td>
                                        <td class="day old"></td>
                                        <td class="day old"></td>
                                        <td class="day">
                                            <div class="day-content">1</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">2</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="day">
                                            <div class="day-content">3</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">4</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">5</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">6</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">7</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">8</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">9</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="day">
                                            <div class="day-content">10</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">11</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">12</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">13</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">14</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">15</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">16</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="day">
                                            <div class="day-content">17</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">18</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">19</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">20</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">21</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">22</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">23</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="day">
                                            <div class="day-content">24</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">25</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">26</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">27</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">28</div>
                                        </td>
                                        <td class="day new"></td>
                                        <td class="day new"></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="month-container col-xs-4">
                            <table class="month">
                                <thead>
                                    <tr>
                                        <th class="month-title" colspan="7">March</th>
                                    </tr>
                                    <tr>
                                        <th class="day-header">Su</th>
                                        <th class="day-header">Mo</th>
                                        <th class="day-header">Tu</th>
                                        <th class="day-header">We</th>
                                        <th class="day-header">Th</th>
                                        <th class="day-header">Fr</th>
                                        <th class="day-header">Sa</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="day old"></td>
                                        <td class="day old"></td>
                                        <td class="day old"></td>
                                        <td class="day old"></td>
                                        <td class="day old"></td>
                                        <td class="day">
                                            <div class="day-content">1</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">2</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="day">
                                            <div class="day-content">3</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">4</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">5</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">6</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">7</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">8</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">9</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="day">
                                            <div class="day-content">10</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">11</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">12</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">13</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">14</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">15</div>
                                        </td>
                                        <td class="day" style="box-shadow: rgb(156, 183, 3) 0px -4px 0px 0px inset;">
                                            <div class="day-content">16</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="day" style="box-shadow: rgb(156, 183, 3) 0px -4px 0px 0px inset;">
                                            <div class="day-content">17</div>
                                        </td>
                                        <td class="day" style="box-shadow: rgb(156, 183, 3) 0px -4px 0px 0px inset;">
                                            <div class="day-content">18</div>
                                        </td>
                                        <td class="day" style="box-shadow: rgb(156, 183, 3) 0px -4px 0px 0px inset;">
                                            <div class="day-content">19</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">20</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">21</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">22</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">23</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="day">
                                            <div class="day-content">24</div>
                                        </td>
                                        <td class="day" style="box-shadow: rgb(44, 143, 201) 0px -4px 0px 0px inset;">
                                            <div class="day-content">25</div>
                                        </td>
                                        <td class="day" style="box-shadow: rgb(44, 143, 201) 0px -4px 0px 0px inset;">
                                            <div class="day-content">26</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">27</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">28</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">29</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">30</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="day">
                                            <div class="day-content">31</div>
                                        </td>
                                        <td class="day new"></td>
                                        <td class="day new"></td>
                                        <td class="day new"></td>
                                        <td class="day new"></td>
                                        <td class="day new"></td>
                                        <td class="day new"></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="month-container col-xs-4">
                            <table class="month">
                                <thead>
                                    <tr>
                                        <th class="month-title" colspan="7">April</th>
                                    </tr>
                                    <tr>
                                        <th class="day-header">Su</th>
                                        <th class="day-header">Mo</th>
                                        <th class="day-header">Tu</th>
                                        <th class="day-header">We</th>
                                        <th class="day-header">Th</th>
                                        <th class="day-header">Fr</th>
                                        <th class="day-header">Sa</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="day old"></td>
                                        <td class="day">
                                            <div class="day-content">1</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">2</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">3</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">4</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">5</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">6</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="day">
                                            <div class="day-content">7</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">8</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">9</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">10</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">11</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">12</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">13</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="day">
                                            <div class="day-content">14</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">15</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">16</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">17</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">18</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">19</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">20</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="day">
                                            <div class="day-content">21</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">22</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">23</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">24</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">25</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">26</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">27</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="day">
                                            <div class="day-content">28</div>
                                        </td>
                                        <td class="day" style="box-shadow: rgb(245, 187, 0) 0px -4px 0px 0px inset;">
                                            <div class="day-content">29</div>
                                        </td>
                                        <td class="day" style="box-shadow: rgb(245, 187, 0) 0px -4px 0px 0px inset;">
                                            <div class="day-content">30</div>
                                        </td>
                                        <td class="day new"></td>
                                        <td class="day new"></td>
                                        <td class="day new"></td>
                                        <td class="day new"></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="month-container col-xs-4">
                            <table class="month">
                                <thead>
                                    <tr>
                                        <th class="month-title" colspan="7">May</th>
                                    </tr>
                                    <tr>
                                        <th class="day-header">Su</th>
                                        <th class="day-header">Mo</th>
                                        <th class="day-header">Tu</th>
                                        <th class="day-header">We</th>
                                        <th class="day-header">Th</th>
                                        <th class="day-header">Fr</th>
                                        <th class="day-header">Sa</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="day old"></td>
                                        <td class="day old"></td>
                                        <td class="day old"></td>
                                        <td class="day" style="box-shadow: rgb(245, 187, 0) 0px -4px 0px 0px inset;">
                                            <div class="day-content">1</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">2</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">3</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">4</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="day">
                                            <div class="day-content">5</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">6</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">7</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">8</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">9</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">10</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">11</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="day">
                                            <div class="day-content">12</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">13</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">14</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">15</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">16</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">17</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">18</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="day">
                                            <div class="day-content">19</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">20</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">21</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">22</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">23</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">24</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">25</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="day">
                                            <div class="day-content">26</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">27</div>
                                        </td>
                                        <td class="day" style="box-shadow: rgb(44, 143, 201) 0px -4px 0px 0px inset;">
                                            <div class="day-content">28</div>
                                        </td>
                                        <td class="day" style="box-shadow: rgb(44, 143, 201) 0px -4px 0px 0px inset;">
                                            <div class="day-content">29</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">30</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">31</div>
                                        </td>
                                        <td class="day new"></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="month-container col-xs-4">
                            <table class="month">
                                <thead>
                                    <tr>
                                        <th class="month-title" colspan="7">June</th>
                                    </tr>
                                    <tr>
                                        <th class="day-header">Su</th>
                                        <th class="day-header">Mo</th>
                                        <th class="day-header">Tu</th>
                                        <th class="day-header">We</th>
                                        <th class="day-header">Th</th>
                                        <th class="day-header">Fr</th>
                                        <th class="day-header">Sa</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="day old"></td>
                                        <td class="day old"></td>
                                        <td class="day old"></td>
                                        <td class="day old"></td>
                                        <td class="day old"></td>
                                        <td class="day old"></td>
                                        <td class="day">
                                            <div class="day-content">1</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="day">
                                            <div class="day-content">2</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">3</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">4</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">5</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">6</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">7</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">8</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="day">
                                            <div class="day-content">9</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">10</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">11</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">12</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">13</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">14</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">15</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="day">
                                            <div class="day-content">16</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">17</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">18</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">19</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">20</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">21</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">22</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="day">
                                            <div class="day-content">23</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">24</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">25</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">26</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">27</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">28</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">29</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="day">
                                            <div class="day-content">30</div>
                                        </td>
                                        <td class="day new"></td>
                                        <td class="day new"></td>
                                        <td class="day new"></td>
                                        <td class="day new"></td>
                                        <td class="day new"></td>
                                        <td class="day new"></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="month-container col-xs-4">
                            <table class="month">
                                <thead>
                                    <tr>
                                        <th class="month-title" colspan="7">July</th>
                                    </tr>
                                    <tr>
                                        <th class="day-header">Su</th>
                                        <th class="day-header">Mo</th>
                                        <th class="day-header">Tu</th>
                                        <th class="day-header">We</th>
                                        <th class="day-header">Th</th>
                                        <th class="day-header">Fr</th>
                                        <th class="day-header">Sa</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="day old"></td>
                                        <td class="day">
                                            <div class="day-content">1</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">2</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">3</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">4</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">5</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">6</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="day">
                                            <div class="day-content">7</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">8</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">9</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">10</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">11</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">12</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">13</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="day">
                                            <div class="day-content">14</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">15</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">16</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">17</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">18</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">19</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">20</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="day">
                                            <div class="day-content">21</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">22</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">23</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">24</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">25</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">26</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">27</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="day">
                                            <div class="day-content">28</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">29</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">30</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">31</div>
                                        </td>
                                        <td class="day new"></td>
                                        <td class="day new"></td>
                                        <td class="day new"></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="month-container col-xs-4">
                            <table class="month">
                                <thead>
                                    <tr>
                                        <th class="month-title" colspan="7">August</th>
                                    </tr>
                                    <tr>
                                        <th class="day-header">Su</th>
                                        <th class="day-header">Mo</th>
                                        <th class="day-header">Tu</th>
                                        <th class="day-header">We</th>
                                        <th class="day-header">Th</th>
                                        <th class="day-header">Fr</th>
                                        <th class="day-header">Sa</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="day old"></td>
                                        <td class="day old"></td>
                                        <td class="day old"></td>
                                        <td class="day old"></td>
                                        <td class="day">
                                            <div class="day-content">1</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">2</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">3</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="day">
                                            <div class="day-content">4</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">5</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">6</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">7</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">8</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">9</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">10</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="day">
                                            <div class="day-content">11</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">12</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">13</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">14</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">15</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">16</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">17</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="day">
                                            <div class="day-content">18</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">19</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">20</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">21</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">22</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">23</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">24</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="day" style="box-shadow: rgb(156, 183, 3) 0px -4px 0px 0px inset;">
                                            <div class="day-content">25</div>
                                        </td>
                                        <td class="day" style="box-shadow: rgb(156, 183, 3) 0px -4px 0px 0px inset;">
                                            <div class="day-content">26</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">27</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">28</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">29</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">30</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">31</div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="month-container col-xs-4">
                            <table class="month">
                                <thead>
                                    <tr>
                                        <th class="month-title" colspan="7">September</th>
                                    </tr>
                                    <tr>
                                        <th class="day-header">Su</th>
                                        <th class="day-header">Mo</th>
                                        <th class="day-header">Tu</th>
                                        <th class="day-header">We</th>
                                        <th class="day-header">Th</th>
                                        <th class="day-header">Fr</th>
                                        <th class="day-header">Sa</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="day" style="box-shadow: rgb(255, 74, 50) 0px -4px 0px 0px inset;">
                                            <div class="day-content">1</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">2</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">3</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">4</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">5</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">6</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">7</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="day">
                                            <div class="day-content">8</div>
                                        </td>
                                        <td class="day" style="box-shadow: rgb(181, 108, 226) 0px -4px 0px 0px inset;">
                                            <div class="day-content">9</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">10</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">11</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">12</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">13</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">14</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="day">
                                            <div class="day-content">15</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">16</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">17</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">18</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">19</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">20</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">21</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="day">
                                            <div class="day-content">22</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">23</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">24</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">25</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">26</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">27</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">28</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="day">
                                            <div class="day-content">29</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">30</div>
                                        </td>
                                        <td class="day new"></td>
                                        <td class="day new"></td>
                                        <td class="day new"></td>
                                        <td class="day new"></td>
                                        <td class="day new"></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="month-container col-xs-4">
                            <table class="month">
                                <thead>
                                    <tr>
                                        <th class="month-title" colspan="7">October</th>
                                    </tr>
                                    <tr>
                                        <th class="day-header">Su</th>
                                        <th class="day-header">Mo</th>
                                        <th class="day-header">Tu</th>
                                        <th class="day-header">We</th>
                                        <th class="day-header">Th</th>
                                        <th class="day-header">Fr</th>
                                        <th class="day-header">Sa</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="day old"></td>
                                        <td class="day old"></td>
                                        <td class="day">
                                            <div class="day-content">1</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">2</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">3</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">4</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">5</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="day">
                                            <div class="day-content">6</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">7</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">8</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">9</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">10</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">11</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">12</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="day">
                                            <div class="day-content">13</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">14</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">15</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">16</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">17</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">18</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">19</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="day">
                                            <div class="day-content">20</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">21</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">22</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">23</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">24</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">25</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">26</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="day">
                                            <div class="day-content">27</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">28</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">29</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">30</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">31</div>
                                        </td>
                                        <td class="day new"></td>
                                        <td class="day new"></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="month-container col-xs-4">
                            <table class="month">
                                <thead>
                                    <tr>
                                        <th class="month-title" colspan="7">November</th>
                                    </tr>
                                    <tr>
                                        <th class="day-header">Su</th>
                                        <th class="day-header">Mo</th>
                                        <th class="day-header">Tu</th>
                                        <th class="day-header">We</th>
                                        <th class="day-header">Th</th>
                                        <th class="day-header">Fr</th>
                                        <th class="day-header">Sa</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="day old"></td>
                                        <td class="day old"></td>
                                        <td class="day old"></td>
                                        <td class="day old"></td>
                                        <td class="day old"></td>
                                        <td class="day">
                                            <div class="day-content">1</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">2</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="day">
                                            <div class="day-content">3</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">4</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">5</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">6</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">7</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">8</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">9</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="day">
                                            <div class="day-content">10</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">11</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">12</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">13</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">14</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">15</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">16</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="day" style="box-shadow: rgb(69, 165, 151) 0px -2px 0px 0px inset, rgb(255, 74, 50) 0px -4px 0px 0px inset;">
                                            <div class="day-content">17</div>
                                        </td>
                                        <td class="day" style="box-shadow: rgb(69, 165, 151) 0px -4px 0px 0px inset;">
                                            <div class="day-content">18</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">19</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">20</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">21</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">22</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">23</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="day">
                                            <div class="day-content">24</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">25</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">26</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">27</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">28</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">29</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">30</div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="month-container col-xs-4">
                            <table class="month">
                                <thead>
                                    <tr>
                                        <th class="month-title" colspan="7">December</th>
                                    </tr>
                                    <tr>
                                        <th class="day-header">Su</th>
                                        <th class="day-header">Mo</th>
                                        <th class="day-header">Tu</th>
                                        <th class="day-header">We</th>
                                        <th class="day-header">Th</th>
                                        <th class="day-header">Fr</th>
                                        <th class="day-header">Sa</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="day" style="box-shadow: rgb(245, 187, 0) 0px -4px 0px 0px inset;">
                                            <div class="day-content">1</div>
                                        </td>
                                        <td class="day" style="box-shadow: rgb(245, 187, 0) 0px -4px 0px 0px inset;">
                                            <div class="day-content">2</div>
                                        </td>
                                        <td class="day" style="box-shadow: rgb(245, 187, 0) 0px -4px 0px 0px inset;">
                                            <div class="day-content">3</div>
                                        </td>
                                        <td class="day" style="box-shadow: rgb(245, 187, 0) 0px -4px 0px 0px inset;">
                                            <div class="day-content">4</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">5</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">6</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">7</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="day">
                                            <div class="day-content">8</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">9</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">10</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">11</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">12</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">13</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">14</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="day">
                                            <div class="day-content">15</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">16</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">17</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">18</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">19</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">20</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">21</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="day">
                                            <div class="day-content">22</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">23</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">24</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">25</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">26</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">27</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">28</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="day">
                                            <div class="day-content">29</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">30</div>
                                        </td>
                                        <td class="day">
                                            <div class="day-content">31</div>
                                        </td>
                                        <td class="day new"></td>
                                        <td class="day new"></td>
                                        <td class="day new"></td>
                                        <td class="day new"></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

   


</asp:Content>
