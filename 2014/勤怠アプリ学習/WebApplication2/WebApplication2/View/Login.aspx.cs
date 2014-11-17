using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using WebApplication2.DBAccess;
using System.Data;


namespace WebApplication2.View
{
    public partial class Login : System.Web.UI.Page
    {
        

        protected void Page_Load(object sender, EventArgs e)
        {
            //セッション情報を破棄
            if(!this.IsPostBack){
                Session.Remove(Common .STR_LOGIN );
            }
           
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            
            LoginDBAccess loginDBaccess = new LoginDBAccess();
            MySqlDataReader dataReader = null;
            Common.Logininfo logininfo = new Common.Logininfo ();
            //DataTable dt = new DataTable();
            string[] sessionString = new string[3];


            try
            {
                sessionString = loginDBaccess.getDataReader(this.txtID.Text, this.txtPassword.Text);

                if (sessionString.Length  == 0)
                {
                    //列挙体から取得するように修正
                    string script = "<script language=javascript>" +
                                    "window.alert('正しいＩＤ・パスワードを入力してください')" +
                                    "</script>";
                    Response.Write(script);
                    this.ltrErr.Text = "正しいＩＤ・パスワードを入力してください";
                    return;
                }
                else
                {
                    logininfo.LoginUserID = sessionString[0];
                    logininfo.LoginUserName = sessionString [1] + sessionString [2];
                    //logininfo.OpeLevel = CType(DataReader_auth("Level").ToString, Define.OpeLevel)
                    Session[Common.STR_LOGIN] = logininfo;
                }
                Response.Redirect("Roster.aspx",false );
            }
            catch(Exception ex)
            {
                this.ltrErr.Text = "エラーです";
            }
            finally
            {
                if (dataReader != null)
                {
                    dataReader.Dispose();
                }
                
            }

            
            
           
        }
    }
}