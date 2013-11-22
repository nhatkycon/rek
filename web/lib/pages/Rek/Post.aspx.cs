using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using docsoft.entities;
using linh.core;
using linh.core.dal;

public partial class lib_pages_Rek_Post : BasedPage
{
    public string ID { get; set; }
    public CapNhat Item { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        ID = Request["ID"];
        if (string.IsNullOrEmpty(ID))
            return;
        using (var con = DAL.con())
        {
            Item = CapNhatDal.SelectById(con, new Guid(ID));
            Post_ViewTemplate1.Item = Item;
            Title = string.Format("{0} - Rek.vn", Item.Ten);
            
        }
    }
}