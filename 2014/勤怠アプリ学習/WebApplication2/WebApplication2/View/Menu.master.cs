using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication2.DBAccess;


namespace WebApplication2.View
{
    public partial class Menu : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Common common = new Common();
            Common.Logininfo logininfo = new Common.Logininfo();

            try
            {
                if (!this.IsPostBack)
                {
                    if (Session[Common.STR_LOGIN] != null)
                    {
                        logininfo = (Common.Logininfo)Session[Common.STR_LOGIN];
                        lblUserName.Text = logininfo.LoginUserName;
                    }
                }
            }
            catch (Exception ex)
            {
                string script = "<script language=javascript>" +
                                  "window.alert('エラーです')" +
                                  "</script>";
                Response.Write(script);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Session[Common.STR_LOGIN] != null)
            {
                Session.Remove(Common.STR_LOGIN);
            }
            Response.Redirect("Login.aspx", false);
        }
    }
}