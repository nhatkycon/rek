jQuery(function () {
    $('#__VIEWSTATE').remove();
    jQuery('form').submit(function () {
        return false;
    });
    rek.initialize();
});

var rek = {
    url: domain + '/lib/ajax/rek/Default.aspx'
    ,
    initialize: function () {
        rek.FbLogin();
        rek.AddPost();
        rek.FbFn();
        rek.wallFn();
    }
    , wallFn: function () {
        $(document).on('click', '.post-remove', function () {
            var item = $(this);
            var id = item.attr('data-id');

            item.parent().parent().parent().addClass('animated bounceOutRight');
            setTimeout(function () {
                item.parent().parent().parent().remove();
            }, 1000);


            $.ajax({
                url: rek.url,
                data: {
                    subAct: 'removePost',
                    ID: id
                },
                success: function () {

                }
            });
        });

        $(document).on('click', '.post-more-btn', function () {
            var item = $(this);
            var id = item.attr('data-id');
            var list = item.parent().parent().parent().parent();
            var pitem = item.parent().parent().parent();
            var date = item.attr('data-date');
            item.hide();
            $.ajax({
                url: rek.url,
                data: {
                    subAct: 'more',
                    ID: id,
                    FromDate: date
                },
                success: function (_rs) {

                    $(_rs).appendTo(list);
                    pitem.remove();
                }
            });
        });

    }
    , LoginFn: function (email, name) {
        var data = { email: email, name: name, subAct: 'login' };
        $.ajax({
            url: rek.url
            , data: data
            , success: function () {
                document.location.reload();
            }
        });
    }
    , AddPost: function () {
        var AddVideoDialog = $('.VideoAdd');
        if ($(AddVideoDialog).length < 1) return;

        var Url = AddVideoDialog.find('.Url');
        var Ten = AddVideoDialog.find('.Ten');
        var Savebtn = AddVideoDialog.find('.videoSaveBtn');
        var YouTubeView = AddVideoDialog.find('#youtube-view');
        var VideoUrl = AddVideoDialog.find('.VideoUrl');
        var Anh = AddVideoDialog.find('.Anh');
        var NoiDung = AddVideoDialog.find('.NoiDung');
        var ID = AddVideoDialog.find('.ID');


        Savebtn.click(function () {
            var _Ten = Ten.val();
            var _VideoUrl = VideoUrl.val();
            if (_Ten == '' || _VideoUrl == '') {
                alert('Nhập video nào bạn ơi!')
                return;
            }
            var data = AddVideoDialog.find(':input').serializeArray();
            data.push({ name: 'subAct', value: 'savePost' });
            $.ajax({
                url: rek.url
                , type: 'POST'
               , data: data
               , success: function (dt) {
                   document.location.href = domain + '/?ID=' + dt;
               }
            });
        });



        Url.blur(function () {
            var _Url = Url.val();
            if (_Url != '') {
                YouTubeView.hide();
                $.ajax({
                    url: rek.url,
                    data: {
                        subAct: 'wrappUrl',
                        Url: _Url
                    },
                    success: function (_rs) {
                        var rs = eval(_rs);
                        YouTubeView.show();
                        YouTubeView.attr('src', 'http://www.youtube.com/embed/' + rs.YId);
                        VideoUrl.val(rs.YId);
                        Ten.val(rs.Ten);
                        NoiDung.val(rs.MoTa);
                        Anh.val(rs.Anh);
                    }
                });
            }
        });

    }
    , FbLogin: function () {
        var logout = $('.logoutbtn');
        logout.click(function () {
            var data = { subAct: 'logout' };
            $.ajax({
                url: rek.url
                , data: data
                , success: function () {
                    FB.logout(function () { document.location.reload(); });
                    setTimeout(function () {
                        document.location.reload();
                    }, 2000);
                }
            });
        });




        if (logged) return;
        var btn = $('.loginbtn');
        btn.click(function () {
            FB.login(function (response) {
            }, { scope: 'email' });
        });
        FB.Event.subscribe('auth.authResponseChange', function (response) {
            if (response.status === 'connected') {
                FB.api('/me', function (res) {
                    rek.LoginFn(res.email, res.name);
                });
            }
            else {
                //UNKNOWN ERROR. Logged Out
            }
        });
    }
    , FbFn: function () {
        var postId = $('.postId');
        if ($(postId).length < 1) return;
        var pid = postId.val();
        FB.Event.subscribe('comment.create', function (post) {
            FB.api({
                method: 'fql.query',
                query: 'SELECT text, post_fbid FROM comment WHERE object_id IN (SELECT comments_fbid FROM link_stat WHERE url = "' + post.href + '")'
            }, function (comments) {
                /* Iterate through the all comments for this url */
                for (var i = 0; i < comments.length; i++) {
                    /* Find the created comment text by its ID */
                    if (comments[i].post_fbid == post.commentID) {
                        $.ajax({
                            url: rek.url,
                            data: {
                                subAct: 'addComment',
                                ID: pid,
                                Url: document.location.href,
                                Txt: comments[i].text
                            },
                            success: function () {
                            }
                        });
                    }
                }
            });
        });
    }
};

