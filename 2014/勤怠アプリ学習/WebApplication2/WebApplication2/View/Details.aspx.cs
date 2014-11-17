using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2.View
{
    public partial class Details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //クエリから日付を取得
            string strDate = Page.Request.QueryString.Get("selectday");
            string year = strDate.Substring(0, 4);
            string month = strDate.Substring(5, 2);
            string day = strDate.Substring(8, 2);
            this.lblYear.Text = year;
            this.lblMonth.Text = month;
            this.lblDay.Text = day;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Roster.aspx", false);
        }
    }
}