<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Newest.ascx.cs" Inherits="lib_ui_rek_post_Newest" %>
<%@ Register src="templates/Post_Templates.ascx" tagname="Post_Templates" tagprefix="uc2" %>
<%if(List != null){%>
         <asp:Repeater runat="server" ID="postList">
             <ItemTemplate>
                <uc2:Post_Templates ID="Post_Templates1" runat="server" Item='<%# Container.DataItem %>' />
             </ItemTemplate>
         </asp:Repeater>
     <%if(List.Count>9){ %>
         <div class="post-box effect6">
             <div class="post post-more" data-id="<%=Request["ID"] %>">
                     <div class="span5">
                 
                     </div>
                     <div class="span3">
                     <button data-date="<%=List.Last().NgayViet.ToString("yyyy-MM-dd HH:mm:s") %>" data-id="<%=Request["ID"] %>" class="btn btn-info post-more-btn">
                         Xem thêm
                     </button>                 
                     </div>
                     <div class="span4">
                     </div>    
             </div>
         </div>
     <%} %>
<%} else{%>
<%} %>
