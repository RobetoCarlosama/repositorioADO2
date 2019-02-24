<%@ Page Title="" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="WFHotel.aspx.cs" Inherits="GestionHotelera.WFHotel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Hotel</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="panel">
        <div class="table-responsive">
            <header class="panel-heading">
                DATOS HOTEL
            </header>
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Nuevo Hotel</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <asp:DetailsView ID="DetailsView1" runat="server" Height="100%" Width="100%" AutoGenerateRows="False" DataKeyNames="id_hotel" DataSourceID="sqldsHoteles" DefaultMode="Insert" CssClass="table-responsive table-striped table-advance table-hover" GridLines="None" HorizontalAlign="Center">
                <Fields>
                    <asp:BoundField DataField="id_hotel" HeaderText="id_hotel" InsertVisible="False" ReadOnly="True" SortExpression="id_hotel" Visible="False" />
                    <asp:TemplateField HeaderText="SELECIONE LA PROVINCIA" SortExpression="id_provincia">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("id_provincia") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="sqldsListarProvincias" DataTextField="descripcion_provincia" DataValueField="id_provincia" Width="100%" SelectedValue='<%# Bind("id_provincia") %>'>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DropDownList1" ErrorMessage="Provincia, campo requerido" ForeColor="Red">*</asp:RequiredFieldValidator>

                            <asp:SqlDataSource ID="sqldsListarProvincias" runat="server" ConnectionString="<%$ ConnectionStrings:gestionHoteleraConnectionString %>" SelectCommand="SELECT [id_provincia], [descripcion_provincia] FROM [tbl_provincia] WHERE ([estado_provincia] = @estado_provincia)">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="A" Name="estado_provincia" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("id_provincia") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="NOMBRE DE HOTEL" SortExpression="nombre_hotel">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("nombre_hotel") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" MaxLength="40" Text='<%# Bind("nombre_hotel") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Nombre hotel, campo requerido" ForeColor="Red">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox2" ErrorMessage="Solo letras MAYÚSC" ForeColor="Blue" ValidationExpression="[A-Z ]*">*</asp:RegularExpressionValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("nombre_hotel") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="RUC" SortExpression="ruc_hotel">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ruc_hotel") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" MaxLength="13" Text='<%# Bind("ruc_hotel") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="Ruc, campo requerido" ForeColor="Red">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox3" ErrorMessage="Solo números" ForeColor="Blue" ValidationExpression="^(0|[0-9]\d*)$">*</asp:RegularExpressionValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("ruc_hotel") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="DIRECI&#211;N" SortExpression="direccion_hotel">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("direccion_hotel") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" MaxLength="50" Text='<%# Bind("direccion_hotel") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="Direción, campo requerido" ForeColor="Red">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox4" ErrorMessage="Solo letras MAYÚSC" ForeColor="Blue" ValidationExpression="[A-Z ]*">*</asp:RegularExpressionValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("direccion_hotel") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="TEL&#201;FONO" SortExpression="telefono_hotel">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("telefono_hotel") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" MaxLength="10" Text='<%# Bind("telefono_hotel") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox5" ErrorMessage="Teléfono, campo requerido" ForeColor="Red">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="TextBox5" ErrorMessage="Solo números" ForeColor="Blue" ValidationExpression="^(0|[0-9]\d*)$">*</asp:RegularExpressionValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("telefono_hotel") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="E-MAIL" SortExpression="email_hotel">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("email_hotel") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" MaxLength="40" Text='<%# Bind("email_hotel") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox6" ErrorMessage="Email, campo requerido" ForeColor="Red">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="TextBox6" ErrorMessage="Ingrese un correo válido" ForeColor="Blue" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("email_hotel") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="creacion_hotel" HeaderText="creacion_hotel" SortExpression="creacion_hotel" Visible="False" />
                    <asp:BoundField DataField="actualizacion_hotel" HeaderText="actualizacion_hotel" SortExpression="actualizacion_hotel" Visible="False" />
                    <asp:BoundField DataField="estado_hotel" HeaderText="estado_hotel" SortExpression="estado_hotel" Visible="False" />
                    <asp:TemplateField ShowHeader="False">
                        <InsertItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Insert" Text="Insertar" CssClass="btn btn-primary"></asp:LinkButton>
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
            
            <asp:SqlDataSource ID="sqldsHoteles" runat="server" ConflictDetection="CompareAllValues" 
                ConnectionString="<%$ ConnectionStrings:gestionHoteleraConnectionString %>" 
                DeleteCommand="UPDATE [tbl_hotel] SET [estado_hotel] ='I' WHERE [id_hotel] = @original_id_hotel " 
                InsertCommand="INSERT INTO [tbl_hotel] ([id_provincia], [nombre_hotel], [ruc_hotel], [direccion_hotel], [telefono_hotel], [email_hotel], [creacion_hotel], [actualizacion_hotel], [estado_hotel]) VALUES (@id_provincia, @nombre_hotel, @ruc_hotel, @direccion_hotel, @telefono_hotel, @email_hotel, GETDATE(), @actualizacion_hotel, 'A')" 
                OldValuesParameterFormatString="original_{0}" 
                SelectCommand="SELECT tbl_hotel.id_hotel, tbl_hotel.id_provincia, tbl_hotel.nombre_hotel, tbl_hotel.ruc_hotel, tbl_hotel.direccion_hotel, tbl_hotel.telefono_hotel, tbl_hotel.email_hotel, tbl_hotel.creacion_hotel, tbl_hotel.actualizacion_hotel, tbl_hotel.estado_hotel, tbl_provincia.descripcion_provincia FROM tbl_hotel INNER JOIN tbl_provincia ON tbl_hotel.id_provincia = tbl_provincia.id_provincia WHERE (tbl_hotel.estado_hotel = @estado_hotel)" 
                UpdateCommand="UPDATE [tbl_hotel] 
                SET [id_provincia] = @id_provincia, [nombre_hotel] = @nombre_hotel, [ruc_hotel] = @ruc_hotel, [direccion_hotel] = @direccion_hotel, [telefono_hotel] = @telefono_hotel, [email_hotel] = @email_hotel, [creacion_hotel] = @creacion_hotel, [actualizacion_hotel] = GETDATE(), [estado_hotel] = 'A' 
                WHERE [id_hotel] = @original_id_hotel">
                <DeleteParameters>
                    <asp:Parameter Name="original_id_hotel" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="id_provincia" Type="Int32" />
                    <asp:Parameter Name="nombre_hotel" Type="String" />
                    <asp:Parameter Name="ruc_hotel" Type="String" />
                    <asp:Parameter Name="direccion_hotel" Type="String" />
                    <asp:Parameter Name="telefono_hotel" Type="String" />
                    <asp:Parameter Name="email_hotel" Type="String" />
                    <asp:Parameter Name="actualizacion_hotel" Type="DateTime" />
                </InsertParameters>
                <SelectParameters>
                    <asp:Parameter DefaultValue="A" Name="estado_hotel" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="id_provincia" Type="Int32" />
                    <asp:Parameter Name="nombre_hotel" Type="String" />
                    <asp:Parameter Name="ruc_hotel" Type="String" />
                    <asp:Parameter Name="direccion_hotel" Type="String" />
                    <asp:Parameter Name="telefono_hotel" Type="String" />
                    <asp:Parameter Name="email_hotel" Type="String" />
                    <asp:Parameter Name="creacion_hotel" Type="DateTime" />
                    <asp:Parameter Name="estado_hotel" Type="String" />
                    <asp:Parameter Name="original_id_hotel" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <asp:LinkButton ID="LinkButton3" runat="server" data-target="#exampleModal" data-toggle="modal" CssClass="btn btn-primary">Nuevo <i class="icon_plus_alt2"></i></asp:LinkButton>
                        
            <br />
            
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id_hotel" DataSourceID="sqldsHoteles" CssClass="table-responsive table-striped table-advance table-hover" GridLines="None" HorizontalAlign="Center" Width="100%">
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButtonActualizar" runat="server" CommandName="Update" CssClass="btn btn-success" ValidationGroup="actualizaHotel"><i class="icon_check_alt2"></i></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButtonCancelar" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="btn btn-primary"><i class="icon_close_alt2"></i></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButtonEditar" runat="server" CausesValidation="False" CommandName="Edit" CssClass="btn btn-primary"><i class="icon_pencil"></i></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButtonEliminar" runat="server" CausesValidation="False" CommandName="Delete" CssClass="btn btn-danger" OnClientClick="return confirm('¿Seguro que desea eliminar el registro?');" Height="100%"><i class="icon_close_alt2"></i></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="#" InsertVisible="False" SortExpression="id_hotel">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("id_hotel") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("id_hotel") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="PROVINCIA" SortExpression="descripcion_provincia">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="sqldsListarProvinciasActualizar" DataTextField="descripcion_provincia" DataValueField="id_provincia" SelectedValue='<%# Bind("id_provincia") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="sqldsListarProvinciasActualizar" runat="server" ConnectionString="<%$ ConnectionStrings:gestionHoteleraConnectionString %>" SelectCommand="SELECT [id_provincia], [descripcion_provincia] FROM [tbl_provincia] WHERE ([estado_provincia] = @estado_provincia)">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="A" Name="estado_provincia" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("descripcion_provincia") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="id_provincia" SortExpression="id_provincia" Visible="False">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="sqldsListarProvinciasActualizar" DataTextField="descripcion_provincia" DataValueField="id_provincia" SelectedValue='<%# Bind("id_provincia") %>'>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("id_provincia") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="NOMBRE" SortExpression="nombre_hotel">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("nombre_hotel") %>' MaxLength="40"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox1" ErrorMessage="Nombre, campo requerido" ForeColor="Red" ValidationGroup="actualizaHotel">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="TextBox1" ErrorMessage="Solo letras MAYÚSC" ForeColor="Blue" ValidationExpression="[A-Z ]*" ValidationGroup="actualizaHotel">*</asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("nombre_hotel") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="RUC" SortExpression="ruc_hotel">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("ruc_hotel") %>' MaxLength="13"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBox2" ErrorMessage="Ruc, campo requerido" ForeColor="Red" ValidationGroup="actualizaHotel">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="TextBox2" ErrorMessage="Solo números" ForeColor="Blue" ValidationExpression="^(0|[0-9]\d*)$" ValidationGroup="actualizaHotel">*</asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("ruc_hotel") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="DIRECCI&#211;N" SortExpression="direccion_hotel">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("direccion_hotel") %>' MaxLength="50"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TextBox3" ErrorMessage="Dirección, campo requerido" ForeColor="Red" ValidationGroup="actualizaHotel">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ControlToValidate="TextBox3" ErrorMessage="Solo letras MAYÚSC" ForeColor="Blue" ValidationExpression="[A-Z ]*" ValidationGroup="actualizaHotel">*</asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("direccion_hotel") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="TEL&#201;FONO" SortExpression="telefono_hotel">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("telefono_hotel") %>' MaxLength="10" Width="80px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="TextBox4" ErrorMessage="Teléfono, campo requerido" ForeColor="Red" ValidationGroup="actualizaHotel">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ControlToValidate="TextBox4" ErrorMessage="Solo números" ForeColor="Blue" ValidationExpression="^(0|[0-9]\d*)$" ValidationGroup="actualizaHotel">*</asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("telefono_hotel") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="E-MAIL" SortExpression="email_hotel">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("email_hotel") %>' MaxLength="40"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="TextBox5" ErrorMessage="Email, campo requerido" ForeColor="Red" ValidationGroup="actualizaHotel">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server" ControlToValidate="TextBox5" ErrorMessage="Ingrese un correo válido" ForeColor="Blue" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="actualizaHotel">*</asp:RegularExpressionValidator>
                            <asp:ValidationSummary ID="ValidationSummary2" runat="server" ForeColor="Blue" ShowMessageBox="True" ShowSummary="False" ValidationGroup="actualizaHotel" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("email_hotel") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="CREACI&#211;N" SortExpression="creacion_hotel" Visible="False">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("creacion_hotel") %>' ReadOnly="True"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label9" runat="server" Text='<%# Bind("creacion_hotel") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="actualizacion" SortExpression="actualizacion_hotel" Visible="False">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("actualizacion_hotel") %>' ReadOnly="True"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label10" runat="server" Text='<%# Bind("actualizacion_hotel") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="estado" SortExpression="estado_hotel" Visible="False">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("estado_hotel") %>' ReadOnly="True" Width="15px"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label11" runat="server" Text='<%# Bind("estado_hotel") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>




            






            

        </div>
    </section>
</asp:Content>
