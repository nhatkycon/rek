using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using docsoft.entities;
using linh.core.dal;

public partial class lib_pages_Rek_Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ID = Request["ID"];
        using (var con = DAL.con())
        {
            if (string.IsNullOrEmpty(ID))
            {
                Add1.Item = new CapNhat();
            }
            else
            {
                var Item = CapNhatDal.SelectById(con, new Guid(ID));
                Add1.Item = Item;
            }
            
        }
    }
}