<%@ Page Title="" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="WFDetallePedido.aspx.cs" Inherits="GestionHotelera.WFDetallePedido" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Detalle Pedido</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="panel">
        <div class="table-responsive">
            <header class="panel-heading">
                DETALLES DE PEDIDOS
            </header>
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Nuevo detalle de pedidos</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
    <asp:DetailsView ID="DetailsView1" runat="server" Height="100%" Width="100%" AutoGenerateRows="False" CssClass="table-responsive table-striped table-advance table-hover" DataKeyNames="id_detalleproducto" DataSourceID="sqldsDetallePedido" DefaultMode="Insert" GridLines="None" HorizontalAlign="Center">
        <Fields>
            <asp:BoundField DataField="id_detalleproducto" HeaderText="id_detalleproducto" InsertVisible="False" ReadOnly="True" SortExpression="id_detalleproducto" Visible="False" />
            <asp:TemplateField HeaderText="NO. DE PEDIDO" SortExpression="id_pedido">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("id_pedido") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownList4" runat="server" CssClass="form-control error" DataSourceID="sqldsListarPedidosInsertar" DataTextField="id_pedido" DataValueField="id_pedido" SelectedValue='<%# Bind("id_pedido") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="sqldsListarPedidosInsertar" runat="server" ConnectionString="<%$ ConnectionStrings:gestionHoteleraConnectionString %>" SelectCommand="SELECT [id_pedido] FROM [tbl_pedido] WHERE ([estado_pedido] = @estado_pedido)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="A" Name="estado_pedido" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("id_pedido") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="SELECIONE EL PRODUCTO" SortExpression="id_producto">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("id_producto") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownList5" runat="server" CssClass="form-control error" DataSourceID="sqldsListarProductosInsert" DataTextField="descripcion_producto" DataValueField="id_producto" SelectedValue='<%# Bind("id_producto") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="sqldsListarProductosInsert" runat="server" ConnectionString="<%$ ConnectionStrings:gestionHoteleraConnectionString %>" SelectCommand="SELECT [id_producto], [descripcion_producto] FROM [tbl_producto] WHERE ([estado_producto] = @estado_producto)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="A" Name="estado_producto" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("id_producto") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="CANTIDAD" SortExpression="cantidad_detalleproducto">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("cantidad_detalleproducto") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control error" Text='<%# Bind("cantidad_detalleproducto") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("cantidad_detalleproducto") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="PRECIO" SortExpression="precio_detalleproducto">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("precio_detalleproducto") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control error" Text='<%# Bind("precio_detalleproducto") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("precio_detalleproducto") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="creacion_detalleproducto" HeaderText="creacion_detalleproducto" SortExpression="creacion_detalleproducto" Visible="False" />
            <asp:BoundField DataField="actualizacion_detalleproducto" HeaderText="actualizacion_detalleproducto" SortExpression="actualizacion_detalleproducto" Visible="False" />
            <asp:BoundField DataField="estado_detalleproducto" HeaderText="estado_detalleproducto" SortExpression="estado_detalleproducto" Visible="False" />
            <asp:BoundField DataField="CLIENTE" HeaderText="CLIENTE" ReadOnly="True" SortExpression="CLIENTE" Visible="False" />
            <asp:BoundField DataField="descripcion_producto" HeaderText="descripcion_producto" SortExpression="descripcion_producto" Visible="False" />
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
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id_detalleproducto" DataSourceID="sqldsDetallePedido" CssClass="table-responsive table-striped table-advance table-hover" GridLines="None" Height="100%" Width="100%">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" CssClass="btn btn-success"><i class="icon_check_alt2"></i></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="btn btn-primary"><i class="icon_close_alt2"></i></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" CssClass="btn btn-primary"><i class="icon_pencil"></i></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" CssClass="btn btn-danger" OnClientClick="return confirm('¿Seguro que desea eliminar el registro?');"><i class="icon_close_alt2"></i></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="id_detalleproducto" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="id_detalleproducto" />
            <asp:TemplateField HeaderText="NO. PEDIDO" SortExpression="id_pedido">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="sqldsListarNumPedidos" DataTextField="id_pedido" DataValueField="id_pedido" SelectedValue='<%# Bind("id_pedido") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="sqldsListarNumPedidos" runat="server" ConnectionString="<%$ ConnectionStrings:gestionHoteleraConnectionString %>" SelectCommand="SELECT [id_pedido] FROM [tbl_pedido] WHERE ([estado_pedido] = @estado_pedido)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="A" Name="estado_pedido" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("id_pedido") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="CLIENTE" SortExpression="CLIENTE" Visible="False">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="sqldsListarClienteGRDV" DataTextField="id_pedido" DataValueField="id_pedido" SelectedValue='<%# Bind("id_pedido") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="sqldsListarClienteGRDV" runat="server" ConnectionString="<%$ ConnectionStrings:gestionHoteleraConnectionString %>" SelectCommand="SELECT [id_pedido] FROM [tbl_pedido] WHERE ([estado_pedido] = @estado_pedido)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="A" Name="estado_pedido" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("CLIENTE") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="id_producto" SortExpression="id_producto" Visible="False">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("id_producto") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("id_producto") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="PRODUCTO" SortExpression="descripcion_producto">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="sqldsListarProductoGRD" DataTextField="descripcion_producto" DataValueField="id_producto" SelectedValue='<%# Bind("id_producto") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="sqldsListarProductoGRD" runat="server" ConnectionString="<%$ ConnectionStrings:gestionHoteleraConnectionString %>" SelectCommand="SELECT [id_producto], [descripcion_producto] FROM [tbl_producto] WHERE ([estado_producto] = @estado_producto)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="A" Name="estado_producto" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("descripcion_producto") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="CANTIDAD" SortExpression="cantidad_detalleproducto">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("cantidad_detalleproducto") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("cantidad_detalleproducto") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="PRECIO" SortExpression="precio_detalleproducto">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("precio_detalleproducto") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("precio_detalleproducto") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="CREACIÓN" SortExpression="creacion_detalleproducto">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("creacion_detalleproducto") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("creacion_detalleproducto") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ACTUALIZACIÓN" SortExpression="actualizacion_detalleproducto">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("actualizacion_detalleproducto") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("actualizacion_detalleproducto") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ESTADO" SortExpression="estado_detalleproducto">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("estado_detalleproducto") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("estado_detalleproducto") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
</asp:GridView>
<asp:SqlDataSource ID="sqldsDetallePedido" runat="server" ConnectionString="<%$ ConnectionStrings:gestionHoteleraConnectionString %>" DeleteCommand="UPDATE [tbl_detalle_producto] SET  [estado_detalleproducto] ='I' WHERE [id_detalleproducto] = @id_detalleproducto" InsertCommand="INSERT INTO [tbl_detalle_producto] ([id_pedido], [id_producto], [cantidad_detalleproducto], [precio_detalleproducto], [creacion_detalleproducto], [actualizacion_detalleproducto], [estado_detalleproducto]) VALUES (@id_pedido, @id_producto, @cantidad_detalleproducto, @precio_detalleproducto, GETDATE(), @actualizacion_detalleproducto, 'A')" SelectCommand="SELECT tbl_detalle_producto.id_detalleproducto, tbl_detalle_producto.id_pedido, tbl_detalle_producto.id_producto, tbl_detalle_producto.cantidad_detalleproducto, tbl_detalle_producto.precio_detalleproducto, tbl_detalle_producto.creacion_detalleproducto, tbl_detalle_producto.actualizacion_detalleproducto, tbl_detalle_producto.estado_detalleproducto, tbl_persona.apellido1_persona + ' - ' + tbl_persona.nombre1_persona AS CLIENTE, tbl_producto.descripcion_producto FROM tbl_detalle_producto INNER JOIN tbl_pedido ON tbl_detalle_producto.id_pedido = tbl_pedido.id_pedido INNER JOIN tbl_persona ON tbl_pedido.id_persona = tbl_persona.id_persona INNER JOIN tbl_producto ON tbl_detalle_producto.id_producto = tbl_producto.id_producto WHERE (tbl_detalle_producto.estado_detalleproducto = @estado_detalleproducto)" UpdateCommand="UPDATE [tbl_detalle_producto] SET [id_pedido] = @id_pedido, [id_producto] = @id_producto, [cantidad_detalleproducto] = @cantidad_detalleproducto, [precio_detalleproducto] = @precio_detalleproducto, [creacion_detalleproducto] = @creacion_detalleproducto, [actualizacion_detalleproducto] = GETDATE(), [estado_detalleproducto] = @estado_detalleproducto WHERE [id_detalleproducto] = @id_detalleproducto">
    <DeleteParameters>
        <asp:Parameter Name="id_detalleproducto" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="id_pedido" Type="Int32" />
        <asp:Parameter Name="id_producto" Type="Int32" />
        <asp:Parameter Name="cantidad_detalleproducto" Type="Decimal" />
        <asp:Parameter Name="precio_detalleproducto" Type="Decimal" />
        <asp:Parameter Name="actualizacion_detalleproducto" Type="DateTime" />
    </InsertParameters>
    <SelectParameters>
        <asp:Parameter DefaultValue="A" Name="estado_detalleproducto" Type="String" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="id_pedido" Type="Int32" />
        <asp:Parameter Name="id_producto" Type="Int32" />
        <asp:Parameter Name="cantidad_detalleproducto" Type="Decimal" />
        <asp:Parameter Name="precio_detalleproducto" Type="Decimal" />
        <asp:Parameter Name="creacion_detalleproducto" Type="DateTime" />
        <asp:Parameter Name="estado_detalleproducto" Type="String" />
        <asp:Parameter Name="id_detalleproducto" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
            
        </div>
    </section>
</asp:Content>
