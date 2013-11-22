<%@ Page Title="" Language="C#" MasterPageFile="~/lib/master/Rek.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="lib_pages_Rek_Default" %>
<%@ Import Namespace="docsoft" %>

<%@ Register src="/lib/ui/rek/post/Newest.ascx" tagname="Newest" tagprefix="uc1" %>

<%@ Register src="/lib/ui/rek/heThong/TagCloud.ascx" tagname="TagCloud" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>
        Rek.vn
    </title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <%if(!Security.IsAuthenticated())
      {%>
    <div class="alert alert-success">
        <span class="rek-logo">Rek.vn</span> có các video bạn cần phải xem. Rek chạy cực nhanh, rất dễ dùng và <strong>thú vị cực!</strong> 
    </div>
    <% } %>
    <div class="row">
        <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
            <uc1:Newest ID="Newest1" runat="server" />            
        </div>
        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
            <div class="well well-sm">
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
            <uc2:TagCloud ID="TagCloud1" runat="server" />
        </div>
    </div>

</asp:Content>

