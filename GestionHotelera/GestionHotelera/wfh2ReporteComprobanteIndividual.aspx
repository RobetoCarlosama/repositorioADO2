<%@ Page Title="" Language="C#" MasterPageFile="~/home2.Master" AutoEventWireup="true" CodeBehind="wfh2ReporteComprobanteIndividual.aspx.cs" Inherits="GestionHotelera.wfh2ReporteComprobanteIndividual" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.3500.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Comprobante Cliente</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <CR:CrystalReportViewer ID="CrystalReportViewerClienteh22" runat="server" AutoDataBind="true" ReportSourceID="CrystalReportSourceClienteh22" ToolPanelView="None" />
    <CR:CrystalReportSource ID="CrystalReportSourceClienteh22" runat="server">
        <Report FileName="CRindividual.rpt">
        </Report>
    </CR:CrystalReportSource>
</asp:Content>
