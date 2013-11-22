<%@ Page Title="" Language="C#" MasterPageFile="~/lib/master/Rek.master" AutoEventWireup="true" CodeFile="Post.aspx.cs" Inherits="lib_pages_Rek_Post" %>

<%@ Register src="/lib/ui/rek/post/templates/Post_ViewTemplate.ascx" tagname="Post_ViewTemplate" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <meta property="fb:admins" content="740919195"/>
<meta property="fb:app_id" content="1391830844393294"/>
    <meta property="og:title" content="Video: <%=Item.Ten %>" />
            <meta property="og:description" content="Video <%=Item.NoiDung %>" />
            <% if (!string.IsNullOrEmpty(Item.Anh))
                { %>
            <meta property="og:image" content="http://img.youtube.com/vi/<%=Item.VideoUrl %>/hqdefault.jpg" />
            <% }%>
            <meta property="og:type" content="video">
            <meta property="og:video" content="http://www.youtube.com/v/<%=Item.VideoUrl %>?autohide=1&amp;version=3">
            <meta property="og:video:type" content="application/x-shockwave-flash">
            <meta property="og:video:width" content="640">
            <meta property="og:video:height" content="360">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <uc1:Post_ViewTemplate ID="Post_ViewTemplate1" runat="server" />
        
</asp:Content>

