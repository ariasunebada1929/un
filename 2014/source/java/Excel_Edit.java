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
		
		strPerSQL = "SELECT work_trn.YEAR year, work_trn.MONTH month, work_trn.DAY day, " + 
				    "       req1_mst.SUBMIT_REQUEST_1_NAME req1_nm , " +
				    "       req2_mst.SUBMIT_REQUEST_2_NAME req2_nm , " +
				    "       req3_mst.SUBMIT_REQUEST_3_NAME req3_nm , " +
				    "       req4_mst.SUBMIT_REQUEST_4_NAME req4_nm , " +
				    "       work_trn.COMP_HOLIDAY comp_hol , " +				    
				    "       work_trn.DETAIL detail , " +
				    "       work_trn.BASIC_WORK_START work_start , " +
				    "       work_trn.BASIC_WORK_END work_end , " +
				    "       work_trn.ACTUAL_WORK_START act_start , " +
				    "       work_trn.ACTUAL_WORK_END act_end , " +
				    "       work_trn.RESTHOURS rest_hours , work_trn.ZANGYO_ADJUST zan_adj " +
				    "       FROM unserver2014.WORK_TRN work_trn " +
				    "       LEFT JOIN unserver2014.SUBMIT_REQUEST_1_MST req1_mst ON " +
				    "       work_trn.SUBMIT_REQUEST_1_CD = req1_mst.SUBMIT_REQUEST_1_CD " +
				    "       LEFT JOIN unserver2014.SUBMIT_REQUEST_2_MST req2_mst ON " +
				    "       work_trn.SUBMIT_REQUEST_2_CD = req2_mst.SUBMIT_REQUEST_2_CD " +
				    "       LEFT JOIN unserver2014.SUBMIT_REQUEST_3_MST req3_mst ON " +
				    "       work_trn.SUBMIT_REQUEST_3_CD = req3_mst.SUBMIT_REQUEST_3_CD " +
				    "       LEFT JOIN unserver2014.SUBMIT_REQUEST_4_MST req4_mst ON " +
				    "       work_trn.SUBMIT_REQUEST_4_CD = req4_mst.SUBMIT_REQUEST_4_CD " +
				    "       WHERE unserver2014.WORK_TRN.STAFF_ID = 00002 " +
				    "       AND  unserver2014.WORK_TRN.YEAR = " + year + " AND unserver2014.WORK_TRN.MONTH = " + month ;
		
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
		    Cell cell_KyusyutuFuridai = row_day.getCell(3);
		    Cell cell_Shift = row_day.getCell(4);
		    Cell cell_Hendou = row_day.getCell(5);
		    Cell cell_furikaebi = row_day.getCell(6);
		    Cell cell_syousai = row_day.getCell(7);
		    Cell cell_kihonS = row_day.getCell(13);
		    Cell cell_kihonE = row_day.getCell(14);
		    Cell cell_jissekiS = row_day.getCell(15);
		    Cell cell_jiseekiE = row_day.getCell(16);
		    Cell cell_jissekiR = row_day.getCell(17);
		    Cell cell_zangyou = row_day.getCell(18);
		    
		    cell_Kyuka.setCellValue(Ors.getString("req1_nm"));
		    cell_KyusyutuFuridai.setCellValue(Ors.getString("req2_nm"));
		    cell_Shift.setCellValue(Ors.getString("req3_nm"));
		    cell_Hendou.setCellValue(Ors.getString("req4_nm"));
		    cell_furikaebi.setCellValue(Ors.getString("comp_hol"));
		    cell_syousai.setCellValue(Ors.getString("detail"));
		    cell_kihonS.setCellValue(ConvertTime(Ors.getString("work_start")));
		    cell_kihonE.setCellValue(ConvertTime(Ors.getString("work_end")));
		    cell_jissekiS.setCellValue(ConvertTime(Ors.getString("act_start")));
		    cell_jiseekiE.setCellValue(ConvertTime(Ors.getString("act_end")));
		    cell_jissekiR.setCellValue(ConvertTime(Ors.getString("rest_hours")));
		    cell_zangyou.setCellValue(Ors.getString("zan_adj"));
		}
	
 	   FileOutputStream out = null;
 	    
	   out = new FileOutputStream("C:\\work\\sample_���� �j.xlsx");
	   wb.write(out);

	}

	//�����^�t�H�[�}�b�g�ϊ�
	public static String ConvertTime(String convert_time){
		String str = convert_time;
		String strMinute = "";
		String strhour = "";
		//��l�̏ꍇ�͓�0��t����
		if(!str.equals("")){
			//�ŏI������2������O����ŏI�����܂œǂݍ���
			strMinute = convert_time.substring(convert_time.length()-2,convert_time.length());
			//1�����ڂ���ŏI������2�����O�܂œǂݍ���
			strhour = convert_time.substring(0,convert_time.length()-2);
			str = strhour + ":" + strMinute;
		}else{
			str = "";
		}
		return str;
	}

}
