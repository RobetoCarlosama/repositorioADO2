<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="GestionHotelera.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <br />
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="id_identificacion" DataSourceID="pruebasci" DefaultMode="Insert" Height="50px" Width="125px">
            <Fields>
                <asp:BoundField DataField="id_identificacion" HeaderText="id_identificacion" InsertVisible="False" ReadOnly="True" SortExpression="id_identificacion" Visible="False" />
                <asp:TemplateField HeaderText="descripcion_identificacion" SortExpression="descripcion_identificacion">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("descripcion_identificacion") %>'>
                            <asp:ListItem Value="">Seleccione</asp:ListItem>
                            <asp:ListItem Value="CEDULA">CEDULA</asp:ListItem>
                            <asp:ListItem Value="PASAPORTE">PASAPORTE</asp:ListItem>
                            <asp:ListItem Value="RUC">RUC</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DropDownList1" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("descripcion_identificacion") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="creacion_identificacion" HeaderText="creacion_identificacion" SortExpression="creacion_identificacion" Visible="False" />
                <asp:BoundField DataField="actualizacion_identificacion" HeaderText="actualizacion_identificacion" SortExpression="actualizacion_identificacion" Visible="False" />
                <asp:BoundField DataField="estado_identificacion" HeaderText="estado_identificacion" SortExpression="estado_identificacion" Visible="False" />
                <asp:CommandField ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id_identificacion" DataSourceID="pruebasci">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="id_identificacion" HeaderText="id_identificacion" InsertVisible="False" ReadOnly="True" SortExpression="id_identificacion" />
                <asp:BoundField DataField="descripcion_identificacion" HeaderText="descripcion_identificacion" SortExpression="descripcion_identificacion" />
                <asp:BoundField DataField="creacion_identificacion" HeaderText="creacion_identificacion" SortExpression="creacion_identificacion" />
                <asp:BoundField DataField="actualizacion_identificacion" HeaderText="actualizacion_identificacion" SortExpression="actualizacion_identificacion" />
                <asp:BoundField DataField="estado_identificacion" HeaderText="estado_identificacion" SortExpression="estado_identificacion" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="pruebasci" runat="server" ConnectionString="<%$ ConnectionStrings:gestionHoteleraConnectionString %>" DeleteCommand="DELETE FROM [tbl_identificacion] WHERE [id_identificacion] = @id_identificacion" InsertCommand="INSERT INTO [tbl_identificacion] ([descripcion_identificacion], [creacion_identificacion], [actualizacion_identificacion], [estado_identificacion]) VALUES (@descripcion_identificacion, @creacion_identificacion, @actualizacion_identificacion, @estado_identificacion)" SelectCommand="SELECT * FROM [tbl_identificacion] WHERE ([estado_identificacion] = @estado_identificacion)" UpdateCommand="UPDATE [tbl_identificacion] SET [descripcion_identificacion] = @descripcion_identificacion, [creacion_identificacion] = @creacion_identificacion, [actualizacion_identificacion] = @actualizacion_identificacion, [estado_identificacion] = @estado_identificacion WHERE [id_identificacion] = @id_identificacion">
            <DeleteParameters>
                <asp:Parameter Name="id_identificacion" Type="Int32" />
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
                <asp:Parameter Name="id_identificacion" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
