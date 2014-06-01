import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Detabese_test {
    public static void main(String[] args) throws Exception{

        //変数定義
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        //DB接続情報を設定する
        String path = "jdbc:oracle:thin:@127.0.0.1:1521:UnServer";  //接続パス
        String id = "root";    //ログインID
        String pw = "root";  //ログインパスワード

        //SQL文を定義する
        //サンプル：String sql = "SELECT * FROM user_master WHERE no >= ?";
        String sql = "SELECT * FROM unserver.`parsonal_auth_trn`";

        try{
            //JDBCドライバをロードする
            Class.forName("oracle.jdbc.driver.OracleDriver");

            //DBへのコネクションを作成する
            conn = DriverManager.getConnection(path, id, pw);

            //実行するSQL文とパラメータを指定する
            ps = conn.prepareStatement(sql);
            //サンプル：ps.setString(1, "2");

            //SELECTを実行する
            rs = ps.executeQuery();

            //こんなふうにカラム数なども取得できちゃう
            int colCount = rs.getMetaData().getColumnCount();
            System.out.println("取得したカラム数:" + colCount);

            //取得した結果を全件出力する
            while(rs.next()){
                System.out.print(rs.getString("STAFF_ID"));
                System.out.print("/" + rs.getString("PASSWORD"));
                //System.out.print("/" + rs.getString("ADDRESS"));
                //System.out.print("/" + rs.getString("TEL"));
                System.out.println();
            }

        }catch(Exception ex){
            //例外発生時の処理
            ex.printStackTrace();  //エラー内容をコンソールに出力する

        }finally{
            //クローズ処理
            if(rs != null) rs.close();
            if(ps != null) ps.close();
            if(conn != null) conn.close();
        }
    }
}
