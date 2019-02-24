<%@ Page Title="" Language="C#" MasterPageFile="~/home2.Master" AutoEventWireup="true" CodeBehind="wfh2ReporteFacturaCliente.aspx.cs" Inherits="GestionHotelera.wfh2ReporteFacturaCliente" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.3500.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Factura Cliente</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <CR:CrystalReportViewer ID="CrystalReportViewerClienteh2" runat="server" AutoDataBind="true" ReportSourceID="CrystalReportSourceClienteh2" ToolPanelView="None" />
    <CR:CrystalReportSource ID="CrystalReportSourceClienteh2" runat="server">
        <report filename="CRFactura.rpt">
        </report>
    </CR:CrystalReportSource>
</asp:Content>
