import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Detabese_test {
    public static void main(String[] args) throws Exception{

        //�ϐ���`
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        //DB�ڑ�����ݒ肷��
        String path = "jdbc:oracle:thin:@127.0.0.1:1521:UnServer";  //�ڑ��p�X
        String id = "root";    //���O�C��ID
        String pw = "root";  //���O�C���p�X���[�h

        //SQL�����`����
        //�T���v���FString sql = "SELECT * FROM user_master WHERE no >= ?";
        String sql = "SELECT * FROM unserver.`parsonal_auth_trn`";

        try{
            //JDBC�h���C�o�����[�h����
            Class.forName("oracle.jdbc.driver.OracleDriver");

            //DB�ւ̃R�l�N�V�������쐬����
            conn = DriverManager.getConnection(path, id, pw);

            //���s����SQL���ƃp�����[�^���w�肷��
            ps = conn.prepareStatement(sql);
            //�T���v���Fps.setString(1, "2");

            //SELECT�����s����
            rs = ps.executeQuery();

            //����Ȃӂ��ɃJ�������Ȃǂ��擾�ł����Ⴄ
            int colCount = rs.getMetaData().getColumnCount();
            System.out.println("�擾�����J������:" + colCount);

            //�擾�������ʂ�S���o�͂���
            while(rs.next()){
                System.out.print(rs.getString("STAFF_ID"));
                System.out.print("/" + rs.getString("PASSWORD"));
                //System.out.print("/" + rs.getString("ADDRESS"));
                //System.out.print("/" + rs.getString("TEL"));
                System.out.println();
            }

        }catch(Exception ex){
            //��O�������̏���
            ex.printStackTrace();  //�G���[���e���R���\�[���ɏo�͂���

        }finally{
            //�N���[�Y����
            if(rs != null) rs.close();
            if(ps != null) ps.close();
            if(conn != null) conn.close();
        }
    }
}
