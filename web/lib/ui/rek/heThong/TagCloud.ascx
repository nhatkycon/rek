<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TagCloud.ascx.cs" Inherits="lib_ui_rek_heThong_TagCloud" %>

<div class="panel panel-default">
  <div class="panel-heading">
      <i class="glyphicon glyphicon-tag"></i> Tag
  </div>
  <div class="panel-body">
    <% foreach (var item in List)
       {%>
        <a class="btn btn-link" href="/lib/pages/Rek/Tag.aspx?Tag=<%=item.Ten %>">
            <%=item.Ten %>
        </a>  
    <%   } %>
  </div>
</div>
