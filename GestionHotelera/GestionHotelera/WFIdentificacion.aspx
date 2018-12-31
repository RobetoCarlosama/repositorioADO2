<%@ Page EnableEventValidation="false" Title="" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="WFIdentificacion.aspx.cs" Inherits="GestionHotelera.WFIdentificacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Identificacion</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="panel">
        <div class="table-responsive">
            <header class="panel-heading">
                TIPOS DE IDENTIFICACIÓN
            </header>
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Nuevo tipo de identificación</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="id_identificacion" DataSourceID="sqldsTipoIdentificacion" DefaultMode="Insert" CssClass="table table-striped table-advance table-hover" GridLines="None" HorizontalAlign="Center">
                                <Fields>
                                    <asp:BoundField DataField="id_identificacion" HeaderText="id_identificacion" InsertVisible="False" ReadOnly="True" SortExpression="id_identificacion" Visible="False" />
                                    <asp:TemplateField HeaderText="descripcion_identificacion" SortExpression="descripcion_identificacion">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("descripcion_identificacion") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("descripcion_identificacion") %>' MaxLength="30"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Debe ingresar el tipo de identificación" ForeColor="Red">*</asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Solo letras MAYÚSC" ForeColor="Blue" ValidationExpression="[A-Z ]*">*</asp:RegularExpressionValidator>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("descripcion_identificacion") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="creacion_identificacion" HeaderText="creacion_identificacion" SortExpression="creacion_identificacion" Visible="False" />
                                    <asp:BoundField DataField="actualizacion_identificacion" HeaderText="actualizacion_identificacion" SortExpression="actualizacion_identificacion" Visible="False" />
                                    <asp:BoundField DataField="estado_identificacion" HeaderText="estado_identificacion" SortExpression="estado_identificacion" Visible="False" />
                                    <asp:TemplateField ShowHeader="False">
                                        <InsertItemTemplate>
                                            <asp:LinkButton ID="LinkButtonInsertar" runat="server" CausesValidation="True" CommandName="Insert" CssClass="btn btn-primary" Text="Insertar"></asp:LinkButton>
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
            <%--<a class="btn-sm btn-primary" data-target="#exampleModal" data-toggle="modal">Nuevo <i class="icon_plus_alt2" data-target="#exampleModal" data-toggle="modal"></i></a>--%>
            <asp:LinkButton ID="LinkButton3" runat="server" data-target="#exampleModal" data-toggle="modal" CssClass="btn btn-primary">Nuevo <i class="icon_plus_alt2"></i></asp:LinkButton>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
           
            <br />

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id_identificacion" DataSourceID="sqldsTipoIdentificacion" CssClass="table-responsive table-striped table-advance table-hover" GridLines="None" HorizontalAlign="Center" Width="100%" Height="100%">
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButtonActualizar" runat="server" CommandName="Update" CssClass="btn btn-success" ValidationGroup="grupoActualizar"><i class="icon_check_alt2"></i></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButtonCancelar" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="btn btn-primary"><i class="icon_close_alt2"></i></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButtonEditar" runat="server" CausesValidation="False" CommandName="Edit" CssClass="btn btn-primary"><i class="icon_pencil"></i></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButtonEliminar" runat="server" CausesValidation="False" CommandName="Delete" CssClass="btn btn-danger" OnClientClick="return confirm('¿Seguro que desea eliminar el registro?');"><i class="icon_close_alt2"></i></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="id_identificacion" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="id_identificacion" />
                    <asp:TemplateField HeaderText="descripcion" SortExpression="descripcion_identificacion">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" MaxLength="30" Text='<%# Bind("descripcion_identificacion") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Debe ingresar el tipo de identificación" ForeColor="Red" ValidationGroup="grupoActualizar">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Solo letras MAYÚSC" ForeColor="Blue" ValidationExpression="[A-Z ]*" ValidationGroup="grupoActualizar">*</asp:RegularExpressionValidator>
                            <asp:ValidationSummary ID="ValidationSummary2" runat="server" ForeColor="Blue" ValidationGroup="grupoActualizar" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("descripcion_identificacion") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="creacion" SortExpression="creacion_identificacion">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" ReadOnly="True" Text='<%# Bind("creacion_identificacion") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("creacion_identificacion") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="actualizacion" SortExpression="actualizacion_identificacion">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("actualizacion_identificacion") %>' ReadOnly="True"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("actualizacion_identificacion") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="estado" SortExpression="estado_identificacion">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" ReadOnly="True" Text='<%# Bind("estado_identificacion") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("estado_identificacion") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>






            <asp:SqlDataSource ID="sqldsTipoIdentificacion" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:gestionHoteleraConnectionString %>"
                DeleteCommand="UPDATE [tbl_identificacion] SET [estado_identificacion] ='I' WHERE [id_identificacion] = @original_id_identificacion "
                InsertCommand="INSERT INTO [tbl_identificacion] ([descripcion_identificacion], [creacion_identificacion], [actualizacion_identificacion], [estado_identificacion]) VALUES (@descripcion_identificacion, GETDATE(), @actualizacion_identificacion, 'A')" OldValuesParameterFormatString="original_{0}"
                SelectCommand="SELECT * FROM [tbl_identificacion] WHERE ([estado_identificacion] = @estado_identificacion)"
                UpdateCommand="UPDATE  tbl_identificacion
                               SET descripcion_identificacion = @descripcion_identificacion, creacion_identificacion = @creacion_identificacion, actualizacion_identificacion = GETDATE(), estado_identificacion = @estado_identificacion
                                WHERE (id_identificacion = @original_id_identificacion)">
                <DeleteParameters>
                    <asp:Parameter Name="original_id_identificacion" Type="Int32" />
                    <asp:Parameter Name="original_descripcion_identificacion" Type="String" />
                    <asp:Parameter Name="original_creacion_identificacion" Type="DateTime" />
                    <asp:Parameter Name="original_actualizacion_identificacion" Type="DateTime" />
                    <asp:Parameter Name="original_estado_identificacion" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="descripcion_identificacion" Type="String" />
                    <asp:Parameter Name="creacion_identificacion" Type="DateTime" />
                    <asp:Parameter Name="actualizacion_identificacion" Type="DateTime" />
                    <asp:Parameter Name="estado_identificacion" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:Parameter DefaultValue="A" Name="estado_identificacion" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="descripcion_identificacion" Type="String" />
                    <asp:Parameter Name="creacion_identificacion" Type="DateTime" />
                    <asp:Parameter Name="actualizacion_identificacion" Type="DateTime" />
                    <asp:Parameter Name="estado_identificacion" Type="String" />
                    <asp:Parameter Name="original_id_identificacion" Type="Int32" />
                    <asp:Parameter Name="original_descripcion_identificacion" Type="String" />
                    <asp:Parameter Name="original_creacion_identificacion" Type="DateTime" />
                    <asp:Parameter Name="original_actualizacion_identificacion" Type="DateTime" />
                    <asp:Parameter Name="original_estado_identificacion" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>






        </div>
    </section>
</asp:Content>
