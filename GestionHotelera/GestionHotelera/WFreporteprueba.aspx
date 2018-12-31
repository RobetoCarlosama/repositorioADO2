<%@ Page Title="" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="WFreporteprueba.aspx.cs" Inherits="GestionHotelera.WFreporteprueba" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.3500.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>ReportePrueba</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" ReportSourceID="CrystalReportSource1" ToolPanelView="None" discardsaveddata="true"/>
    <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
        <Report FileName="CRpruebas.rpt">
        </Report>
</CR:CrystalReportSource>
</asp:Content>
