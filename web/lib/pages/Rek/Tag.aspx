<%@ Page Title="" Language="C#" MasterPageFile="~/lib/master/Rek.master" AutoEventWireup="true" CodeFile="Tag.aspx.cs" Inherits="lib_pages_Rek_Tag" %>

<%@ Register src="/lib/ui/rek/post/ByTag.ascx" tagname="ByTag" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <%if(!string.IsNullOrEmpty(Tag))
      {%>
    <div class="alert alert-success">
        từ khóa: <span class="rek-logo">Rek.vn</span>
    </div>
    <% } %>
    <div class="row">
        <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
            <uc1:ByTag ID="ByTag1" runat="server" />
        </div>
        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
            <div class="alert alert-warning">
                <p>
                    <i class="icon icon-facetime-video icon-large"></i> Video thú vị từ việt nam + quốc tế
                </p>
                <p>
                    <i class="icon icon-facebook-sign icon-large"></i> Dùng tài khoản Facebook của bạn, chỉ mất 3s
                </p>
                <p>
                    <i class="icon icon-share-sign icon-large"></i> Comment để chia sẻ niềm vui bạn xem từ Rek
                </p>
            </div>
        </div>
    </div>
</asp:Content>

