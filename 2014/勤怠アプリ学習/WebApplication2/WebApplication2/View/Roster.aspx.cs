using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication2.DBAccess;


namespace WebApplication2.View
{
    public partial class Roster : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            string strDate=Calendar1.SelectedDate.ToString ();
            //string url = "http://localhost:60891/View/Details.aspx?selectday=" + Server.UrlEncode(strDate);
            //Response.Redirect(url);
            //Response.Redirect("Details.aspx",false);
            //クエリから日付を取得
            //string strDate = Page.Request.QueryString.Get("selectday");
            string year = strDate.Substring(0, 4);
            string month = strDate.Substring(5, 2);
            string day = strDate.Substring(8, 2);
            this.lblYear.Text = year;
            this.lblMonth.Text = month;
            this.lblDay.Text = day;
        }



    }
}