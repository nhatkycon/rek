﻿<%@ Page Title="" Language="C#" MasterPageFile="~/lib/master/Rek.master" AutoEventWireup="true" CodeFile="Add.aspx.cs" Inherits="lib_pages_Rek_Add" %>

<%@ Register src="/lib/ui/rek/post/Add.ascx" tagname="Add" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:Add ID="Add1" runat="server" />
</asp:Content>

