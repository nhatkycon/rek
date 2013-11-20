<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Add.ascx.cs" Inherits="lib_ui_rek_post_Add" %>
<div class="post-box effect6">
    <div class="post VideoAdd" role="form">
            <div class="form-horizontal">
                <input name="ID" style="display: none;" value="<%=Id %>"/>
                <input placeholder="Video trên Youtube, ex: www.youtube.com/watch?v=8ZsFd2j35t0" 
                    class="input-xlarge form-control Url" 
                    style="width: 100%;" 
                    size="16" 
                    type="text"
                    name="Url"/>
                <br/>
                <input placeholder="Tiêu đề video của bạn" 
                    class="input-xlarge form-control Ten" 
                    style="width: 100%;" 
                    size="16" 
                    type="text"
                    name="Ten"/>
                <br />
                <textarea name="NoiDung" 
                class="NoiDung form-control"
                placeholder="Làm vài dòng mô tả cho nó sinh động"
                rows="3"></textarea>
                <br />
                <input placeholder="Thêm tag" 
                    class="input-xlarge form-control Tags" 
                    style="width: 100%;" 
                    data-role="tagsinput"
                    type="text"
                    name="Tags"/>
                <hr/>
                <div class="well-large video-view video-container">
                    <iframe data-yid="" data-img="" id="youtube-view" style="display: none;" width="500" height="281" src="" frameborder="0" allowfullscreen></iframe>
                    <input class="VideoUrl" name="VideoUrl" style="display: none;" value="<%=Item.VideoUrl %>"/>
                    <input class="Anh" name="Anh" style="display: none;" value="<%=Item.Anh %>"/>
                </div>
            </div>
        <br/>
            <%if(string.IsNullOrEmpty(Id)){ %>
                <a href="/" class="btn btn-default">
                    <i class="icon icon-arrow-left"></i>Quay lại
                </a>
                <a href="javascript:;" class="btn btn-success videoSaveBtn">Lưu</a>
            <%}else{ %>
                <a href="/?ID=<%=Id %>" class="btn btn-default">
                    <i class="icon icon-arrow-left"></i>Quay lại
                </a>
                <a href="javascript:;" class="btn btn-success videoSaveBtn">Lưu</a>
                <a href="javascript:;" class="btn btn-danger videoXoaBtn">Xóa</a>
            <%} %>
    </div>    
</div>

