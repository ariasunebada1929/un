using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication2.DBAccess
{
    public class Define
    {
        //認証レベル
        enum OpeLevel
        {
            PawarUser = 1,
            Negotiation = 2,
            Personal = 3,
            Administrator = 9
        };

        //システムメッセージ
        enum Message
        {
            SystemErr,
            Login_InputErr,
            Notfound
        };
    }
}