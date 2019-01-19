<%@ Page Title="" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="WFUsuarios.aspx.cs" Inherits="GestionHotelera.WFUsuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Usuarios</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="panel">
        <div class="table-responsive">
            <header class="panel-heading">
                USUARIOS
            </header>
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Nuevo usuario</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="id_usuario" DataSourceID="sqldsUsuarios" DefaultMode="Insert" CssClass="table table-striped table-advance table-hover" GridLines="None" HorizontalAlign="Center">
                                <Fields>
                                    <asp:BoundField DataField="id_usuario" HeaderText="id_usuario" InsertVisible="False" ReadOnly="True" SortExpression="id_usuario" Visible="False" />
                                    <asp:TemplateField HeaderText="Seleccione el usuario" SortExpression="Usuario">
                                        <EditItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Usuario") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="sqldsListarPersonasInsertar" DataTextField="Usuario" DataValueField="id_persona" SelectedValue='<%# Bind("id_persona") %>' Width="100%">
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="sqldsListarPersonasInsertar" runat="server" ConnectionString="<%$ ConnectionStrings:gestionHoteleraConnectionString %>" SelectCommand="SELECT id_persona, apellido1_persona + ' - ' + nombre1_persona AS Usuario FROM tbl_persona WHERE (estado_persona = @estado_persona)">
                                                <SelectParameters>
                                                    <asp:Parameter DefaultValue="A" Name="estado_persona" Type="String" />
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
                                            <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="sqldsRolesInsertar" DataTextField="descripcion_rol" DataValueField="id_rol" SelectedValue='<%# Bind("id_rol") %>' Width="100%">
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="sqldsRolesInsertar" runat="server" ConnectionString="<%$ ConnectionStrings:gestionHoteleraConnectionString %>" SelectCommand="SELECT [id_rol], [descripcion_rol] FROM [tbl_rol] WHERE ([estado_rol] = @estado_rol)">
                                                <SelectParameters>
                                                    <asp:Parameter DefaultValue="A" Name="estado_rol" Type="String" />
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
                                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("nick_usuario") %>'></asp:TextBox>
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
                                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("clave_usuario") %>'></asp:TextBox>
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
                                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" CssClass="btn btn-success"></asp:LinkButton>
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
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id_usuario" DataSourceID="sqldsUsuarios" CssClass="table-responsive table-striped table-advance table-hover" GridLines="None" Width="100%" Height="100%" HorizontalAlign="Center">
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButtonActualizar" runat="server" CausesValidation="True" CommandName="Update" ValidationGroup="actualizarUsuario" CssClass="btn btn-success"><i class="icon_check_alt2"></i></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButtonCancelar" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" CssClass="btn btn-primary"><i class="icon_close_alt2"></i></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButtonEditar" runat="server" CausesValidation="False" CommandName="Edit" CssClass="btn btn-primary"><i class="icon_pencil"></i></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButtonEliminar" runat="server" CausesValidation="False" CommandName="Delete" CssClass="btn btn-danger" OnClientClick="return confirm('¿Seguro que desea eliminar el registro?');"><i class="icon_close_alt2"></i></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="id_usuario" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="id_usuario" />
                    <asp:TemplateField HeaderText="Usuario" SortExpression="Usuario">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="sqldsListarUsuariosDDL" DataTextField="Usuario" DataValueField="id_persona" SelectedValue='<%# Bind("id_persona") %>' Width="90%">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="sqldsListarUsuariosDDL" runat="server" ConnectionString="<%$ ConnectionStrings:gestionHoteleraConnectionString %>" SelectCommand="SELECT id_persona, apellido1_persona + ' - ' + nombre1_persona AS Usuario FROM tbl_persona WHERE (estado_persona = @estado_persona)">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="A" Name="estado_persona" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Usuario") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="id_persona" SortExpression="id_persona" Visible="False">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("id_persona") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("id_persona") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="rol" SortExpression="descripcion_rol">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="sqldsListarRolesDDL" DataTextField="descripcion_rol" DataValueField="id_rol" SelectedValue='<%# Bind("id_rol") %>' Width="80%">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="sqldsListarRolesDDL" runat="server" ConnectionString="<%$ ConnectionStrings:gestionHoteleraConnectionString %>" SelectCommand="SELECT [id_rol], [descripcion_rol] FROM [tbl_rol] WHERE ([estado_rol] = @estado_rol)">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="A" Name="estado_rol" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("descripcion_rol") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="id_rol" HeaderText="id_rol" SortExpression="id_rol" Visible="False" />
                    <asp:TemplateField HeaderText="nick" SortExpression="nick_usuario">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("nick_usuario") %>' Width="80px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox5" ErrorMessage="Debe ingresar el nick de usuario" ForeColor="Red" ValidationGroup="actualizarUsuario">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox5" ErrorMessage="Solo letras MAYÚSC" ForeColor="Blue" ValidationExpression="[A-Z]*" ValidationGroup="actualizarUsuario">*</asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("nick_usuario") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="clave" SortExpression="clave_usuario">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("clave_usuario") %>' Width="80px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox6" ErrorMessage="Debe ingresar una contraseña" ForeColor="Red" ValidationGroup="actualizarUsuario">*</asp:RequiredFieldValidator>
                            <asp:ValidationSummary ID="ValidationSummary2" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="actualizarUsuario" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("clave_usuario") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="creación" SortExpression="creacion_usuario">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" ReadOnly="True" Text='<%# Bind("creacion_usuario") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("creacion_usuario") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="actualización" SortExpression="actualizacion_usuario">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" ReadOnly="True" Text='<%# Bind("actualizacion_usuario") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("actualizacion_usuario") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="estado" SortExpression="estado_usuario">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" ReadOnly="True" Text='<%# Bind("estado_usuario") %>' Width="30px"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("estado_usuario") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>


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
    </section>

</asp:Content>
