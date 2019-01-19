<%@ Page Title="" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="WFControlHabitaciones.aspx.cs" Inherits="GestionHotelera.WFControlHabitaciones" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Control de Habitaciones</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="panel">
        <div class="table-responsive">
            <header class="panel-heading">
                HABITACIONES
            </header>
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Nueva habitación</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="id_habitacion" DataSourceID="sqldsHabitaciones" DefaultMode="Insert" CssClass="table table-striped table-advance table-hover" GridLines="None" HorizontalAlign="Center">
                <Fields>
                    <asp:BoundField DataField="id_habitacion" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="id_habitacion" />
                    <asp:TemplateField HeaderText="tipo habitación" SortExpression="id_tipohabitacion">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("id_tipohabitacion") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="sqldsListarTipoHabitacion" DataTextField="descripcion_tipohabitacion" DataValueField="id_tipohabitacion" SelectedValue='<%# Bind("id_tipohabitacion") %>' Width="100%">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="sqldsListarTipoHabitacion" runat="server" ConnectionString="<%$ ConnectionStrings:gestionHoteleraConnectionString %>" SelectCommand="SELECT [id_tipohabitacion], [descripcion_tipohabitacion] FROM [tbl_tipo_habitacion] WHERE ([estado_tipohabitacion] = @estado_tipohabitacion)">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="A" Name="estado_tipohabitacion" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("id_tipohabitacion") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="hotel" SortExpression="id_hotel">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("id_hotel") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="sqldsListarHoteles" DataTextField="nombre_hotel" DataValueField="id_hotel" Width="100%" SelectedValue='<%# Bind("id_hotel") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="sqldsListarHoteles" runat="server" ConnectionString="<%$ ConnectionStrings:gestionHoteleraConnectionString %>" SelectCommand="SELECT [id_hotel], [nombre_hotel] FROM [tbl_hotel] WHERE ([estado_hotel] = @estado_hotel)">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="A" Name="estado_hotel" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("id_hotel") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="número_habitacion" SortExpression="numero_habitacion">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("numero_habitacion") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" MaxLength="10" Text='<%# Bind("numero_habitacion") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox3" ErrorMessage="Número de habitación, campo requerido" ForeColor="Red">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox3" ErrorMessage="Solo números" ForeColor="Blue" ValidationExpression="^(0|[0-9]\d*)$">*</asp:RegularExpressionValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("numero_habitacion") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ubicación_habitacion" SortExpression="ubicacion_habitacion">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("ubicacion_habitacion") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="DropDownList7" runat="server" SelectedValue='<%# Bind("ubicacion_habitacion") %>'>
                                <asp:ListItem Value="">Seleccione la ubicación</asp:ListItem>
                                <asp:ListItem Value="PRIMER PISO">PRIMER PISO</asp:ListItem>
                                <asp:ListItem Value="SEGUNDO PISO">SEGUNDO PISO</asp:ListItem>
                                <asp:ListItem Value="TERCER PISO">TERCER PISO</asp:ListItem>
                                <asp:ListItem Value="CUARTO PISO">CUARTO PISO</asp:ListItem>
                                <asp:ListItem Value="QUINTO PISO">QUINTO PISO</asp:ListItem>
                            </asp:DropDownList>
                            
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="DropDownList7" ErrorMessage="Seleccione la ubicación" ForeColor="Red">*</asp:RequiredFieldValidator>
                            
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("ubicacion_habitacion") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="disponibilidad_habitación" SortExpression="disponibilidad_habitacion">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("disponibilidad_habitacion") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="DropDownList3" runat="server" SelectedValue='<%# Bind("disponibilidad_habitacion") %>' Width="100%">
                                 <asp:ListItem Value="">Seleccione la disponibilidad</asp:ListItem>
                                <asp:ListItem Value="DISPONIBLE">DISPONIBLE</asp:ListItem>
                                <asp:ListItem Value="RESERVADA">RESERVADA</asp:ListItem>
                                <asp:ListItem Value="OCUPADA">OCUPADA</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Seleccione la disponibilidad" ControlToValidate="DropDownList3" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("disponibilidad_habitacion") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="cracion_habitacion" HeaderText="cracion_habitacion" SortExpression="cracion_habitacion" Visible="False" />
                    <asp:BoundField DataField="actualizacion_habitacion" HeaderText="actualizacion_habitacion" SortExpression="actualizacion_habitacion" Visible="False" />
                    <asp:BoundField DataField="estado_habitacion" HeaderText="estado_habitacion" SortExpression="estado_habitacion" Visible="False" />
                    <asp:BoundField DataField="descripcion_tipohabitacion" HeaderText="descripcion_tipohabitacion" SortExpression="descripcion_tipohabitacion" Visible="False" />
                    <asp:BoundField DataField="nombre_hotel" HeaderText="nombre_hotel" SortExpression="nombre_hotel" Visible="False" />
                    <asp:TemplateField ShowHeader="False">
                        <InsertItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Insert" CssClass="btn btn-primary" Text="Insertar"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="btn btn-success" Text="Cancelar"></asp:LinkButton>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="New" Text="New"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Fields>
            </asp:DetailsView>

                        </div>
                    </div>
                </div>
            </div>
            
            <asp:SqlDataSource ID="sqldsHabitaciones" runat="server" ConflictDetection="CompareAllValues" 
                ConnectionString="<%$ ConnectionStrings:gestionHoteleraConnectionString %>" 
                DeleteCommand="UPDATE [tbl_habitacion] SET  [estado_habitacion] ='I' WHERE [id_habitacion] = @original_id_habitacion " 
                InsertCommand="INSERT INTO [tbl_habitacion] ([id_tipohabitacion], [id_hotel], [numero_habitacion], [ubicacion_habitacion], [disponibilidad_habitacion], [cracion_habitacion], [actualizacion_habitacion], [estado_habitacion]) VALUES (@id_tipohabitacion, @id_hotel, @numero_habitacion, @ubicacion_habitacion, @disponibilidad_habitacion, GETDATE(), @actualizacion_habitacion, 'A')" 
                OldValuesParameterFormatString="original_{0}" 
                SelectCommand="SELECT tbl_habitacion.id_habitacion, tbl_habitacion.id_tipohabitacion, tbl_habitacion.id_hotel, tbl_habitacion.numero_habitacion, tbl_habitacion.ubicacion_habitacion, tbl_habitacion.disponibilidad_habitacion, tbl_habitacion.cracion_habitacion, tbl_habitacion.actualizacion_habitacion, tbl_habitacion.estado_habitacion, tbl_tipo_habitacion.descripcion_tipohabitacion, tbl_hotel.nombre_hotel FROM tbl_habitacion INNER JOIN tbl_tipo_habitacion ON tbl_habitacion.id_tipohabitacion = tbl_tipo_habitacion.id_tipohabitacion INNER JOIN tbl_hotel ON tbl_habitacion.id_hotel = tbl_hotel.id_hotel WHERE (tbl_habitacion.estado_habitacion = @estado_habitacion)" 
                UpdateCommand="UPDATE [tbl_habitacion] 
                SET [id_tipohabitacion] = @id_tipohabitacion, [id_hotel] = @id_hotel, [numero_habitacion] = @numero_habitacion, [ubicacion_habitacion] = @ubicacion_habitacion, [disponibilidad_habitacion] = @disponibilidad_habitacion, [cracion_habitacion] = @cracion_habitacion, [actualizacion_habitacion] = GETDATE(), [estado_habitacion] = 'A' WHERE [id_habitacion] = @original_id_habitacion ">
                <DeleteParameters>
                    <asp:Parameter Name="original_id_habitacion" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="id_tipohabitacion" Type="Int32" />
                    <asp:Parameter Name="id_hotel" Type="Int32" />
                    <asp:Parameter Name="numero_habitacion" Type="Int32" />
                    <asp:Parameter Name="ubicacion_habitacion" Type="String" />
                    <asp:Parameter Name="disponibilidad_habitacion" Type="String" />
                    <asp:Parameter Name="actualizacion_habitacion" Type="DateTime" />
                    <asp:Parameter Name="estado_habitacion" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:Parameter DefaultValue="A" Name="estado_habitacion" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="id_tipohabitacion" Type="Int32" />
                    <asp:Parameter Name="id_hotel" Type="Int32" />
                    <asp:Parameter Name="numero_habitacion" Type="Int32" />
                    <asp:Parameter Name="ubicacion_habitacion" Type="String" />
                    <asp:Parameter Name="disponibilidad_habitacion" Type="String" />
                    <asp:Parameter Name="cracion_habitacion" Type="DateTime" />
                    <asp:Parameter Name="estado_habitacion" Type="String" />
                    <asp:Parameter Name="original_id_habitacion" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <asp:LinkButton ID="LinkButton3" runat="server" data-target="#exampleModal" data-toggle="modal" CssClass="btn btn-primary">Nuevo <i class="icon_plus_alt2"></i></asp:LinkButton>
                       
            <br />
            
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id_habitacion" DataSourceID="sqldsHabitaciones" CssClass="table-responsive table-striped table-advance table-hover" HorizontalAlign="Center" Width="100%" Height="100%" GridLines="None">
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButtonActualizar" runat="server" CommandName="Update" ValidationGroup="actualizaHabitacion" CssClass="btn btn-success"><i class="icon_check_alt2"></i></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButtonCancelar" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="btn btn-primary"><i class="icon_close_alt2"></i></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButtonEditar" runat="server" CausesValidation="False" CommandName="Edit" Text="Editar" CssClass="btn btn-primary"><i class="icon_pencil"></i></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButtonEliminar" runat="server" CausesValidation="False" CommandName="Delete" Text="Eliminar" CssClass="btn btn-danger" OnClientClick="return confirm('¿Seguro que desea eliminar el registro?');"><i class="icon_close_alt2"></i></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="id_habitacion" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="id_habitacion" />
                    <asp:TemplateField HeaderText="hotel" SortExpression="nombre_hotel">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="sqldsListarHotelesActualizar" DataTextField="nombre_hotel" DataValueField="id_hotel" SelectedValue='<%# Bind("id_hotel") %>' Width="100%">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="sqldsListarHotelesActualizar" runat="server" ConnectionString="<%$ ConnectionStrings:gestionHoteleraConnectionString %>" SelectCommand="SELECT [id_hotel], [nombre_hotel] FROM [tbl_hotel] WHERE ([estado_hotel] = @estado_hotel)">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="A" Name="estado_hotel" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("nombre_hotel") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="tipohabitacion" SortExpression="descripcion_tipohabitacion">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="aqldsListarTipoHabitacionesActualizar" DataTextField="descripcion_tipohabitacion" DataValueField="id_tipohabitacion" SelectedValue='<%# Bind("id_tipohabitacion") %>' Width="100%">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="aqldsListarTipoHabitacionesActualizar" runat="server" ConnectionString="<%$ ConnectionStrings:gestionHoteleraConnectionString %>" SelectCommand="SELECT [id_tipohabitacion], [descripcion_tipohabitacion] FROM [tbl_tipo_habitacion] WHERE ([estado_tipohabitacion] = @estado_tipohabitacion)">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="A" Name="estado_tipohabitacion" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("descripcion_tipohabitacion") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="id_tipohabitacion" HeaderText="id_tipohabitacion" SortExpression="id_tipohabitacion" Visible="False" />
                    <asp:BoundField DataField="id_hotel" HeaderText="id_hotel" SortExpression="id_hotel" Visible="False" />
                    <asp:TemplateField HeaderText="número" SortExpression="numero_habitacion">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" MaxLength="10" Text='<%# Bind("numero_habitacion") %>' Width="20px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox1" ErrorMessage="Número de habitación, campo requerido" ForeColor="Red" ValidationGroup="actualizaHabitacion">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox1" ErrorMessage="Solo números" ForeColor="Blue" ValidationExpression="^(0|[0-9]\d*)$" ValidationGroup="actualizaHabitacion">*</asp:RegularExpressionValidator>
                            <asp:ValidationSummary ID="ValidationSummary2" runat="server" ValidationGroup="actualizaHabitacion" ShowMessageBox="True" ShowSummary="False" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("numero_habitacion") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ubicación" SortExpression="ubicacion_habitacion">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("ubicacion_habitacion") %>' MaxLength="30"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox2" ErrorMessage="Ubicación, campo requerido" ForeColor="Red" ValidationGroup="actualizaHabitacion">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="TextBox2" ErrorMessage="Solo letras MAYÚSC" ForeColor="Blue" ValidationExpression="[A-Z ]*" ValidationGroup="actualizaHabitacion">*</asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("ubicacion_habitacion") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="disponibilidad" SortExpression="disponibilidad_habitacion">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList6" runat="server" SelectedValue='<%# Bind("disponibilidad_habitacion") %>'>
                                <asp:ListItem>DISPONIBLE</asp:ListItem>
                                <asp:ListItem>RESERVADA</asp:ListItem>
                                <asp:ListItem>OCUPADA</asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("disponibilidad_habitacion") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="cración" SortExpression="cracion_habitacion">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" ReadOnly="True" Text='<%# Bind("cracion_habitacion") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("cracion_habitacion") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="actualización" SortExpression="actualizacion_habitacion">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" ReadOnly="True" Text='<%# Bind("actualizacion_habitacion") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("actualizacion_habitacion") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="estado" SortExpression="estado_habitacion">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("estado_habitacion") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("estado_habitacion") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

        </div>
    </section>
</asp:Content>
