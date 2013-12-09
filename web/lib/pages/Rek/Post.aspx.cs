using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using docsoft;
using docsoft.entities;
using linh.core;
using linh.core.dal;

public partial class lib_pages_Rek_Post : BasedPage
{
    public string Id { get; set; }
    public CapNhat Item { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        Id = Request["ID"];
        if (string.IsNullOrEmpty(Id))
            return;
        using (var con = DAL.con())
        {
            Item = CapNhatDal.SelectById(con, new Guid(Id));
            Post_ViewTemplate1.Item = Item;
            Title = string.Format("{0} - Rek.vn", Item.Ten);
            var list = CapNhatDal.Newest(con, "10", Security.Username, null).ToList().Where(p => p.ID != new Guid(Id)).ToList();
            Post_ViewTemplate1.List = list;

        }
    }
}