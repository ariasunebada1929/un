using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Resources;

namespace WebApplication2.DBAccess
{
    public class Common
    {
        public const String STR_LOGIN = "Session.LOGIN";

        //ログインセッション情報
        public struct Logininfo{
             public String LoginUserID;
             public String LoginUserName;
             //public Define level = Define.OpeLevel;

        }


        //public String GetMessage(Define.Message dMsg)
        //{
        //    return Convert.ToString(this.ResourceManager.GetObject(dMsg.ToString));
        //}
        
    }
}