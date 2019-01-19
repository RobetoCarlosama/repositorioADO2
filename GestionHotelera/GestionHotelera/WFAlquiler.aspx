<%@ Page Title="" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="WFAlquiler.aspx.cs" Inherits="GestionHotelera.WFAlquiler" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Alquiler</title>
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
                            <h5 class="modal-title" id="exampleModalLabel">Nueva reserva</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <asp:DetailsView ID="DetailsView1" runat="server" Height="100%" Width="100%" AutoGenerateRows="False" DataKeyNames="id_alquiler" DataSourceID="sqldsArlquiler" DefaultMode="Insert" CssClass="table-responsive table-striped table-advance table-hover" GridLines="None" HorizontalAlign="Center">
                                <Fields>
                                    <asp:BoundField DataField="id_alquiler" HeaderText="id_alquiler" InsertVisible="False" ReadOnly="True" SortExpression="id_alquiler" Visible="False" />
                                    <asp:TemplateField HeaderText="Cliente" SortExpression="Cliente">
                                        <EditItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Cliente") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control error" DataSourceID="sqldsListarPersonasInsertarDDL" DataTextField="Cliente" DataValueField="id_persona" SelectedValue='<%# Bind("id_persona") %>'>
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="sqldsListarPersonasInsertarDDL" runat="server" ConnectionString="<%$ ConnectionStrings:gestionHoteleraConnectionString %>" SelectCommand="SELECT id_persona, numero_identificacionpersona + ' : ' + apellido1_persona + ' - ' + nombre1_persona AS Cliente FROM tbl_persona WHERE (estado_persona = @estado_persona) AND (id_tipopersona = @id_tipopersona)">
                                                <SelectParameters>
                                                    <asp:Parameter DefaultValue="A" Name="estado_persona" Type="String" />
                                                    <asp:Parameter DefaultValue="3" Name="id_tipopersona" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("Cliente") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="id_persona" HeaderText="id_persona" SortExpression="id_persona" Visible="False" />
                                    <asp:TemplateField HeaderText="fecha entrada" SortExpression="fechaentrada_alquiler">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("fechaentrada_alquiler") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("fechaentrada_alquiler") %>' CssClass="form-control error"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender ID="TextBox1_CalendarExtender" runat="server" TargetControlID="TextBox1" StartDate="<%# DateTime.Now.Date %>" CssClass="black" />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Debe selecionar la fecha de entrada" ForeColor="Red" ValidationGroup="insertarAlquiler">*</asp:RequiredFieldValidator>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("fechaentrada_alquiler") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="hora entrada" SortExpression="horaentrada_alquiler">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("horaentrada_alquiler") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:DropDownList ID="DropDownList3" runat="server" CssClass="form-control error" SelectedValue='<%# Bind("horaentrada_alquiler") %>'>
                                                <asp:ListItem Value="">Seleccione la hora de entrada</asp:ListItem>
                                                <asp:ListItem Value="00:00">00:00</asp:ListItem>
                                                <asp:ListItem Value="01:00">01:00</asp:ListItem>
                                                <asp:ListItem Value="02:00">02:00</asp:ListItem>
                                                <asp:ListItem Value="03:00">03:00</asp:ListItem>
                                                <asp:ListItem Value="04:00">04:00</asp:ListItem>
                                                <asp:ListItem Value="05:00">05:00</asp:ListItem>
                                                <asp:ListItem Value="06:00">06:00</asp:ListItem>
                                                <asp:ListItem Value="07:00">07:00</asp:ListItem>
                                                <asp:ListItem Value="08:00">08:00</asp:ListItem>
                                                <asp:ListItem Value="09:00">09:00</asp:ListItem>
                                                <asp:ListItem Value="10:00">10:00</asp:ListItem>
                                                <asp:ListItem Value="11:00">11:00</asp:ListItem>
                                                <asp:ListItem Value="12:00">12:00</asp:ListItem>
                                                <asp:ListItem Value="13:00">13:00</asp:ListItem>
                                                <asp:ListItem Value="14:00">14:00</asp:ListItem>
                                                <asp:ListItem Value="15:00">15:00</asp:ListItem>
                                                <asp:ListItem Value="16:00">16:00</asp:ListItem>
                                                <asp:ListItem Value="17:00">17:00</asp:ListItem>
                                                <asp:ListItem Value="18:00">18:00</asp:ListItem>
                                                <asp:ListItem Value="19:00">19:00</asp:ListItem>
                                                <asp:ListItem Value="20:00">20:00</asp:ListItem>
                                                <asp:ListItem Value="21:00">21:00</asp:ListItem>
                                                <asp:ListItem Value="22:00">22:00</asp:ListItem>
                                                <asp:ListItem Value="23:00">23:00</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DropDownList3" ErrorMessage="Debe  selecionar la hora de entrada" ForeColor="Red" ValidationGroup="insertarAlquiler">*</asp:RequiredFieldValidator>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("horaentrada_alquiler") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="fecha salida" SortExpression="fechasalida_alquiler">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("fechasalida_alquiler") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("fechasalida_alquiler") %>' CssClass="form-control error"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender ID="TextBox3_CalendarExtender" runat="server" TargetControlID="TextBox3" StartDate="<%# DateTime.Now.Date %>" CssClass="black" />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="Debe selecionar la fecha de salida" ForeColor="Red" ValidationGroup="insertarAlquiler">*</asp:RequiredFieldValidator>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("fechasalida_alquiler") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="hora salida" SortExpression="horasalida_alquiler">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("horasalida_alquiler") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:DropDownList ID="DropDownList4" runat="server" CssClass="form-control error" SelectedValue='<%# Bind("horasalida_alquiler") %>'>
                                                <asp:ListItem Value="">Selecione la hora de salida</asp:ListItem>
                                                <asp:ListItem Value="00:00">00:00</asp:ListItem>
                                                <asp:ListItem Value="01:00">01:00</asp:ListItem>
                                                <asp:ListItem Value="02:00">02:00</asp:ListItem>
                                                <asp:ListItem Value="03:00">03:00</asp:ListItem>
                                                <asp:ListItem Value="04:00">04:00</asp:ListItem>
                                                <asp:ListItem Value="05:00">05:00</asp:ListItem>
                                                <asp:ListItem Value="06:00">06:00</asp:ListItem>
                                                <asp:ListItem Value="07:00">07:00</asp:ListItem>
                                                <asp:ListItem Value="08:00">08:00</asp:ListItem>
                                                <asp:ListItem Value="09:00">09:00</asp:ListItem>
                                                <asp:ListItem Value="10:00">10:00</asp:ListItem>
                                                <asp:ListItem Value="11:00">11:00</asp:ListItem>
                                                <asp:ListItem Value="12:00">12:00</asp:ListItem>
                                                <asp:ListItem Value="13:00">13:00</asp:ListItem>
                                                <asp:ListItem Value="14:00">14:00</asp:ListItem>
                                                <asp:ListItem Value="15:00">15:00</asp:ListItem>
                                                <asp:ListItem Value="16:00">16:00</asp:ListItem>
                                                <asp:ListItem Value="17:00">17:00</asp:ListItem>
                                                <asp:ListItem Value="18:00">18:00</asp:ListItem>
                                                <asp:ListItem Value="19:00">19:00</asp:ListItem>
                                                <asp:ListItem Value="20:00">20:00</asp:ListItem>
                                                <asp:ListItem Value="21:00">21:00</asp:ListItem>
                                                <asp:ListItem Value="22:00">22:00</asp:ListItem>
                                                <asp:ListItem Value="23:00">23:00</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DropDownList4" ErrorMessage="Debe selecionar la hora de salida" ForeColor="Red" ValidationGroup="insertarAlquiler">*</asp:RequiredFieldValidator>
                                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="insertarAlquiler" />
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("horasalida_alquiler") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="creacion_alquiler" HeaderText="creacion_alquiler" SortExpression="creacion_alquiler" Visible="False" />
                                    <asp:BoundField DataField="actualizacion_alquiler" HeaderText="actualizacion_alquiler" SortExpression="actualizacion_alquiler" Visible="False" />
                                    <asp:BoundField DataField="estado_alquiler" HeaderText="estado_alquiler" SortExpression="estado_alquiler" Visible="False" />
                                    <asp:TemplateField ShowHeader="False">
                                        <InsertItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Insert" CssClass="btn btn-primary" Text="Insertar" ValidationGroup="insertarAlquiler"></asp:LinkButton>
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
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id_alquiler" DataSourceID="sqldsArlquiler" CssClass="table-responsive table-striped table-advance table-hover" GridLines="None" HorizontalAlign="Center" Height="100%" Width="100%">
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButtonActualizar" runat="server" CausesValidation="False" CommandName="Update" CssClass="btn btn-success"><i class="icon_check_alt2"></i></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButtonCancelar" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="btn btn-primary"><i class="icon_close_alt2"></i></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButtonEditar" runat="server" CausesValidation="False" CommandName="Edit" CssClass="btn btn-primary"><i class="icon_pencil"></i></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButtonEliminar" runat="server" CausesValidation="False" CommandName="Delete" CssClass="btn btn-danger" OnClientClick="return confirm('¿Seguro que desea eliminar el registro?');"><i class="icon_close_alt2"></i></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="id_alquiler" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="id_alquiler" />
                    <asp:TemplateField HeaderText="Cliente" SortExpression="Cliente">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="sqldsListarPersonas" DataTextField="Persona" DataValueField="id_persona" SelectedValue='<%# Bind("id_persona") %>' Width="95%">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="sqldsListarPersonas" runat="server" ConnectionString="<%$ ConnectionStrings:gestionHoteleraConnectionString %>" SelectCommand="SELECT id_persona, numero_identificacionpersona + ' :  ' + apellido1_persona + ' - ' + nombre1_persona AS Persona FROM tbl_persona WHERE (estado_persona = @estado_persona)">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="A" Name="estado_persona" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Cliente") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="id_persona" HeaderText="id_persona" SortExpression="id_persona" Visible="False" />
                    <asp:TemplateField HeaderText="fecha-entrada" SortExpression="fechaentrada_alquiler">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("fechaentrada_alquiler") %>'></asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="TextBox1_CalendarExtender" runat="server" CssClass="black" TargetControlID="TextBox1" StartDate="<%# DateTime.Now.Date %>" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("fechaentrada_alquiler") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="hora-entrada" SortExpression="horaentrada_alquiler">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("horaentrada_alquiler") %>' Width="60px"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("horaentrada_alquiler") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="fecha-salida" SortExpression="fechasalida_alquiler">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("fechasalida_alquiler") %>'></asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="TextBox3_CalendarExtender" runat="server" TargetControlID="TextBox3" StartDate="<%# DateTime.Now.Date %>" CssClass="black" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("fechasalida_alquiler") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="hora-salida" SortExpression="horasalida_alquiler">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("horasalida_alquiler") %>' Width="60px"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("horasalida_alquiler") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="creación" SortExpression="creacion_alquiler">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("creacion_alquiler") %>' ReadOnly="True" Width="95px"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("creacion_alquiler") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="actualización" SortExpression="actualizacion_alquiler">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("actualizacion_alquiler") %>' ReadOnly="True" Width="95px"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("actualizacion_alquiler") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="estado" SortExpression="estado_alquiler">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("estado_alquiler") %>' ReadOnly="True" Width="50px"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("estado_alquiler") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="sqldsArlquiler" runat="server" ConnectionString="<%$ ConnectionStrings:gestionHoteleraConnectionString %>" DeleteCommand="UPDATE [tbl_alquiler] SET [estado_alquiler] ='I' WHERE [id_alquiler] = @id_alquiler" InsertCommand="INSERT INTO [tbl_alquiler] ([id_persona], [fechaentrada_alquiler], [horaentrada_alquiler], [fechasalida_alquiler], [horasalida_alquiler], [creacion_alquiler], [actualizacion_alquiler], [estado_alquiler]) VALUES (@id_persona, @fechaentrada_alquiler, @horaentrada_alquiler, @fechasalida_alquiler, @horasalida_alquiler, GETDATE(), @actualizacion_alquiler, 'A')" SelectCommand="SELECT tbl_alquiler.id_alquiler, tbl_alquiler.id_persona, tbl_alquiler.fechaentrada_alquiler, tbl_alquiler.horaentrada_alquiler, tbl_alquiler.fechasalida_alquiler, tbl_alquiler.horasalida_alquiler, tbl_alquiler.creacion_alquiler, tbl_alquiler.actualizacion_alquiler, tbl_alquiler.estado_alquiler, tbl_persona.numero_identificacionpersona + ' : ' + tbl_persona.apellido1_persona + ' - ' + tbl_persona.nombre1_persona AS Cliente FROM tbl_alquiler INNER JOIN tbl_persona ON tbl_alquiler.id_persona = tbl_persona.id_persona WHERE (tbl_alquiler.estado_alquiler = @estado_alquiler)" UpdateCommand="UPDATE [tbl_alquiler] SET [id_persona] = @id_persona, [fechaentrada_alquiler] = @fechaentrada_alquiler, [horaentrada_alquiler] = @horaentrada_alquiler, [fechasalida_alquiler] = @fechasalida_alquiler, [horasalida_alquiler] = @horasalida_alquiler, [creacion_alquiler] = @creacion_alquiler, [actualizacion_alquiler] =GETDATE(), [estado_alquiler] = @estado_alquiler WHERE [id_alquiler] = @id_alquiler">
                <DeleteParameters>
                    <asp:Parameter Name="id_alquiler" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="id_persona" Type="Int32" />
                    <asp:Parameter Name="fechaentrada_alquiler" Type="DateTime" />
                    <asp:Parameter Name="horaentrada_alquiler" Type="DateTime" />
                    <asp:Parameter Name="fechasalida_alquiler" Type="DateTime" />
                    <asp:Parameter Name="horasalida_alquiler" Type="DateTime" />
                    <asp:Parameter Name="actualizacion_alquiler" Type="DateTime" />
                </InsertParameters>
                <SelectParameters>
                    <asp:Parameter DefaultValue="A" Name="estado_alquiler" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="id_persona" Type="Int32" />
                    <asp:Parameter Name="fechaentrada_alquiler" Type="DateTime" />
                    <asp:Parameter Name="horaentrada_alquiler" Type="DateTime" />
                    <asp:Parameter Name="fechasalida_alquiler" Type="DateTime" />
                    <asp:Parameter Name="horasalida_alquiler" Type="DateTime" />
                    <asp:Parameter Name="creacion_alquiler" Type="DateTime" />
                    <asp:Parameter Name="estado_alquiler" Type="String" />
                    <asp:Parameter Name="id_alquiler" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

        </div>
    </section>
</asp:Content>
