<%@ Page EnableEventValidation="false" Title="" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="inicio.aspx.cs" Inherits="GestionHotelera.inicio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Sección de Inicio</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="Label1" runat="server" Text="Label" Font-Size="X-Large">Bienvenido al sistema</asp:Label>
    <img src="img/red.jpg" width="100%" height="380px"/>
</asp:Content>
