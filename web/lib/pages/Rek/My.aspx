﻿<%@ Page Title="" Language="C#" MasterPageFile="~/lib/master/Rek.master" AutoEventWireup="true" CodeFile="My.aspx.cs" Inherits="lib_pages_Rek_My" %>

<%@ Register src="../../ui/rek/post/My.ascx" tagname="My" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:My ID="My1" runat="server" />
</asp:Content>

