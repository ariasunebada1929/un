package test_input;

import java.io.IOException;
import java.io.PrintWriter;
import java.rmi.ServerException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Form_input extends HttpServlet{
	
	//POST�v��
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServerException, IOException{
		
		//�p�����[�^���o��
		String hurikae   = req.getParameter("HURIKAE");
		String syousai   = req.getParameter("SYOUSAI");
		String bacic_sta = req.getParameter("BACIC_STA");
		String bacic_end = req.getParameter("BACIC_END");
		String work_sta  = req.getParameter("WORK_STA");
		String work_end  = req.getParameter("WORK_END");
		String break_t   = req.getParameter("BREAK");
		
		//�R���e���c�^�C�v�̎w��
		//req.setContentType("text/html; charset=Shift_JIS");
		req.setCharacterEncoding("Shift_JIS");
		
		//�X�g���[���̎擾
		PrintWriter pw = res.getWriter();
		
		//DB�ڑ�
		
		//�e�X�g�o��
		System.out.print(hurikae);
		System.out.print("/" + syousai);
		System.out.print("/" + bacic_sta);
		System.out.print("/" + bacic_end);
		System.out.print("/" + work_sta);
		System.out.print("/" + work_end);
		System.out.print("/" + break_t);
		
	}
}//http://localhost:8080/tomcat_test/form_roster2.html
