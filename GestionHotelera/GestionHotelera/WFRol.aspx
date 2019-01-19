<%@ Page Title="" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="WFRol.aspx.cs" Inherits="GestionHotelera.WFRol" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Roles </title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="panel">
        <div class="table-responsive">
            <header class="panel-heading">
                ROLES DE USUARIOS
            </header>
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Nuevo rol de usuario</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="id_rol" DataSourceID="sqldsRoles" DefaultMode="Insert" Height="50px" Width="125px" CssClass="table table-striped table-advance table-hover" HorizontalAlign="Center" GridLines="None">
                <Fields>
                    <asp:BoundField DataField="id_rol" HeaderText="id_rol" InsertVisible="False" ReadOnly="True" SortExpression="id_rol" Visible="False" />
                    <asp:TemplateField HeaderText="descripcion" SortExpression="descripcion_rol">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("descripcion_rol") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" MaxLength="30" Text='<%# Bind("descripcion_rol") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox1" ErrorMessage="Rol, campo requerido" ForeColor="Red">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox1" ErrorMessage="Solo letras MAYÚSC" ForeColor="Blue" ValidationExpression="[A-Z ]*">*</asp:RegularExpressionValidator>
                            <asp:ValidationSummary ID="ValidationSummary2" runat="server" ShowMessageBox="True" ShowSummary="False" />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("descripcion_rol") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="creacion_rol" HeaderText="creacion_rol" SortExpression="creacion_rol" Visible="False" />
                    <asp:BoundField DataField="actualizacion_rol" HeaderText="actualizacion_rol" SortExpression="actualizacion_rol" Visible="False" />
                    <asp:BoundField DataField="estado_rol" HeaderText="estado_rol" SortExpression="estado_rol" Visible="False" />
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
            
            <asp:LinkButton ID="LinkButton3" runat="server" data-target="#exampleModal" data-toggle="modal" CssClass="btn btn-primary">Nuevo <i class="icon_plus_alt2"></i></asp:LinkButton>            
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id_rol" DataSourceID="sqldsRoles" CssClass="table-responsive table-striped table-advance table-hover" GridLines="None" HorizontalAlign="Center" Height="100%" Width="100%">
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButtonActualizar" runat="server" CausesValidation="True" CommandName="Update" ValidationGroup="actualizaRol" CssClass="btn btn-success"><i class="icon_check_alt2"></i></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButtonCancelar" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="btn btn-primary"><i class="icon_close_alt2"></i></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButtonEditar" runat="server" CausesValidation="False" CommandName="Edit" CssClass="btn btn-primary"><i class="icon_pencil"></i></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButtonEliminar" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('¿Seguro que desea eliminar el registro?');" CssClass="btn btn-danger"><i class="icon_close_alt2"></i></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="id_rol" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="id_rol" />
                    <asp:TemplateField HeaderText="descripción" SortExpression="descripcion_rol">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" MaxLength="30" Text='<%# Bind("descripcion_rol") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Rol, campo requerido" ForeColor="Red" ValidationGroup="actualizaRol">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Solo letras MAYÚSC" ForeColor="Blue" ValidationExpression="[A-Z ]*" ValidationGroup="actualizaRol">*</asp:RegularExpressionValidator>
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="actualizaRol" ShowMessageBox="True" ShowSummary="False" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("descripcion_rol") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="creación" SortExpression="creacion_rol">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" ReadOnly="True" Text='<%# Bind("creacion_rol") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("creacion_rol") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="actualización" SortExpression="actualizacion_rol">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" ReadOnly="True" Text='<%# Bind("actualizacion_rol") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("actualizacion_rol") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="estado" SortExpression="estado_rol">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" ReadOnly="True" Text='<%# Bind("estado_rol") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("estado_rol") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>





            






            <asp:SqlDataSource ID="sqldsRoles" runat="server" ConflictDetection="CompareAllValues" 
                ConnectionString="<%$ ConnectionStrings:gestionHoteleraConnectionString %>" 
                DeleteCommand="UPDATE [tbl_rol] SET [estado_rol] ='I' WHERE [id_rol] = @original_id_rol " 
                InsertCommand="INSERT INTO [tbl_rol] ([descripcion_rol], [creacion_rol], [actualizacion_rol], [estado_rol]) VALUES (@descripcion_rol, GETDATE(), @actualizacion_rol, 'A')" 
                OldValuesParameterFormatString="original_{0}" 
                SelectCommand="SELECT * FROM [tbl_rol] WHERE ([estado_rol] = @estado_rol)" 
                UpdateCommand="UPDATE [tbl_rol] 
                SET [descripcion_rol] = @descripcion_rol, [creacion_rol] = @creacion_rol, [actualizacion_rol] = GETDATE(), [estado_rol] = @estado_rol 
                WHERE [id_rol] = @original_id_rol">
                <DeleteParameters>
                    <asp:Parameter Name="original_id_rol" Type="Int32" />
                    <asp:Parameter Name="original_descripcion_rol" Type="String" />
                    <asp:Parameter Name="original_creacion_rol" Type="DateTime" />
                    <asp:Parameter Name="original_actualizacion_rol" Type="DateTime" />
                    <asp:Parameter Name="original_estado_rol" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="descripcion_rol" Type="String" />
                    <asp:Parameter Name="creacion_rol" Type="DateTime" />
                    <asp:Parameter Name="actualizacion_rol" Type="DateTime" />
                    <asp:Parameter Name="estado_rol" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:Parameter DefaultValue="A" Name="estado_rol" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="descripcion_rol" Type="String" />
                    <asp:Parameter Name="creacion_rol" Type="DateTime" />
                    <asp:Parameter Name="actualizacion_rol" Type="DateTime" />
                    <asp:Parameter Name="estado_rol" Type="String" />
                    <asp:Parameter Name="original_id_rol" Type="Int32" />
                    <asp:Parameter Name="original_descripcion_rol" Type="String" />
                    <asp:Parameter Name="original_creacion_rol" Type="DateTime" />
                    <asp:Parameter Name="original_actualizacion_rol" Type="DateTime" />
                    <asp:Parameter Name="original_estado_rol" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>





            






        </div>
    </section>
</asp:Content>
