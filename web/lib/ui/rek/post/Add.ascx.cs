﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using docsoft.entities;

public partial class lib_ui_rek_post_Add : System.Web.UI.UserControl
{
    public CapNhat Item { get; set; }
    public string Id { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        Id = Request["ID"];
    }
}