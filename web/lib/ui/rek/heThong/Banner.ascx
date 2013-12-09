<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Banner.ascx.cs" Inherits="lib_ui_rek_heThong_Banner" %>
<%@ Import Namespace="docsoft" %>
<%@ Register src="about.ascx" tagname="about" tagprefix="uc1" %>
<div class="navbar-wrapper">
    <div class="navbar navbar-default navbar-fixed-top" role="navigation">
        <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/">
                <span class="rek-logo rek-logo-36">Rek.vn</span>
                <span class="rek-slogan">fun video</span>
            </a>            
        </div>
        <div class="navbar-collapse collapse">
        <%--<ul class="nav navbar-nav">
                <%--<li class="active">
                    <a href="#">Home</a>
                </li>
                <li><a href="#about">About</a></li>
                <li><a href="#contact">Contact</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                    <li><a href="#">Action</a></li>
                    <li><a href="#">Another action</a></li>
                    <li><a href="#">Something else here</a></li>
                    <li class="divider"></li>
                    <li class="dropdown-header">Nav header</li>
                    <li><a href="#">Separated link</a></li>
                    <li><a href="#">One more separated link</a></li>
                    </ul>
                </li>
            </ul>--%>
            
            <ul class="nav navbar-nav navbar-right">
              <li>
                  <%if(Security.IsAuthenticated()){ %>
                  
                  <%}else{ %>
                  <a href="javascript:;" class="loginbtn">
                      Đăng nhập
                  </a>
                  <%} %>
                  
              </li>
            <%if(Security.IsAuthenticated()){ %>
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><%=Security.Username %> <b class="caret"></b></a>
                <ul class="dropdown-menu">
                  <li><a href="/lib/pages/Rek/My.aspx">Rek của tôi</a></li>
                  <li class="divider"></li>
                  <li>
                      <a href="#about" data-toggle="modal">Rek là gì?</a>
                  </li>
                    <li>
                        <a href="javascript:;" class="logoutbtn">
                              Thoát
                              <i class="icon icon-signout"></i>
                          </a>
                    </li>
                </ul>
              </li>
            <%} %>
            </ul>
            <div class="navbar-form navbar-right">
                <%if(Security.IsAuthenticated()){ %>
                    <a href="/lib/pages/Rek/Add.aspx" class="btn btn-primary">Bạn cũng có thể Đăng video</a>
                <%}else{ %>
                    <a href="javascript:;" class="btn btn-primary loginbtn">
                        <i class="icon icon-facebook-sign"></i>
                        Bạn cũng có thể Đăng video
                    </a>
                <%} %>
            </div>
        </div>
        </div>
    </div>
</div>
<uc1:about ID="about1" runat="server" />
