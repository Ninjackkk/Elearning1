﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Elearning1
{
    public partial class User : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lnkSignOut_Click(object sender, EventArgs e)
        {
            Session.Abandon(); 
            Response.Redirect("Login.aspx");
        }
    }
}