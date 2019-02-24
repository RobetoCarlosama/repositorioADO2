<%@ Page Title="" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="WFReporteFactura.aspx.cs" Inherits="GestionHotelera.WFReporteFactura" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.3500.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Reporte factura</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <CR:CrystalReportViewer ID="CrystalReportViewerFactura" runat="server" AutoDataBind="true" ReportSourceID="CrystalReportSourceFactura" ToolPanelView="None" />

    <CR:CrystalReportSource ID="CrystalReportSourceFactura" runat="server">
        <Report FileName="CRFactura.rpt">
        </Report>
    </CR:CrystalReportSource>
</asp:Content>
