﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Post_ViewTemplate.ascx.cs" Inherits="lib_ui_rek_post_templates_Post_ViewTemplate" %>
<%@ Import Namespace="docsoft" %>
<%@ Import Namespace="linh.common" %>
<%@ Register src="~/lib/ui/rek/post/Related.ascx" tagname="Related" tagprefix="uc2" %>


<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
    <% switch (Item.Loai)
        {%>
            <%case 1: %>
            <div class="post-view">
                <div class="post" data-id="<%=Item.ID %>">
                    <div class="post-date">
                        <span class="post-date-lbl">Ngày</span>
                        <span class="post-date-day"><%= Item.NgayViet.Day %></span>
                        <span class="post-date-separate">/</span>
                        <span class="post-date-month"><%= Item.NgayViet.ToString("MM/yy") %></span>
                        <span class="post-date-lbl">, lúc </span>
                        <span class="post-date-time"><%= Item.NgayViet.ToString("hh:mm") %></span>
                    </div>
                    <div class="post-task">
                        <%if(Item.Username==Security.Username){ %>
                        <a data-id="<% =Item.ID %>" href="javascript:;" class="icon-remove icon-large post-remove">
                        </a>
                        <%}else{ %>
                        <a data-id="<% =Item.ID %>" href="javascript:;" class="icon-heart icon-large post-likeBtn<% = Item.Thich ? " liked" : "" %>">
                        </a>
                        <%} %>
                    </div>
                    <div class="post-body">
                        <a href="/lib/pages/NhatKy/Post.aspx?ID=<%=Item.ID %>" class="post-title"><%=Item.Ten %></a>
                        <%if (!string.IsNullOrEmpty(Item.Anh)){ %>
                        <span class="post-img-box post-img-box-view">
                            <img src="/lib/up/i/<%=Item.Anh %>" class="post-img"/>                        
                        </span>
                        <%} %>
                        <hr/>
                        <div class="post-content">
                            <%=Item.NoiDung %>
                        </div>
                    </div>
                    <div class="post-footer">
                        <a href="/lib/pages/NhatKy/Post.aspx?ID=<%=Item.ID %>" class="post-comments">
                            <i class="icon-comment icon-large"></i>
                            <%if (Item.LuotBinhLuan > 0)
                              { %>
                                <%= Item.LuotBinhLuan %>&nbsp;
                            <% }%>
                            Bình luận
                        </a>
                        <div class="post-fbLikeBox">
                            <div class="fb-like" data-href="http://nhatkycon.com/lib/pages/NhatKy/Post.aspx?ID=<%=Item.ID %>" data-send="true" data-layout="button_count" data-width="120" data-show-faces="false"></div>
                        </div>
                    </div>
                </div>
            </div>
            <meta property="og:title" content="Nhật ký: <%=Item.Ten %>" />
            <meta property="og:description" content="<%=Lib.Rutgon(Giga.Common.Lib._string.getHTML(Item.NoiDung),300) %>" />
            <% if (!string.IsNullOrEmpty(Item.Anh))
                { %>
            <meta property="og:image" content="/lib/up/i/<%=Item.Anh %>" />
            <% }%>
            <%break;%>

            <%case 2: %>
            <div class="post-view">
                <div class="post" data-id="<%=Item.ID %>">
                    <div class="post-date">
                        <span class="post-date-lbl">Ngày</span>
                        <span class="post-date-day"><%= Item.NgayViet.Day %></span>
                        <span class="post-date-separate">/</span>
                        <span class="post-date-month"><%= Item.NgayViet.ToString("MM/yy") %></span>
                        <span class="post-date-lbl">, lúc </span>
                        <span class="post-date-time"><%= Item.NgayViet.ToString("hh:mm") %></span>
                        <span class="post-event">
                            <i class="icon-calendar"></i>
                            <%=Item.HoatDong_Ten%>
                        </span>
                    </div>
                    <div class="post-task">
                        <%if(Item.Username==Security.Username){ %>
                        <a data-id="<% =Item.ID %>" href="javascript:;" class="icon-remove icon-large post-remove">
                        </a>
                        <%}else{ %>
                        <a data-id="<% =Item.ID %>" href="javascript:;" class="icon-heart icon-large post-likeBtn<% = Item.Thich ? " liked" : "" %>">
                        </a>
                        <%} %>
                    </div>
                    <div class="post-body">
                        <a href="/lib/pages/NhatKy/Post.aspx?ID=<%=Item.ID %>" class="post-title"><%=Item.Ten %></a>
                        <span class="post-img-box">
                            <img src="/lib/up/i/<%=Item.Anh %>" class="post-img"/>                        
                        </span>
                        <div class="post-content">
                            <%=Item.NoiDung %>
                        </div>
                    </div>
                    <div class="post-footer">
                        <a href="/lib/pages/NhatKy/Post.aspx?ID=<%=Item.ID %>" class="post-comments">
                            <i class="icon-comment icon-large"></i>
                            <%if (Item.LuotBinhLuan > 0)
                              { %>
                                <%= Item.LuotBinhLuan %>&nbsp;
                            <% }%>
                            Bình luận
                        </a>
                        <div class="post-fbLikeBox">
                            <div class="fb-like" data-href="http://nhatkycon.com/lib/pages/NhatKy/Post.aspx?ID=<%=Item.ID %>" data-send="true" data-layout="button_count" data-width="120" data-show-faces="false"></div>
                        </div>
                    </div>
                </div>
            </div>
            <meta property="og:title" content="Sự kiện: <%=Item.Ten %>" />
            <meta property="og:description" content="<%=Lib.Rutgon(Giga.Common.Lib._string.getHTML(Item.NoiDung),300) %>" />
            <% if (!string.IsNullOrEmpty(Item.Anh))
                { %>
            <meta property="og:image" content="/lib/up/i/<%=Item.Anh %>" />
            <% }%>
            <%break;%>
                
            <%case 3: %>
            <div class="post-view">
                <div class="post" data-id="<%=Item.ID %>">
                    <div class="post-date">
                        <span class="post-date-lbl">Ngày</span>
                        <span class="post-date-day"><%= Item.NgayViet.Day %></span>
                        <span class="post-date-separate">/</span>
                        <span class="post-date-month"><%= Item.NgayViet.ToString("MM/yy") %></span>
                        <span class="post-date-lbl">, lúc </span>
                        <span class="post-date-time"><%= Item.NgayViet.ToString("hh:mm") %></span>
                    </div>
                    <div class="post-task">
                        <%if(Item.Username==Security.Username){ %>
                        <a data-id="<% =Item.ID %>" href="javascript:;" class="icon-remove icon-large post-remove">
                        </a>
                        <%}else{ %>
                        <a data-id="<% =Item.ID %>" href="javascript:;" class="icon-heart icon-large post-likeBtn<% = Item.Thich ? " liked" : "" %>">
                        </a>
                        <%} %>
                    </div>
                    <div class="post-body">
                        <a href="/?ID=<%=Item.ID %>" class="post-title"><%=Item.Ten %></a>
                        <div class="post-video-box video-container">
                            <iframe width="520" height="293" src="http://www.youtube.com/embed/<%=Item.VideoUrl %>" frameborder="0" allowfullscreen></iframe>                            
                        </div>
                        <hr/>
                        <%if(!string.IsNullOrEmpty(Item.Tags)){ %>
                        <i class="glyphicon glyphicon-tag"></i> Tag: 
                            <% foreach (var item in Item.Tags.Split(','))
                               {%>
                               <a href="/lib/pages/rek/Tag.aspx?Tag=<%=item %>" class="btn btn-link"><%=item %></a>
                             <%  } %>
                        <%} %>
                        <hr/>
                        <div class="post-content">
                            <%=Item.NoiDung %>
                        </div>
                    </div>                   
                </div>
            </div>
            <%break;%>
                
            <%case 4: %>
            <div class="post-view">
                <div class="post" data-id="<%=Item.ID %>">
                    <div class="post-date">
                        <span class="post-date-lbl">Ngày</span>
                        <span class="post-date-day"><%= Item.NgayViet.Day %></span>
                        <span class="post-date-separate">/</span>
                        <span class="post-date-month"><%= Item.NgayViet.ToString("MM/yy") %></span>
                        <span class="post-date-lbl">, lúc </span>
                        <span class="post-date-time"><%= Item.NgayViet.ToString("hh:mm") %></span>
                        <a style="margin-left: 10px;" href="/lib/pages/NhatKy/Album.aspx?ID=<%=Item.AB_ID %>" class="btn">
                            <i class="icon icon-picture"></i>
                        </a>
                    </div>
                    <div class="post-task">
                        <%if(Item.Username==Security.Username){ %>
                        <a data-id="<% =Item.ID %>" href="javascript:;" class="icon-remove icon-large post-remove">
                        </a>
                        <%}else{ %>
                        <a data-id="<% =Item.ID %>" href="javascript:;" class="icon-heart icon-large post-likeBtn<% = Item.Thich ? " liked" : "" %>">
                        </a>
                        <%} %>
                    </div>
                    <div class="post-body">
                        <a href="/lib/pages/NhatKy/Post.aspx?ID=<%=Item.ID %>" class="post-title"><%=Item.Ten %></a>
                    
                        <%if(Item.Anhs != null){ %>
                        <% foreach (var anh in Item.Anhs)
                            {%>
                            <a href="/lib/pages/NhatKy/Album.aspx?ID=<%=Item.AB_ID %>" class="post-img-box post-img-box-view">
                                <img src="/lib/up/anh/<%=anh.FileAnh %>" class="post-img"/>                        
                            </a>
                        <%} %>
                        <%} %>
                    </div>
                    <div class="post-footer">
                        <a href="/lib/pages/NhatKy/Post.aspx?ID=<%=Item.ID %>" class="post-comments">
                            <i class="icon-comment icon-large"></i>
                            <%if (Item.LuotBinhLuan > 0)
                              { %>
                                <%= Item.LuotBinhLuan %>&nbsp;
                            <% }%>
                            Bình luận
                        </a>
                        <div class="post-fbLikeBox">
                            <div class="fb-like" data-href="http://nhatkycon.com/lib/pages/NhatKy/Post.aspx?ID=<%=Item.ID %>" data-send="true" data-layout="button_count" data-width="120" data-show-faces="false"></div>
                        </div>
                    </div>
                </div>
            </div>
            <meta property="og:title" content="Album ảnh: <%=Item.Ten %>" />
            <meta property="og:description" content="Album ảnh <%=Item.Ten %>" />
            <% if (!string.IsNullOrEmpty(Item.Anh))
                { %>
            <meta property="og:image" content="http://NhatKyCon.Vn/lib/up/i/<%=Item.Anh %>" />
            <% }%>
            <%break;%>                
            <%default: %>
            <%break;%>
        <% } %>
    <input class="postId" style="display: none;" value="<%=Item.ID %>"/>
</div>
<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
    <p class="visible-xs visible-sm hidden-lg hidden-md"><br/></p>
    <div class="post-box effect6">
        <div class="post">
            <div class="well well-small">
                <a href="javascript:;" class="post-comments">
                        <i class="glyphicon glyphicon-eye-open"></i>
                        <%=Item.LuotXem %>
                </a>
                <%if (Item.LuotBinhLuan > 0)
                    { %>
                    <a href="javascript:;" class="post-comments post-fbLikeBox">
                            <i class="glyphicon glyphicon-comment"></i>
                            <%= Item.LuotBinhLuan %>&nbsp;
                    </a>
                <% }%>
                <span class="post-fbLikeBox">
                    <div class="fb-like" data-href="http://rek.vn/?ID=<%=Item.ID %>" data-send="true" data-layout="button_count" data-width="120" data-show-faces="false"></div>
                </span>
            </div>
            <div class="fb-comments" 
                    data-href="http://rek.vn/?ID=<%=Request["ID"] %>" 
                    data-colorscheme="light" 
                    data-numposts="5" 
                    data-width="1000">
            </div>    
        </div>
    </div>    <uc2:Related ID="Related1" runat="server" />
</div>

