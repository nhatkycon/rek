using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using docsoft;
using docsoft.entities;
using linh.core.dal;

public partial class lib_pages_Rek_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        using (var con = DAL.con())
        {
            var listCapNhat = CapNhatDal.Newest(con, "10",  Security.Username, null);
            Newest1.List = listCapNhat;
            var tags = TagsDal.SelectTop(con, 10);
            TagCloud1.List = tags;
        }
    }
}