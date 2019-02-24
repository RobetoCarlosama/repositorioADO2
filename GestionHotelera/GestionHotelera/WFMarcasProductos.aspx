<%@ Page Title="" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="WFMarcasProductos.aspx.cs" Inherits="GestionHotelera.WFMarcasProductos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Marcas de productos</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="panel">
        <div class="table-responsive">
            <header class="panel-heading">
                RESERVAS
            </header>
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Nueva marca</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <asp:DetailsView ID="DetailsView1" runat="server" Height="100%" Width="100%" AutoGenerateRows="False" DataKeyNames="id_marcaproducto" DataSourceID="adlsMarcasProductos" DefaultMode="Insert" CssClass="table-responsive table-striped table-advance table-hover" HorizontalAlign="Center" GridLines="None">
                                <Fields>
                                    <asp:BoundField DataField="id_marcaproducto" HeaderText="id_marcaproducto" InsertVisible="False" ReadOnly="True" SortExpression="id_marcaproducto" Visible="False" />
                                    <asp:BoundField DataField="descripcion_marcaproducto" HeaderText="DESCRIPCIÓN MARCA" SortExpression="descripcion_marcaproducto" />
                                    <asp:BoundField DataField="creacion_marcaproducto" HeaderText="creacion_marcaproducto" SortExpression="creacion_marcaproducto" Visible="False" />
                                    <asp:BoundField DataField="actualizacion_marcaproducto" HeaderText="actualizacion_marcaproducto" SortExpression="actualizacion_marcaproducto" Visible="False" />
                                    <asp:BoundField DataField="estado_marcaproducto" HeaderText="estado_marcaproducto" SortExpression="estado_marcaproducto" Visible="False" />
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
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id_marcaproducto" DataSourceID="adlsMarcasProductos" CssClass="table-responsive table-striped table-advance table-hover" GridLines="None" Height="100%" Width="100%">
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
                    <asp:BoundField DataField="id_marcaproducto" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="id_marcaproducto" Visible="False" />
                    <asp:TemplateField HeaderText="DESCRIPCIÓN MARCA" SortExpression="descripcion_marcaproducto">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("descripcion_marcaproducto") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("descripcion_marcaproducto") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="CREACIÓN" SortExpression="creacion_marcaproducto">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" ReadOnly="True" Text='<%# Bind("creacion_marcaproducto") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("creacion_marcaproducto") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ACTUALIZACIÓN" SortExpression="actualizacion_marcaproducto">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" ReadOnly="True" Text='<%# Bind("actualizacion_marcaproducto") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("actualizacion_marcaproducto") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ESTADO" SortExpression="estado_marcaproducto">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" ReadOnly="True" Text='<%# Bind("estado_marcaproducto") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("estado_marcaproducto") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="adlsMarcasProductos" runat="server" ConnectionString="<%$ ConnectionStrings:gestionHoteleraConnectionString %>" DeleteCommand=" UPDATE [tbl_marca_producto] SET [estado_marcaproducto] ='I' WHERE [id_marcaproducto] = @id_marcaproducto" InsertCommand="INSERT INTO [tbl_marca_producto] ([descripcion_marcaproducto], [creacion_marcaproducto], [actualizacion_marcaproducto], [estado_marcaproducto]) VALUES (@descripcion_marcaproducto, GETDATE(), @actualizacion_marcaproducto, 'A')" SelectCommand="SELECT * FROM [tbl_marca_producto] WHERE ([estado_marcaproducto] = @estado_marcaproducto)" UpdateCommand="UPDATE [tbl_marca_producto] SET [descripcion_marcaproducto] = @descripcion_marcaproducto, [creacion_marcaproducto] = @creacion_marcaproducto, [actualizacion_marcaproducto] = GETDATE(), [estado_marcaproducto] = @estado_marcaproducto WHERE [id_marcaproducto] = @id_marcaproducto">
                <DeleteParameters>
                    <asp:Parameter Name="id_marcaproducto" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="descripcion_marcaproducto" Type="String" />
                    <asp:Parameter Name="actualizacion_marcaproducto" Type="DateTime" />
                </InsertParameters>
                <SelectParameters>
                    <asp:Parameter DefaultValue="A" Name="estado_marcaproducto" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="descripcion_marcaproducto" Type="String" />
                    <asp:Parameter Name="creacion_marcaproducto" Type="DateTime" />
                    <asp:Parameter Name="estado_marcaproducto" Type="String" />
                    <asp:Parameter Name="id_marcaproducto" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </section>

</asp:Content>
