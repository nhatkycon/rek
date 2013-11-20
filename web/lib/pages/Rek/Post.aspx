<%@ Page Title="" Language="C#" MasterPageFile="~/lib/master/Rek.master" AutoEventWireup="true" CodeFile="Post.aspx.cs" Inherits="lib_pages_Rek_Post" %>

<%@ Register src="/lib/ui/rek/post/templates/Post_ViewTemplate.ascx" tagname="Post_ViewTemplate" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <uc1:Post_ViewTemplate ID="Post_ViewTemplate1" runat="server" />
        
</asp:Content>

