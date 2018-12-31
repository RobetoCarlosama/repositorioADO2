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
                            

                        </div>
                    </div>
                </div>
            </div>
            <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="id_persona" DataSourceID="sqldsPersonas" DefaultMode="Insert">
                <Fields>
                    <asp:BoundField DataField="id_persona" HeaderText="id_persona" InsertVisible="False" ReadOnly="True" SortExpression="id_persona" />
                    <asp:BoundField DataField="id_identificacion" HeaderText="id_identificacion" SortExpression="id_identificacion" />
                    <asp:BoundField DataField="id_tipopersona" HeaderText="id_tipopersona" SortExpression="id_tipopersona" />
                    <asp:BoundField DataField="numero_identificacionpersona" HeaderText="numero_identificacionpersona" SortExpression="numero_identificacionpersona" />
                    <asp:BoundField DataField="apellido1_persona" HeaderText="apellido1_persona" SortExpression="apellido1_persona" />
                    <asp:BoundField DataField="apellido2_persona" HeaderText="apellido2_persona" SortExpression="apellido2_persona" />
                    <asp:BoundField DataField="nombre1_persona" HeaderText="nombre1_persona" SortExpression="nombre1_persona" />
                    <asp:BoundField DataField="nombre2_persona" HeaderText="nombre2_persona" SortExpression="nombre2_persona" />
                    <asp:BoundField DataField="direccion_persona" HeaderText="direccion_persona" SortExpression="direccion_persona" />
                    <asp:BoundField DataField="celular_persona" HeaderText="celular_persona" SortExpression="celular_persona" />
                    <asp:BoundField DataField="telefono_persona" HeaderText="telefono_persona" SortExpression="telefono_persona" />
                    <asp:BoundField DataField="email_persona" HeaderText="email_persona" SortExpression="email_persona" />
                    <asp:BoundField DataField="creacion_persona" HeaderText="creacion_persona" SortExpression="creacion_persona" />
                    <asp:BoundField DataField="actualizacion_persona" HeaderText="actualizacion_persona" SortExpression="actualizacion_persona" />
                    <asp:BoundField DataField="estado_persona" HeaderText="estado_persona" SortExpression="estado_persona" />
                    <asp:CommandField ShowInsertButton="True" />
                </Fields>
            </asp:DetailsView>
            <asp:SqlDataSource ID="sqldsPersonas" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:gestionHoteleraConnectionString %>" DeleteCommand="DELETE FROM [tbl_persona] WHERE [id_persona] = @original_id_persona AND (([id_identificacion] = @original_id_identificacion) OR ([id_identificacion] IS NULL AND @original_id_identificacion IS NULL)) AND (([id_tipopersona] = @original_id_tipopersona) OR ([id_tipopersona] IS NULL AND @original_id_tipopersona IS NULL)) AND (([numero_identificacionpersona] = @original_numero_identificacionpersona) OR ([numero_identificacionpersona] IS NULL AND @original_numero_identificacionpersona IS NULL)) AND (([apellido1_persona] = @original_apellido1_persona) OR ([apellido1_persona] IS NULL AND @original_apellido1_persona IS NULL)) AND (([apellido2_persona] = @original_apellido2_persona) OR ([apellido2_persona] IS NULL AND @original_apellido2_persona IS NULL)) AND (([nombre1_persona] = @original_nombre1_persona) OR ([nombre1_persona] IS NULL AND @original_nombre1_persona IS NULL)) AND (([nombre2_persona] = @original_nombre2_persona) OR ([nombre2_persona] IS NULL AND @original_nombre2_persona IS NULL)) AND (([direccion_persona] = @original_direccion_persona) OR ([direccion_persona] IS NULL AND @original_direccion_persona IS NULL)) AND (([celular_persona] = @original_celular_persona) OR ([celular_persona] IS NULL AND @original_celular_persona IS NULL)) AND (([telefono_persona] = @original_telefono_persona) OR ([telefono_persona] IS NULL AND @original_telefono_persona IS NULL)) AND (([email_persona] = @original_email_persona) OR ([email_persona] IS NULL AND @original_email_persona IS NULL)) AND (([creacion_persona] = @original_creacion_persona) OR ([creacion_persona] IS NULL AND @original_creacion_persona IS NULL)) AND (([actualizacion_persona] = @original_actualizacion_persona) OR ([actualizacion_persona] IS NULL AND @original_actualizacion_persona IS NULL)) AND (([estado_persona] = @original_estado_persona) OR ([estado_persona] IS NULL AND @original_estado_persona IS NULL))" InsertCommand="INSERT INTO [tbl_persona] ([id_identificacion], [id_tipopersona], [numero_identificacionpersona], [apellido1_persona], [apellido2_persona], [nombre1_persona], [nombre2_persona], [direccion_persona], [celular_persona], [telefono_persona], [email_persona], [creacion_persona], [actualizacion_persona], [estado_persona]) VALUES (@id_identificacion, @id_tipopersona, @numero_identificacionpersona, @apellido1_persona, @apellido2_persona, @nombre1_persona, @nombre2_persona, @direccion_persona, @celular_persona, @telefono_persona, @email_persona, @creacion_persona, @actualizacion_persona, @estado_persona)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT tbl_persona.id_persona, tbl_persona.id_identificacion, tbl_persona.id_tipopersona, tbl_persona.numero_identificacionpersona, tbl_persona.apellido1_persona, tbl_persona.apellido2_persona, tbl_persona.nombre1_persona, tbl_persona.nombre2_persona, tbl_persona.direccion_persona, tbl_persona.celular_persona, tbl_persona.telefono_persona, tbl_persona.email_persona, tbl_persona.creacion_persona, tbl_persona.actualizacion_persona, tbl_persona.estado_persona, tbl_identificacion.descripcion_identificacion, tbl_tipo_persona.descripcion_tipopersona FROM tbl_persona INNER JOIN tbl_identificacion ON tbl_persona.id_identificacion = tbl_identificacion.id_identificacion INNER JOIN tbl_tipo_persona ON tbl_persona.id_tipopersona = tbl_tipo_persona.id_tipopersona WHERE (tbl_persona.estado_persona = @estado_persona)" UpdateCommand="UPDATE [tbl_persona] SET [id_identificacion] = @id_identificacion, [id_tipopersona] = @id_tipopersona, [numero_identificacionpersona] = @numero_identificacionpersona, [apellido1_persona] = @apellido1_persona, [apellido2_persona] = @apellido2_persona, [nombre1_persona] = @nombre1_persona, [nombre2_persona] = @nombre2_persona, [direccion_persona] = @direccion_persona, [celular_persona] = @celular_persona, [telefono_persona] = @telefono_persona, [email_persona] = @email_persona, [creacion_persona] = @creacion_persona, [actualizacion_persona] = @actualizacion_persona, [estado_persona] = @estado_persona WHERE [id_persona] = @original_id_persona AND (([id_identificacion] = @original_id_identificacion) OR ([id_identificacion] IS NULL AND @original_id_identificacion IS NULL)) AND (([id_tipopersona] = @original_id_tipopersona) OR ([id_tipopersona] IS NULL AND @original_id_tipopersona IS NULL)) AND (([numero_identificacionpersona] = @original_numero_identificacionpersona) OR ([numero_identificacionpersona] IS NULL AND @original_numero_identificacionpersona IS NULL)) AND (([apellido1_persona] = @original_apellido1_persona) OR ([apellido1_persona] IS NULL AND @original_apellido1_persona IS NULL)) AND (([apellido2_persona] = @original_apellido2_persona) OR ([apellido2_persona] IS NULL AND @original_apellido2_persona IS NULL)) AND (([nombre1_persona] = @original_nombre1_persona) OR ([nombre1_persona] IS NULL AND @original_nombre1_persona IS NULL)) AND (([nombre2_persona] = @original_nombre2_persona) OR ([nombre2_persona] IS NULL AND @original_nombre2_persona IS NULL)) AND (([direccion_persona] = @original_direccion_persona) OR ([direccion_persona] IS NULL AND @original_direccion_persona IS NULL)) AND (([celular_persona] = @original_celular_persona) OR ([celular_persona] IS NULL AND @original_celular_persona IS NULL)) AND (([telefono_persona] = @original_telefono_persona) OR ([telefono_persona] IS NULL AND @original_telefono_persona IS NULL)) AND (([email_persona] = @original_email_persona) OR ([email_persona] IS NULL AND @original_email_persona IS NULL)) AND (([creacion_persona] = @original_creacion_persona) OR ([creacion_persona] IS NULL AND @original_creacion_persona IS NULL)) AND (([actualizacion_persona] = @original_actualizacion_persona) OR ([actualizacion_persona] IS NULL AND @original_actualizacion_persona IS NULL)) AND (([estado_persona] = @original_estado_persona) OR ([estado_persona] IS NULL AND @original_estado_persona IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_id_persona" Type="Int32" />
                    <asp:Parameter Name="original_id_identificacion" Type="Int32" />
                    <asp:Parameter Name="original_id_tipopersona" Type="Int32" />
                    <asp:Parameter Name="original_numero_identificacionpersona" Type="String" />
                    <asp:Parameter Name="original_apellido1_persona" Type="String" />
                    <asp:Parameter Name="original_apellido2_persona" Type="String" />
                    <asp:Parameter Name="original_nombre1_persona" Type="String" />
                    <asp:Parameter Name="original_nombre2_persona" Type="String" />
                    <asp:Parameter Name="original_direccion_persona" Type="String" />
                    <asp:Parameter Name="original_celular_persona" Type="String" />
                    <asp:Parameter Name="original_telefono_persona" Type="String" />
                    <asp:Parameter Name="original_email_persona" Type="String" />
                    <asp:Parameter Name="original_creacion_persona" Type="DateTime" />
                    <asp:Parameter Name="original_actualizacion_persona" Type="DateTime" />
                    <asp:Parameter Name="original_estado_persona" Type="String" />
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
                    <asp:Parameter Name="creacion_persona" Type="DateTime" />
                    <asp:Parameter Name="actualizacion_persona" Type="DateTime" />
                    <asp:Parameter Name="estado_persona" Type="String" />
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
                    <asp:Parameter Name="actualizacion_persona" Type="DateTime" />
                    <asp:Parameter Name="estado_persona" Type="String" />
                    <asp:Parameter Name="original_id_persona" Type="Int32" />
                    <asp:Parameter Name="original_id_identificacion" Type="Int32" />
                    <asp:Parameter Name="original_id_tipopersona" Type="Int32" />
                    <asp:Parameter Name="original_numero_identificacionpersona" Type="String" />
                    <asp:Parameter Name="original_apellido1_persona" Type="String" />
                    <asp:Parameter Name="original_apellido2_persona" Type="String" />
                    <asp:Parameter Name="original_nombre1_persona" Type="String" />
                    <asp:Parameter Name="original_nombre2_persona" Type="String" />
                    <asp:Parameter Name="original_direccion_persona" Type="String" />
                    <asp:Parameter Name="original_celular_persona" Type="String" />
                    <asp:Parameter Name="original_telefono_persona" Type="String" />
                    <asp:Parameter Name="original_email_persona" Type="String" />
                    <asp:Parameter Name="original_creacion_persona" Type="DateTime" />
                    <asp:Parameter Name="original_actualizacion_persona" Type="DateTime" />
                    <asp:Parameter Name="original_estado_persona" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            
            <asp:LinkButton ID="LinkButton3" runat="server" data-target="#exampleModal" data-toggle="modal" CssClass="btn btn-primary">Nuevo <i class="icon_plus_alt2"></i></asp:LinkButton>
            
            <br />

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id_persona" DataSourceID="sqldsPersonas">
                <Columns>
                    <asp:BoundField DataField="id_persona" HeaderText="id_persona" InsertVisible="False" ReadOnly="True" SortExpression="id_persona" />
                    <asp:BoundField DataField="id_identificacion" HeaderText="id_identificacion" SortExpression="id_identificacion" />
                    <asp:BoundField DataField="id_tipopersona" HeaderText="id_tipopersona" SortExpression="id_tipopersona" />
                    <asp:BoundField DataField="numero_identificacionpersona" HeaderText="numero_identificacionpersona" SortExpression="numero_identificacionpersona" />
                    <asp:BoundField DataField="apellido1_persona" HeaderText="apellido1_persona" SortExpression="apellido1_persona" />
                    <asp:BoundField DataField="apellido2_persona" HeaderText="apellido2_persona" SortExpression="apellido2_persona" />
                    <asp:BoundField DataField="nombre1_persona" HeaderText="nombre1_persona" SortExpression="nombre1_persona" />
                    <asp:BoundField DataField="nombre2_persona" HeaderText="nombre2_persona" SortExpression="nombre2_persona" />
                    <asp:BoundField DataField="direccion_persona" HeaderText="direccion_persona" SortExpression="direccion_persona" />
                    <asp:BoundField DataField="celular_persona" HeaderText="celular_persona" SortExpression="celular_persona" />
                    <asp:BoundField DataField="telefono_persona" HeaderText="telefono_persona" SortExpression="telefono_persona" />
                    <asp:BoundField DataField="email_persona" HeaderText="email_persona" SortExpression="email_persona" />
                    <asp:BoundField DataField="creacion_persona" HeaderText="creacion_persona" SortExpression="creacion_persona" />
                    <asp:BoundField DataField="actualizacion_persona" HeaderText="actualizacion_persona" SortExpression="actualizacion_persona" />
                    <asp:BoundField DataField="estado_persona" HeaderText="estado_persona" SortExpression="estado_persona" />
                    <asp:BoundField DataField="descripcion_identificacion" HeaderText="descripcion_identificacion" SortExpression="descripcion_identificacion" />
                    <asp:BoundField DataField="descripcion_tipopersona" HeaderText="descripcion_tipopersona" SortExpression="descripcion_tipopersona" />
                </Columns>
            </asp:GridView>



            






        </div>
    </section>
</asp:Content>
