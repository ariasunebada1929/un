using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using MySql.Data.MySqlClient;
using System.Data;

namespace WebApplication2.DBAccess
{
    public class LoginDBAccess
    {
        private MySqlConnection Connection;
        private MySqlCommand Command;

        //newコンストラクタ
        public LoginDBAccess()
        {
            if (ConfigurationManager.AppSettings["ConnectString"] != null)
            {
                //DB接続情報生成
                String conn = ConfigurationManager.AppSettings["ConnectString"].ToString () ;
                //Connection.ConnectionString = ConfigurationManager.AppSettings["ConnectString"];
                Connection = new MySqlConnection(conn);
                Command = new MySqlCommand();
            }
        }

        //ログインデータの取得
        public String[] getDataReader(string strID,string strPass)
        {
            Connection.Open();
            
            Command = Connection.CreateCommand();

            Command.CommandText = "SELECT PER.STAFF_ID,PER.FIRST_NAME,PER.LAST_NAME " +
                                  "FROM   unserver.personal_mst AS PER " +
                                  "INNER  JOIN unserver.parsonal_auth_trn AS PAS " +
                                  "ON     PER.STAFF_ID = PAS.STAFF_ID " +
                                  "WHERE  PAS.STAFF_ID = '" + strID +
                                  "' AND  PAS.PASSWORD = '" + strPass + "';";

            MySqlDataReader DataReader = Command.ExecuteReader();

            //データ読み込み
            //DataTable dt = new DataTable();
            //dt= DataReader.GetSchemaTable();

            DataReader.Read();
            string[] sessionString = new string[3];

            sessionString[0] = DataReader["STAFF_ID"].ToString ();
            sessionString[1] = DataReader["FIRST_NAME"].ToString();
            sessionString[2] = DataReader["LAST_NAME"].ToString();

            Connection.Close();

            //return DataReader;
            return sessionString;

        }
    }
}