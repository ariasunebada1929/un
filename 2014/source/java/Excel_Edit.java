package info.un_test;

import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Calendar;
import java.util.Properties;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.WorkbookFactory;

public class Excel_Edit {

	public void Excel_Edit() throws InvalidFormatException, IOException, SQLException, ClassNotFoundException {
		
		//�������̓����擾����
		Calendar cal = Calendar.getInstance();
		int year  = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		//�����擾
		cal.set(Calendar.YEAR, year);
		cal.set(Calendar.MONTH, month );                
		int lastDayOfMonth = cal.getActualMaximum(Calendar.DATE);
		
		//DB�ڑ�����ݒ肷��
		String path = "jdbc:mysql://localhost/unserver2014?useUnicode=true&characterEncoding=SJIS";  //�ڑ��p�X

	    Properties props = new Properties(); 
	    props.put("user",       "root");                 // �C�� 
	    props.put("password",   "");                     // �C�� 
	    props.put("useUnicode", "true");                 // ���ꂪ�K�v 
	    props.put("characterEncoding", "SJIS");          // ���ꂪ�K�v 
		
		//DB�ڑ��p�ϐ���`
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
	    
		//JDBC�h���C�o�����[�h����
		Class.forName("com.mysql.jdbc.Driver");
		System.out.println("�ڑ�����");
		//DB�ւ̃R�l�N�V�������쐬����
		conn = DriverManager.getConnection(path, props);
		
	    /*�ΑӃg�����̃f�[�^�Ăяo��*/
        Statement stmt = null;
		stmt = conn.createStatement();
        String strPerSQL = "";
		strPerSQL = "SELECT YEAR year, MONTH month, DAY day, SUBMIT_REQUEST_1_CD req_1, " + 
                    "       SUBMIT_REQUEST_2_CD req_2, SUBMIT_REQUEST_3_CD req_3, " +
                    "       SUBMIT_REQUEST_4_CD req_4, DETAIL detail, " +
                    "       BASIC_WORK_START work_start, BASIC_WORK_END work_end, " +
                    "       ACTUAL_WORK_START act_start, ACTUAL_WORK_END act_end, " +
                    "       RESTHOURS rest_hours, ZANGYO_ADJUST zan_adj, " +
    	            "       DETAIL detail " +
                    "       FROM unserver2014.WORK_TRN WHERE STAFF_ID = " + "00002" + " AND " +   
                    "       YEAR = " + year + " AND MONTH = " + month ;

		ResultSet Ors = stmt.executeQuery(strPerSQL);
		
		// TODO �����������ꂽ���\�b�h�E�X�^�u
	    //Workbook wb = new HSSFWorkbook();
	    //Sheet sheet = wb.createSheet();
	    // FileOutputStream out = null;
	    
	    InputStream in = new FileInputStream("C:\\work\\sample.xlsx");
	    Workbook wb = WorkbookFactory.create(in);
	    Sheet sheet = wb.getSheetAt(0);
	    
 	    for(int i=7; i <= lastDayOfMonth + 5; i++){
			
 	    	Ors.next();
		    Row row_day = sheet.getRow(i);
		    Cell cell_Kyuka = row_day.getCell(2);
		    Cell cell_KyusyutuFuridai = row_day.getCell(1);
		    Cell cell_Shift = row_day.getCell(2);
		    Cell cell_Hendou = row_day.getCell(3);
		    Cell cell_furikaebi = row_day.getCell(4);
		    Cell cell_syousai = row_day.getCell(5);
		    Cell cell_kihonS = row_day.getCell(6);
		    Cell cell_kihonE = row_day.getCell(7);
		    Cell cell_jissekiS = row_day.getCell(8);
		    Cell cell_jiseekiE = row_day.getCell(9);
		    Cell cell_jissekiR = row_day.getCell(10);
		    Cell cell_zangyou = row_day.getCell(11);
		    
		    if (Ors.getString("req_1") == "00"){
		    	cell_Kyuka.setCellValue(2);
		    }
		    	    
		    cell_KyusyutuFuridai.setCellValue(1);
		    cell_Shift.setCellValue(2);
		    cell_Hendou.setCellValue(3);
		    cell_furikaebi.setCellValue(4);
		    cell_syousai.setCellValue(5);
		    cell_kihonS.setCellValue(6);
		    cell_kihonE.setCellValue(7);
		    cell_jissekiS.setCellValue(8);
		    cell_jiseekiE.setCellValue(9);
		    cell_jissekiR.setCellValue(10);
		    cell_zangyou.setCellValue(11);
		}
	
 	   FileOutputStream out = null;
 	    
	   out = new FileOutputStream("C:\\work\\sample1234.xlsx");
	   wb.write(out);

	}
	
}
