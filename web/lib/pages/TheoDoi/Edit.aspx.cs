﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using docsoft;
using docsoft.entities;
using linh.core;
using linh.core.dal;


public partial class lib_pages_TheoDoi_Edit : BasedPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        var id = Request["BCTD_ID"];
        if (string.IsNullOrEmpty(id))
            return;
        
        using (var con = DAL.con())
        {
            var bctd = BaoCaoTheoDoiDal.SelectById(con, new Guid(id));
            var item = BeDal.SelectById(con, bctd.PID_ID, Security.Username);
            CoverImage1.BeItem = item;
            Navigator1.BeItem = item;



            var list = BaoCaoTheoDoiDal.SelectByPid(con, bctd.PID_ID.ToString());
            Navigator1.List = list;

            var dmItem = DanhMucDal.SelectById(con, bctd.LOAI_ID);
            var listTheoDoi = TheoDoiDal.SelectByBctd(con, id);
            TheoDoi_Edit1.Item = dmItem;
            TheoDoi_Edit1.List = listTheoDoi;
            TheoDoi_Edit1.BeItem = item;
            TheoDoi_Edit1.ItemBaoCao = bctd;
        }
    }
}