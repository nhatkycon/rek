using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using docsoft;
using docsoft.entities;
using linh.core.dal;

public partial class lib_pages_Rek_My : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        using (var con = DAL.con())
        {
            var listCapNhat = CapNhatDal.SelectByUsername(con, "100", Security.Username);
            My1.List = listCapNhat;
        }
    }
}