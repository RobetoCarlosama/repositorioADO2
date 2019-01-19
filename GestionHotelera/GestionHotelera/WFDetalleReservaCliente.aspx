<%@ Page Title="" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="WFDetalleReservaCliente.aspx.cs" Inherits="GestionHotelera.WFDetalleReservaCliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>DetalleReservaCliente</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:LinkButton ID="LinkButton3" runat="server" CssClass="btn btn-primary" PostBackUrl="~/WFReservarCliente.aspx">Realizar nueva reserva <i class="icon_plus_alt2"></i></asp:LinkButton>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id_reservacion" DataSourceID="sqldsReservacion" CssClass="table-responsive table-striped table-advance table-hover" GridLines="None" Height="100%" HorizontalAlign="Center" Width="100%">
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButtonActualizar" runat="server" CausesValidation="True" CommandName="Update" CssClass="btn btn-success" ValidationGroup="actualizarReservacion"><i class="icon_check_alt2"></i></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButtonCancelar" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="btn btn-primary"><i class="icon_close_alt2"></i></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButtonEditar" runat="server" CausesValidation="False" CommandName="Edit" CssClass="btn btn-primary"><i class="icon_pencil"></i></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButtonEliminar" runat="server" CausesValidation="False" CommandName="Delete" CssClass="btn btn-danger" OnClientClick="return confirm('¿Seguro que desea eliminar el registro?');"><i class="icon_close_alt2"></i></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="id_reservacion" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="id_reservacion" />
                    <asp:TemplateField HeaderText="#-habitación" SortExpression="numero_habitacion">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="sqldsListarNumHabitacionesDDL" DataTextField="numero_habitacion" DataValueField="id_habitacion" SelectedValue='<%# Bind("id_habitacion") %>' Width="40px">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="sqldsListarNumHabitacionesDDL" runat="server" ConnectionString="<%$ ConnectionStrings:gestionHoteleraConnectionString %>" SelectCommand="SELECT id_habitacion, numero_habitacion FROM tbl_habitacion WHERE (estado_habitacion = @estado_habitacion)">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="A" Name="estado_habitacion" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("numero_habitacion") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="id_habitacion" HeaderText="id_habitacion" SortExpression="id_habitacion" Visible="False" />
                    <asp:TemplateField HeaderText="Usuario" SortExpression="Usuario">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="sqldsListarUsuariosDDL" DataTextField="usuario" DataValueField="id_usuario" SelectedValue='<%# Bind("id_usuario") %>' Width="80%">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="sqldsListarUsuariosDDL" runat="server" ConnectionString="<%$ ConnectionStrings:gestionHoteleraConnectionString %>" SelectCommand="SELECT tbl_usuario.id_usuario, tbl_persona.apellido1_persona + ' - ' + tbl_persona.nombre1_persona + ' : ' + tbl_usuario.nick_usuario AS usuario FROM tbl_usuario INNER JOIN tbl_persona ON tbl_usuario.id_persona = tbl_persona.id_persona WHERE (tbl_usuario.estado_usuario = @estado_usuario)">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="A" Name="estado_usuario" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("Usuario") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="id_usuario" HeaderText="id_usuario" SortExpression="id_usuario" Visible="False" />
                    <asp:TemplateField HeaderText="fecha_entrada" SortExpression="fechaentrada_reservacion">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("fechaentrada_reservacion") %>' Width="95px"></asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="TextBox1_CalendarExtender" runat="server" TargetControlID="TextBox1" Format="dd/MM/yyyy" StartDate="<%# DateTime.Now.Date %>" CssClass="black" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox1" ErrorMessage="Debe selecionar la fecha de entrada" ForeColor="Red" ValidationGroup="actualizarReservacion">*</asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("fechaentrada_reservacion") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="fecha_salida" SortExpression="fechasalida_reservacion">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("fechasalida_reservacion") %>' Width="95px"></asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="TextBox2_CalendarExtender" runat="server" TargetControlID="TextBox2" Format="dd/MM/yyyy" StartDate="<%# DateTime.Now.Date %>" CssClass="black" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox2" ErrorMessage="Debe selecionar la fecha de salida" ForeColor="Red" ValidationGroup="actualizarReservacion">*</asp:RequiredFieldValidator>
                            <asp:ValidationSummary ID="ValidationSummary2" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="actualizarReservacion" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("fechasalida_reservacion") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="creación" SortExpression="creacion_reservacion">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" ReadOnly="True" Text='<%# Bind("creacion_reservacion") %>' Width="95px"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("creacion_reservacion") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="actualización" SortExpression="actualizacion_reservacion">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" ReadOnly="True" Text='<%# Bind("actualizacion_reservacion") %>' Width="95px"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("actualizacion_reservacion") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="estado" SortExpression="estado_reservacion">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" ReadOnly="True" Text='<%# Bind("estado_reservacion") %>' Width="50px"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("estado_reservacion") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
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
</asp:Content>
