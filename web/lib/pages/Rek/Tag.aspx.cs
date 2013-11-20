using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using docsoft;
using docsoft.entities;
using linh.core.dal;

public partial class lib_pages_Rek_Tag : System.Web.UI.Page
{
    public string Tag { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        Tag = Request["Tag"];
        using (var con = DAL.con())
        {
            var listCapNhat = CapNhatDal.ByTag(con, "10", Security.Username, null,Tag);
            ByTag1.List = listCapNhat;
        }
    }
}