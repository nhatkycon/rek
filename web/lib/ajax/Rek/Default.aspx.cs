using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using docsoft;
using docsoft.entities;
using linh.common;
using linh.core;
using linh.core.dal;
using linh.json;

public partial class lib_ajax_Rek_Default : BasedPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        var Id = Request["ID"];
        var Url = Request["Url"];
        var login = Security.IsAuthenticated();
        var email = Request["email"];
        var name = Request["name"];
        var VideoUrl = Request["VideoUrl"];
        var Ten = Request["Ten"];
        var Anh = Request["Anh"];
        var Txt = Request["Txt"];
        var FromDate = Request["FromDate"];
        switch (subAct)
        {
            case "login":
                #region Login
                if(!string.IsNullOrEmpty(email))
                {
                    var u = MemberDal.SelectByUser(email);
                    if(u.ID==0)
                    {
                        u = MemberDal.Insert(new Member()
                                                 {
                                                     Username = email
                                                     ,Email = email
                                                     ,Ten = name
                                                     ,NgayTao = DateTime.Now
                                                     , NgayCapNhat = DateTime.Now
                                                 });
                    }
                    Security.Login(email, "true");
                }
                break;
                #endregion
            case "more":
                #region more
                using (var con = DAL.con())
                {
                    var List = CapNhatDal.Newest(con, "10", Security.Username, FromDate);
                    Newest1.List = List;
                    Newest1.Visible = true;
                }

                break;
                #endregion
            case "logout":
                #region logout this system
                Security.LogOut();
                break;
                #endregion
            case "removePost":
                #region removePost
                if (Security.IsAuthenticated())
                {
                    if (!string.IsNullOrEmpty(Id))
                    {
                        var item = CapNhatDal.SelectById(new Guid(Id));
                        if (item.Username == Security.Username)
                        {
                            CapNhatDal.DeleteById(item.ID);
                        }
                    }
                }
                break;
                #endregion
            case "wrappUrl":
                #region wrappUrl: Đọc url
                if (!string.IsNullOrEmpty(Url))
                {
                    youTubeVideo vd = Lib.YouTubeCode(Url);
                    rendertext(string.Format("({0})", JavaScriptConvert.SerializeObject(vd)));
                }
                break;
                #endregion

            case "savePost":
                #region Add or Save Post
                if(Security.IsAuthenticated())
                {
                    CapNhat Item;
                    if (string.IsNullOrEmpty(Id))
                    {
                        Item=new CapNhat
                                 {
                                     ID = Guid.NewGuid(),
                                     NgayTao = DateTime.Now,
                                     Username = Security.Username,
                                     NgayViet = DateTime.Now
                                 };
                    }
                    else
                    {
                        Item = CapNhatDal.SelectById(new Guid(Id));
                    }
                    Item.Ten = Ten;
                    Item.Anh = Anh;
                    Item.Loai = 3;// Video
                    Item.VideoUrl = VideoUrl;
                    Item = string.IsNullOrEmpty(Id) ? CapNhatDal.Insert(Item) : CapNhatDal.Update(Item);
                    rendertext(Item.ID.ToString());
                }
                break;
                #endregion
            case "addComment":
                #region Add comment to post
                if (Security.IsAuthenticated())
                {
                    var Item = new BinhLuan();
                    if (!string.IsNullOrEmpty(Id))
                    {
                        Item.P_RowId = new Guid(Id);
                    }
                    if (!string.IsNullOrEmpty(Txt))
                    {
                        Txt = Giga.Common.Lib._string.getHTML(Txt);
                    }
                    Item.ID = Guid.NewGuid();
                    Item.NoiDung = Txt;
                    Item.Username = Security.Username;
                    Item.NgayTao = DateTime.Now;
                    Item.Url = Url;
                    Item = BinhLuanDal.Insert(Item);
                    rendertext(Item.ID.ToString());
                }
                break;
                #endregion
            default:
                break;
        }
    }
}