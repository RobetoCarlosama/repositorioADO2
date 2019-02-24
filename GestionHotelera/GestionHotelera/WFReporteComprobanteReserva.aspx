<%@ Page Title="" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="WFReporteComprobanteReserva.aspx.cs" Inherits="GestionHotelera.WFReporteComprobanteReserva" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.3500.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Comprobante</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <CR:CrystalReportViewer ID="CrystalReportViewerComprobante" runat="server" AutoDataBind="true" ReportSourceID="CrystalReportSourceComprobante" ToolPanelView="None" />
    <CR:CrystalReportSource ID="CrystalReportSourceComprobante" runat="server">
        <Report FileName="CRindividual.rpt">
        </Report>
    </CR:CrystalReportSource>
</asp:Content>
