<%@ Page Title="" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="WFCategoriaProducto.aspx.cs" Inherits="GestionHotelera.WFCategoriaProducto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Categoría de productos</title>
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="panel">
        <div class="table-responsive">
            <header class="panel-heading">
                CATEGORÍAS DE PRODUCTOS
            </header>
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Nueva categoría</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <asp:DetailsView ID="DetailsView1" runat="server" Height="100%" Width="100%" AutoGenerateRows="False" DataKeyNames="id_categoriaproducto" DataSourceID="sqldsCategoríaProductos" DefaultMode="Insert" CssClass="table-responsive table-striped table-advance table-hover" GridLines="None" HorizontalAlign="Center">
                                <Fields>
                                    <asp:BoundField DataField="id_categoriaproducto" HeaderText="id_categoriaproducto" InsertVisible="False" ReadOnly="True" SortExpression="id_categoriaproducto" Visible="False" />
                                    <asp:TemplateField HeaderText="CATEGORÍA DE PRODUCTO" SortExpression="descripcion_categoriaproducto">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("descripcion_categoriaproducto") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("descripcion_categoriaproducto") %>'></asp:TextBox>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("descripcion_categoriaproducto") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="creacion_categoriaproducto" HeaderText="creacion_categoriaproducto" SortExpression="creacion_categoriaproducto" Visible="False" />
                                    <asp:BoundField DataField="actualizacion_categoriaproducto" HeaderText="actualizacion_categoriaproducto" SortExpression="actualizacion_categoriaproducto" Visible="False" />
                                    <asp:BoundField DataField="estado_categoriaproducto" HeaderText="estado_categoriaproducto" SortExpression="estado_categoriaproducto" Visible="False" />
                                    <asp:TemplateField ShowHeader="False">
                                        <InsertItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Insert" CssClass="btn btn-primary" Text="Insertar"></asp:LinkButton>
                                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="btn btn-success" Text="Cancelar"></asp:LinkButton>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="New" Text="New"></asp:LinkButton>
                                            <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
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
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id_categoriaproducto" DataSourceID="sqldsCategoríaProductos" CssClass="table-responsive table-striped table-advance table-hover" GridLines="None" HorizontalAlign="Center" Width="100%" Height="100%">
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton runat="server" CommandName="Update" CausesValidation="True" ID="LinkButton1" CssClass="btn btn-success"><i class="icon_check_alt2"></i></asp:LinkButton>
                            &nbsp;<asp:LinkButton runat="server" CommandName="Cancel" CausesValidation="False" ID="LinkButton2" CssClass="btn btn-primary"><i class="icon_close_alt2"></i></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton runat="server" CommandName="Edit" CausesValidation="False" ID="LinkButton1" CssClass="btn btn-primary"><i class="icon_pencil"></i></asp:LinkButton>
                            &nbsp;<asp:LinkButton runat="server" CommandName="Delete" CausesValidation="False" ID="LinkButton2" CssClass="btn btn-danger" OnClientClick="return confirm('¿Seguro que desea eliminar el registro?');"><i class="icon_close_alt2"></i></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="#" InsertVisible="False" SortExpression="id_categoriaproducto">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("id_categoriaproducto") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("id_categoriaproducto") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="DESCRIPCIÓN" SortExpression="descripcion_categoriaproducto">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("descripcion_categoriaproducto") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("descripcion_categoriaproducto") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="CREACIÓN" SortExpression="creacion_categoriaproducto">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("creacion_categoriaproducto") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("creacion_categoriaproducto") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ACTUALIZACIÓN" SortExpression="actualizacion_categoriaproducto">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("actualizacion_categoriaproducto") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("actualizacion_categoriaproducto") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ESTADO" SortExpression="estado_categoriaproducto">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("estado_categoriaproducto") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("estado_categoriaproducto") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="sqldsCategoríaProductos" runat="server" ConnectionString="<%$ ConnectionStrings:gestionHoteleraConnectionString %>" DeleteCommand="UPDATE [tbl_categoria_producto] SET [estado_categoriaproducto] ='I' WHERE [id_categoriaproducto] = @id_categoriaproducto" InsertCommand="INSERT INTO [tbl_categoria_producto] ([descripcion_categoriaproducto], [creacion_categoriaproducto], [actualizacion_categoriaproducto], [estado_categoriaproducto]) VALUES (@descripcion_categoriaproducto,  GETDATE(), @actualizacion_categoriaproducto, 'A')" SelectCommand="SELECT * FROM [tbl_categoria_producto] WHERE ([estado_categoriaproducto] = @estado_categoriaproducto)" UpdateCommand="UPDATE [tbl_categoria_producto] SET [descripcion_categoriaproducto] = @descripcion_categoriaproducto, [creacion_categoriaproducto] = @creacion_categoriaproducto, [actualizacion_categoriaproducto] = GETDATE(), [estado_categoriaproducto] = @estado_categoriaproducto WHERE [id_categoriaproducto] = @id_categoriaproducto">
                <DeleteParameters>
                    <asp:Parameter Name="id_categoriaproducto" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="descripcion_categoriaproducto" Type="String" />
                    <asp:Parameter Name="actualizacion_categoriaproducto" Type="DateTime" />
                </InsertParameters>
                <SelectParameters>
                    <asp:Parameter DefaultValue="A" Name="estado_categoriaproducto" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="descripcion_categoriaproducto" Type="String" />
                    <asp:Parameter Name="creacion_categoriaproducto" Type="DateTime" />
                    <asp:Parameter Name="estado_categoriaproducto" Type="String" />
                    <asp:Parameter Name="id_categoriaproducto" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </section>
</asp:Content>
