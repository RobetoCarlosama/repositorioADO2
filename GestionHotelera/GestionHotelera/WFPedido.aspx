<%@ Page Title="" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="WFPedido.aspx.cs" Inherits="GestionHotelera.WFPedido" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Pedido</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="panel">
        <div class="table-responsive">
            <header class="panel-heading">
                PEDIDOS
            </header>
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Nuevo pedido</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <asp:DetailsView ID="DetailsView1" runat="server" Height="100%" Width="100%" AutoGenerateRows="False" DataKeyNames="id_pedido" DataSourceID="sqldsPedido" DefaultMode="Insert" CssClass="table-responsive table-striped table-advance table-hover" GridLines="None" HorizontalAlign="Center">
                                <Fields>
                                    <asp:BoundField DataField="id_pedido" HeaderText="id_pedido" InsertVisible="False" ReadOnly="True" SortExpression="id_pedido" Visible="False" />
                                    <asp:TemplateField HeaderText="FECHA DE PEDIDO" SortExpression="fecha_pedido">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("fecha_pedido") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("fecha_pedido") %>'></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender ID="TextBox1_CalendarExtender" runat="server" TargetControlID="TextBox1" StartDate="<%# DateTime.Now.Date %>" CssClass="black" />
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("fecha_pedido") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="SELECCIONE EL CLIENTE" SortExpression="id_persona">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("id_persona") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="aqldsListarPersonasParaPedido" DataTextField="CLIENTE" DataValueField="id_persona" SelectedValue='<%# Bind("id_persona") %>'>
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="aqldsListarPersonasParaPedido" runat="server" ConnectionString="<%$ ConnectionStrings:gestionHoteleraConnectionString %>" SelectCommand="SELECT tbl_persona.id_persona, tbl_persona.apellido1_persona + '  ' + tbl_persona.nombre1_persona + ' - ' + tbl_tipo_persona.descripcion_tipopersona AS CLIENTE FROM tbl_persona INNER JOIN tbl_tipo_persona ON tbl_persona.id_tipopersona = tbl_tipo_persona.id_tipopersona WHERE (tbl_persona.estado_persona = @estado_persona) AND (tbl_tipo_persona.descripcion_tipopersona = 'CLIENTE')">
                                                <SelectParameters>
                                                    <asp:Parameter DefaultValue="A" Name="estado_persona" Type="String" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("id_persona") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="creacion_pedido" HeaderText="creacion_pedido" SortExpression="creacion_pedido" Visible="False" />
                                    <asp:BoundField DataField="actualizacion_pedido" HeaderText="actualizacion_pedido" SortExpression="actualizacion_pedido" Visible="False" />
                                    <asp:BoundField DataField="estado_pedido" HeaderText="estado_pedido" SortExpression="estado_pedido" Visible="False" />
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

            <asp:LinkButton ID="LinkButton3" runat="server" data-target="#exampleModal" data-toggle="modal" CssClass="btn btn-primary">Nuevo <i class="icon_plus_alt2"></i></asp:LinkButton>
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id_pedido" DataSourceID="sqldsPedido" CssClass="table-responsive table-striped table-advance table-hover" GridLines="None" Height="100%" HorizontalAlign="Center" Width="100%">
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButtonActualizar" runat="server" CausesValidation="True" CommandName="Update" CssClass="btn btn-success"><i class="icon_check_alt2"></i></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButtonCancelar" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="btn btn-primary"><i class="icon_close_alt2"></i></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButtonEditar" runat="server" CausesValidation="False" CommandName="Edit" CssClass="btn btn-primary"><i class="icon_pencil"></i></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButtonEliminar" runat="server" CausesValidation="False" CommandName="Delete" CssClass="btn btn-danger" OnClientClick="return confirm('¿Seguro que desea eliminar el registro?');" Text="Delete"><i class="icon_close_alt2"></i></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="id_pedido" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="id_pedido" />
                    <asp:TemplateField HeaderText="F-PEDIDO" SortExpression="fecha_pedido">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("fecha_pedido") %>'></asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="TextBox1_CalendarExtender" runat="server" TargetControlID="TextBox1" Format="dd/MM/yyyy" StartDate="<%# DateTime.Now.Date %>" CssClass="black" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("fecha_pedido") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="id_persona" SortExpression="id_persona" Visible="False">
                        <EditItemTemplate>
                            
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("id_persona") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="CLIENTE" SortExpression="CLIENTE">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="sqldsListarClientesGRDV" DataTextField="CLIENTES" DataValueField="id_persona" SelectedValue='<%# Bind("id_persona") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="sqldsListarClientesGRDV" runat="server" ConnectionString="<%$ ConnectionStrings:gestionHoteleraConnectionString %>" SelectCommand="SELECT tbl_persona.id_persona, tbl_persona.apellido1_persona + ' ' + tbl_persona.nombre1_persona + ' - ' + tbl_tipo_persona.descripcion_tipopersona AS CLIENTES FROM tbl_persona INNER JOIN tbl_tipo_persona ON tbl_persona.id_tipopersona = tbl_tipo_persona.id_tipopersona WHERE (tbl_persona.estado_persona = @estado_persona) AND (tbl_tipo_persona.descripcion_tipopersona = 'CLIENTE')">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="A" Name="estado_persona" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("CLIENTE") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="CREACIÓN" SortExpression="creacion_pedido">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("creacion_pedido") %>' ReadOnly="True"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("creacion_pedido") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ACTUALIZACIÓN" SortExpression="actualizacion_pedido">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("actualizacion_pedido") %>' ReadOnly="True"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("actualizacion_pedido") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ESTADO" SortExpression="estado_pedido">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("estado_pedido") %>' ReadOnly="True"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("estado_pedido") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="sqldsPedido" runat="server" ConnectionString="<%$ ConnectionStrings:gestionHoteleraConnectionString %>" DeleteCommand="UPDATE [tbl_pedido] SET  [estado_pedido] ='I' WHERE [id_pedido] = @id_pedido" InsertCommand="INSERT INTO [tbl_pedido] ([fecha_pedido], [id_persona], [creacion_pedido], [actualizacion_pedido], [estado_pedido]) VALUES (@fecha_pedido, @id_persona, GETDATE(), @actualizacion_pedido, 'A')" SelectCommand="SELECT tbl_pedido.id_pedido, tbl_pedido.fecha_pedido, tbl_pedido.id_persona, tbl_pedido.creacion_pedido, tbl_pedido.actualizacion_pedido, tbl_pedido.estado_pedido, tbl_persona.apellido1_persona + ' ' + tbl_persona.nombre1_persona + ' - ' + tbl_tipo_persona.descripcion_tipopersona AS CLIENTE FROM tbl_pedido INNER JOIN tbl_persona ON tbl_pedido.id_persona = tbl_persona.id_persona INNER JOIN tbl_tipo_persona ON tbl_persona.id_tipopersona = tbl_tipo_persona.id_tipopersona WHERE (tbl_pedido.estado_pedido = @estado_pedido)" UpdateCommand="UPDATE [tbl_pedido] SET [fecha_pedido] = @fecha_pedido, [id_persona] = @id_persona, [creacion_pedido] = @creacion_pedido, [actualizacion_pedido] = GETDATE(), [estado_pedido] = @estado_pedido WHERE [id_pedido] = @id_pedido">
                <DeleteParameters>
                    <asp:Parameter Name="id_pedido" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="fecha_pedido" Type="DateTime" />
                    <asp:Parameter Name="id_persona" Type="Int32" />
                    <asp:Parameter Name="actualizacion_pedido" Type="DateTime" />
                </InsertParameters>
                <SelectParameters>
                    <asp:Parameter DefaultValue="A" Name="estado_pedido" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="fecha_pedido" Type="DateTime" />
                    <asp:Parameter Name="id_persona" Type="Int32" />
                    <asp:Parameter Name="creacion_pedido" Type="DateTime" />
                    <asp:Parameter Name="estado_pedido" Type="String" />
                    <asp:Parameter Name="id_pedido" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </section>

    
                            </asp:Content>
