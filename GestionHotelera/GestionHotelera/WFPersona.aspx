<%@ Page Title="" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="WFPersona.aspx.cs" Inherits="GestionHotelera.WFPersona" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Persona</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="panel">
        <div class="table-responsive">
            <header class="panel-heading">
                PERSONAS
            </header>
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Nueva persona</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <asp:DetailsView ID="DetailsView1" runat="server" Height="100%" Width="100%" AutoGenerateRows="False" CssClass="table-responsive table-striped table-advance table-hover" DataKeyNames="id_persona" DataSourceID="sqldsPersona" DefaultMode="Insert" GridLines="None" HorizontalAlign="Center">
                                <Fields>
                                    <asp:BoundField DataField="id_persona" HeaderText="id_persona" InsertVisible="False" ReadOnly="True" SortExpression="id_persona" Visible="False" />
                                    <asp:TemplateField HeaderText="IDENTIFICACI&#211;N" SortExpression="descripcion_identificacion">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("descripcion_identificacion") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="sqldsIdentificacionesInsertar" DataTextField="descripcion_identificacion" DataValueField="id_identificacion" SelectedValue='<%# Bind("id_identificacion") %>' Width="100%">
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
                                    <asp:TemplateField HeaderText="NO. IDENTIFICACI&#211;N" SortExpression="numero_identificacionpersona">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("numero_identificacionpersona") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" MaxLength="13" Text='<%# Bind("numero_identificacionpersona") %>'></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Debe ingresar el # de identificación" ForeColor="Red" ValidationGroup="insertarPersona">*</asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Solo números" ForeColor="Blue" ValidationExpression="^(0|[0-9]\d*)$" ValidationGroup="insertarPersona">*</asp:RegularExpressionValidator>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("numero_identificacionpersona") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="id_identificacion" HeaderText="id_identificacion" SortExpression="id_identificacion" Visible="False" />
                                    <asp:TemplateField HeaderText="TIPO DE PERSONA" SortExpression="descripcion_tipopersona">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("descripcion_tipopersona") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="sqldsTipoPersonaInsertar" DataTextField="descripcion_tipopersona" DataValueField="id_tipopersona" SelectedValue='<%# Bind("id_tipopersona") %>' Width="100%">
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="sqldsTipoPersonaInsertar" runat="server" ConnectionString="<%$ ConnectionStrings:gestionHoteleraConnectionString %>" SelectCommand="SELECT [id_tipopersona], [descripcion_tipopersona] FROM [tbl_tipo_persona] WHERE ([estado_tipopersona] = @estado_tipopersona)">
                                                <SelectParameters>
                                                    <asp:Parameter DefaultValue="A" Name="estado_tipopersona" Type="String" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("descripcion_tipopersona") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="id_tipopersona" HeaderText="id_tipopersona" SortExpression="id_tipopersona" Visible="False" />
                                    <asp:TemplateField HeaderText="PRIMER APELLIDO" SortExpression="apellido1_persona">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("apellido1_persona") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" MaxLength="20" Text='<%# Bind("apellido1_persona") %>'></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Debe ingresar el primer apellido" ForeColor="Red" ValidationGroup="insertarPersona">*</asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Solo letras MAYÚSC" ForeColor="Blue" ValidationExpression="[A-Z]*" ValidationGroup="insertarPersona">*</asp:RegularExpressionValidator>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("apellido1_persona") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="SEGUNDO APELLIDO" SortExpression="apellido2_persona">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("apellido2_persona") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("apellido2_persona") %>'></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="Debe ingresar el segundo apellido" ForeColor="Red" ValidationGroup="insertarPersona">*</asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="Solo letras MAYÚSC" ForeColor="Blue" ValidationExpression="[A-Z]*" ValidationGroup="insertarPersona">*</asp:RegularExpressionValidator>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("apellido2_persona") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="PRIMER NOMBRE" SortExpression="nombre1_persona">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("nombre1_persona") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("nombre1_persona") %>'></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="Debe ingresar el primer nombre" ForeColor="Red" ValidationGroup="insertarPersona">*</asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="Solo letras MAYÚSC" ForeColor="Blue" ValidationExpression="[A-Z]*" ValidationGroup="insertarPersona">*</asp:RegularExpressionValidator>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("nombre1_persona") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="SEGUNDO NOMBRE" SortExpression="nombre2_persona">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("nombre2_persona") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("nombre2_persona") %>'></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox5" ErrorMessage="Debe ingresar el segundo nombre" ForeColor="Red" ValidationGroup="insertarPersona">*</asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="TextBox5" ErrorMessage="Solo letras MAYÚSC" ForeColor="Blue" ValidationExpression="[A-Z]*" ValidationGroup="insertarPersona">*</asp:RegularExpressionValidator>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("nombre2_persona") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="DIRECI&#211;N" SortExpression="direccion_persona">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("direccion_persona") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("direccion_persona") %>'></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox6" ErrorMessage="Debe ingresar la direción" ForeColor="Red" ValidationGroup="insertarPersona">*</asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="TextBox6" ErrorMessage="Solo letras MAYÚSC" ForeColor="Blue" ValidationExpression="[A-Z ]*" ValidationGroup="insertarPersona">*</asp:RegularExpressionValidator>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("direccion_persona") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="CELULAR" SortExpression="celular_persona">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("celular_persona") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox7" runat="server" MaxLength="10" Text='<%# Bind("celular_persona") %>'></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox7" ErrorMessage="Debe ingresar el # celular" ForeColor="Red" ValidationGroup="insertarPersona">*</asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="TextBox7" ErrorMessage="Solo números" ForeColor="Blue" ValidationExpression="^(0|[0-9]\d*)$" ValidationGroup="insertarPersona">*</asp:RegularExpressionValidator>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label9" runat="server" Text='<%# Bind("celular_persona") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="TEL&#201;FONO" SortExpression="telefono_persona">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("telefono_persona") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox8" runat="server" MaxLength="10" Text='<%# Bind("telefono_persona") %>'></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBox8" ErrorMessage="Debe ingresar el # de teléfono" ForeColor="Red" ValidationGroup="insertarPersona">*</asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ControlToValidate="TextBox8" ErrorMessage="Solo números" ForeColor="Blue" ValidationExpression="^(0|[0-9]\d*)$" ValidationGroup="insertarPersona">*</asp:RegularExpressionValidator>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label10" runat="server" Text='<%# Bind("telefono_persona") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="E-MAIL" SortExpression="email_persona">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("email_persona") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("email_persona") %>'></asp:TextBox>
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
                                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancelar" CssClass="btn btn-success" Text="Cancel"></asp:LinkButton>
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
             <asp:LinkButton ID="LinkButton3" runat="server" data-target="#exampleModal" data-toggle="modal" CssClass="btn btn-primary">Nuevo <i class="icon_plus_alt2"></i></asp:LinkButton>
            <br /> 
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id_persona" DataSourceID="sqldsPersona" CssClass="table-responsive table-striped table-advance table-hover" GridLines="Vertical" HorizontalAlign="Center" Height="100%" Width="100%" Font-Size="X-Small">
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButtonActualizar" runat="server" CausesValidation="True" CommandName="Update" CssClass="btn btn-success"><i class="icon_check_alt2"></i></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButtonCancelar" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="btn btn-primary"><i class="icon_close_alt2"></i></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButtonEditar" runat="server" CausesValidation="False" CommandName="Edit" CssClass="btn btn-primary"><i class="icon_pencil"></i></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButtonEliminar" runat="server" CausesValidation="False" CommandName="Delete" CssClass="btn btn-danger" OnClientClick="return confirm('¿Seguro que desea eliminar el registro?');"><i class="icon_close_alt2"></i></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="id_persona" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="id_persona" />
                    <asp:TemplateField HeaderText="TIPO-ID" SortExpression="descripcion_identificacion">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="sqldsIentificacionesDDL" DataTextField="descripcion_identificacion" DataValueField="id_identificacion" SelectedValue='<%# Bind("id_identificacion") %>' Width="100%">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="sqldsIentificacionesDDL" runat="server" ConnectionString="<%$ ConnectionStrings:gestionHoteleraConnectionString %>" SelectCommand="SELECT id_identificacion, descripcion_identificacion FROM tbl_identificacion WHERE (estado_identificacion = @estado_identificacion)">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="A" Name="estado_identificacion" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("descripcion_identificacion") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="id_identificacion" HeaderText="id_identificacion" SortExpression="id_identificacion" Visible="False" />
                    <asp:TemplateField HeaderText="TIPO" SortExpression="descripcion_tipopersona">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="sqldsTiposPersonaDDL" DataTextField="descripcion_tipopersona" DataValueField="id_tipopersona" SelectedValue='<%# Bind("id_tipopersona") %>' Width="100%">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="sqldsTiposPersonaDDL" runat="server" ConnectionString="<%$ ConnectionStrings:gestionHoteleraConnectionString %>" SelectCommand="SELECT [id_tipopersona], [descripcion_tipopersona] FROM [tbl_tipo_persona] WHERE ([estado_tipopersona] = @estado_tipopersona)">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="A" Name="estado_tipopersona" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("descripcion_tipopersona") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="id_tipopersona" HeaderText="id_tipopersona" SortExpression="id_tipopersona" Visible="False" />
                    <asp:BoundField DataField="numero_identificacionpersona" HeaderText="NO. ID" SortExpression="numero_identificacionpersona" />
                    <asp:BoundField DataField="apellido1_persona" HeaderText="APELLIDO 1" SortExpression="apellido1_persona" />
                    <asp:BoundField DataField="apellido2_persona" HeaderText="APELLIDO 2" SortExpression="apellido2_persona" />
                    <asp:BoundField DataField="nombre1_persona" HeaderText="NOMBRE 1" SortExpression="nombre1_persona" />
                    <asp:BoundField DataField="nombre2_persona" HeaderText="NOMBRE 2" SortExpression="nombre2_persona" />
                    <asp:BoundField DataField="direccion_persona" HeaderText="DIRECI&#211;N" SortExpression="direccion_persona" />
                    <asp:BoundField DataField="celular_persona" HeaderText="CELULAR" SortExpression="celular_persona" />
                    <asp:BoundField DataField="telefono_persona" HeaderText="TEL&#201;FONO" SortExpression="telefono_persona" />
                    <asp:BoundField DataField="email_persona" HeaderText="E-MAIL" SortExpression="email_persona" />
                    <asp:TemplateField HeaderText="CREACI&#211;N" SortExpression="creacion_persona">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" ReadOnly="True" Text='<%# Bind("creacion_persona") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("creacion_persona") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ACTUALIZACI&#211;N" SortExpression="actualizacion_persona">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" ReadOnly="True" Text='<%# Bind("actualizacion_persona") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("actualizacion_persona") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ESTADO" SortExpression="estado_persona">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" ReadOnly="True" Text='<%# Bind("estado_persona") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("estado_persona") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>


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
        </div>
    </section>
</asp:Content>
