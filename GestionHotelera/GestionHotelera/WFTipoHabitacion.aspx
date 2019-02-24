<%@ Page Title="" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="WFTipoHabitacion.aspx.cs" Inherits="GestionHotelera.WFTipoHabitacion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Tipo habitación</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="panel">
        <div class="table-responsive">
            <header class="panel-heading">
                TIPOS DE HABITACIONES
            </header>
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Nuevo tipo de habitación</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <asp:DetailsView ID="DetailsView1" runat="server" Height="100%" Width="100%" AutoGenerateRows="False" DataKeyNames="id_tipohabitacion" DataSourceID="sqldsTipoHabitaciones" DefaultMode="Insert" CssClass="table-responsive table-striped table-advance table-hover" GridLines="None" HorizontalAlign="Center">
                <Fields>
                    <asp:BoundField DataField="id_tipohabitacion" HeaderText="id_tipohabitacion" InsertVisible="False" ReadOnly="True" SortExpression="id_tipohabitacion" Visible="False" />
                    <asp:TemplateField HeaderText="TIPO DE HABITACI&#211;N" SortExpression="descripcion_tipohabitacion">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("descripcion_tipohabitacion") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" MaxLength="30" Text='<%# Bind("descripcion_tipohabitacion") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Tipo habitación, campo requerido" ForeColor="Red">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Solo letras MAYÚSC" ForeColor="Blue" ValidationExpression="[A-Z]*">*</asp:RegularExpressionValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("descripcion_tipohabitacion") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="PECIO HABITACI&#211;N" SortExpression="precio_tipohabitacion">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("precio_tipohabitacion") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" MaxLength="10" Text='<%# Bind("precio_tipohabitacion") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Precio, campo requerido 00,00" ForeColor="Red">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Solo números 00,00" ForeColor="Blue" ValidationExpression="^(\d|-)?(\d|,)*\.?\d*$">*</asp:RegularExpressionValidator>
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("precio_tipohabitacion") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="creacion_tipohabitacion" HeaderText="creacion_tipohabitacion" SortExpression="creacion_tipohabitacion" Visible="False" />
                    <asp:BoundField DataField="actualizacion_tipohabitacion" HeaderText="actualizacion_tipohabitacion" SortExpression="actualizacion_tipohabitacion" Visible="False" />
                    <asp:BoundField DataField="estado_tipohabitacion" HeaderText="estado_tipohabitacion" SortExpression="estado_tipohabitacion" Visible="False" />
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
            
            <asp:SqlDataSource ID="sqldsTipoHabitaciones" runat="server" ConflictDetection="CompareAllValues" 
                ConnectionString="<%$ ConnectionStrings:gestionHoteleraConnectionString %>" 
                DeleteCommand="UPDATE [tbl_tipo_habitacion] SET [estado_tipohabitacion] = 'I' WHERE [id_tipohabitacion] = @original_id_tipohabitacion" 
                InsertCommand="INSERT INTO [tbl_tipo_habitacion] ([descripcion_tipohabitacion], [precio_tipohabitacion], [creacion_tipohabitacion], [actualizacion_tipohabitacion], [estado_tipohabitacion]) VALUES (@descripcion_tipohabitacion, @precio_tipohabitacion, getdate(), @actualizacion_tipohabitacion, 'A')" 
                OldValuesParameterFormatString="original_{0}" 
                SelectCommand="SELECT * FROM [tbl_tipo_habitacion] WHERE ([estado_tipohabitacion] = @estado_tipohabitacion)" 
                UpdateCommand="UPDATE [tbl_tipo_habitacion] 
                SET [descripcion_tipohabitacion] = @descripcion_tipohabitacion, [precio_tipohabitacion] = @precio_tipohabitacion, [creacion_tipohabitacion] = @creacion_tipohabitacion, [actualizacion_tipohabitacion] = getdate(), [estado_tipohabitacion] = 'A' 
                WHERE [id_tipohabitacion] = @original_id_tipohabitacion">
                <DeleteParameters>
                    <asp:Parameter Name="original_id_tipohabitacion" Type="Int32" />
                    <asp:Parameter Name="original_descripcion_tipohabitacion" Type="String" />
                    <asp:Parameter Name="original_precio_tipohabitacion" Type="Decimal" />
                    <asp:Parameter Name="original_creacion_tipohabitacion" Type="DateTime" />
                    <asp:Parameter Name="original_actualizacion_tipohabitacion" Type="DateTime" />
                    <asp:Parameter Name="original_estado_tipohabitacion" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="descripcion_tipohabitacion" Type="String" />
                    <asp:Parameter Name="precio_tipohabitacion" Type="Decimal" />
                    <asp:Parameter Name="creacion_tipohabitacion" Type="DateTime" />
                    <asp:Parameter Name="actualizacion_tipohabitacion" Type="DateTime" />
                    <asp:Parameter Name="estado_tipohabitacion" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:Parameter DefaultValue="A" Name="estado_tipohabitacion" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="descripcion_tipohabitacion" Type="String" />
                    <asp:Parameter Name="precio_tipohabitacion" Type="Decimal" />
                    <asp:Parameter Name="creacion_tipohabitacion" Type="DateTime" />
                    <asp:Parameter Name="actualizacion_tipohabitacion" Type="DateTime" />
                    <asp:Parameter Name="estado_tipohabitacion" Type="String" />
                    <asp:Parameter Name="original_id_tipohabitacion" Type="Int32" />
                    <asp:Parameter Name="original_descripcion_tipohabitacion" Type="String" />
                    <asp:Parameter Name="original_precio_tipohabitacion" Type="Decimal" />
                    <asp:Parameter Name="original_creacion_tipohabitacion" Type="DateTime" />
                    <asp:Parameter Name="original_actualizacion_tipohabitacion" Type="DateTime" />
                    <asp:Parameter Name="original_estado_tipohabitacion" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
          
           <asp:LinkButton ID="LinkButton3" runat="server" data-target="#exampleModal" data-toggle="modal" CssClass="btn btn-primary">Nuevo <i class="icon_plus_alt2"></i></asp:LinkButton>
                        
            <br />
            
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id_tipohabitacion" DataSourceID="sqldsTipoHabitaciones" CssClass="table-responsive table-striped table-advance table-hover" GridLines="None" HorizontalAlign="Center" Width="100%" Height="100%">
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButtonActualiza" runat="server" CommandName="Update" CssClass="btn btn-success" ValidationGroup="actualizaTipoHabitacion"><i class="icon_check_alt2"></i></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButtonCancelar" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="btn btn-primary" Text="Cancelar"><i class="icon_close_alt2"></i></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButtonEditar" runat="server" CausesValidation="False" CommandName="Edit" CssClass="btn btn-primary"><i class="icon_pencil"></i></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButtonEliminar" runat="server" CausesValidation="False" CommandName="Delete" CssClass="btn btn-danger" OnClientClick="return confirm('¿Seguro que desea eliminar el registro?');"><i class="icon_close_alt2"></i></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="id_tipohabitacion" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="id_tipohabitacion" />
                    <asp:TemplateField HeaderText="DESCRIPCI&#211;N" SortExpression="descripcion_tipohabitacion">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" MaxLength="30" Text='<%# Bind("descripcion_tipohabitacion") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox1" ErrorMessage="Tipo habitación, campo requerido" ForeColor="Red" ValidationGroup="actualizaTipoHabitacion">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox1" ErrorMessage="Solo letras MAYÚSC" ForeColor="Blue" ValidationExpression="[A-Z]*" ValidationGroup="actualizaTipoHabitacion">*</asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("descripcion_tipohabitacion") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="PRECIO" SortExpression="precio_tipohabitacion">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" MaxLength="10" Text='<%# Bind("precio_tipohabitacion") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox2" ErrorMessage="Precio, campo requerido 00,00" ForeColor="Red" ValidationGroup="actualizaTipoHabitacion">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="TextBox2" ErrorMessage="Solo números 00,00" ForeColor="Blue" ValidationExpression="^(\d|-)?(\d|,)*\.?\d*$" ValidationGroup="actualizaTipoHabitacion">*</asp:RegularExpressionValidator>
                            <asp:ValidationSummary ID="ValidationSummary2" runat="server" ValidationGroup="actualizaTipoHabitacion" ShowMessageBox="True" ShowSummary="False" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("precio_tipohabitacion") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="CREACI&#211;N" SortExpression="creacion_tipohabitacion">
                        <EditItemTemplate>
                            <asp:Label runat="server" Text='<%# Eval("creacion_tipohabitacion") %>' ID="Label1"></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("creacion_tipohabitacion") %>' ID="Label3"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ACTUALIZACI&#211;N" SortExpression="actualizacion_tipohabitacion">
                        <EditItemTemplate>
                            <asp:Label runat="server" Text='<%# Eval("actualizacion_tipohabitacion") %>' ID="Label2"></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("actualizacion_tipohabitacion") %>' ID="Label4"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ESTADO" SortExpression="estado_tipohabitacion">
                        <EditItemTemplate>
                            <asp:Label runat="server" Text='<%# Eval("estado_tipohabitacion") %>' ID="Label3"></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("estado_tipohabitacion") %>' ID="Label5"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>
        </div>
    </section>
</asp:Content>
