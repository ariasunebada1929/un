package info.un_test;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class form_roster extends HttpServlet {

/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

/**
	 * 
	 */

public void doGet(HttpServletRequest request, HttpServletResponse response)
throws IOException, ServletException
{
	String strUserid = "1234";	
	int iRecordCount = 0;	
	//HttpSession�C���^�t�F�[�X�̃I�u�W�F�N�g���擾
    HttpSession session = request.getSession();
    //id��session�X�R�[�v�ŕۑ�
    session.setAttribute("userid", strUserid);
	
	/*�������̓����擾����*/
    Calendar cal = Calendar.getInstance();        
    SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");        
    //*String strYearDate = sdf.format(cal.getTime());
    //*String strMonthDate = sdf.format(cal.getTime());
    String strDayDate = sdf.format(cal.getTime());
    
    
    /* �ΑӃf�[�^�̎擾 */
    //Select * FROM WORK_TRN�@WHERE STAFF_ID = userid And YEAR = strDate And MONTH = strDate And DAY = strDate
    
	/*�ΑӃf�[�^�̓Ǎ���*/
	
    
	/*�ΑӃt�H�[���̘g��ǉ�*/
    for (int i = 0; i <= iRecordCount; i++) {

	}
	
	/*�C�x���g�̍쐬*/
	
	/*�o�^�C�x���g�̍쐬*/
	/*���������*/
    
	/*Excel�o�͂̍쐬*/
	
	/*�Αӓ��̓t�H�[���̃��[�h����*/
	response.setContentType("text/html; charset=utf-8");
    this.getServletContext().getRequestDispatcher
                 ("/form_roster.jsp").include(request, response);
    
}

public void doPost(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException 
{
	response.setContentType("text/html");
	PrintWriter out = response.getWriter();
	out.println("<html>");
	out.println("<head>");
	out.println("<title>Hello World!</title>");
	out.println("</head>");
	out.println("<body>");
	out.println("<h1>Hello World!</h1>");
	out.println("</body>");
	out.println("</html>");
}

public void Click(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException 
{
	//��ʂ̓��͍��ڎ���Ă��ēo�^�p�̃f�[�^�ɂ���B
	
	//DB��ID�ƃp�X���[�h�Ăяo��
	
	//�o�^�p�̃f�[�^��SQL�ɓ��ꍞ�ޏ������쐬����o�^����
	PrintWriter out = response.getWriter();
	out.println("<html>");
	out.println("<head>");
	out.println("<title>Hello World!</title>");
	out.println("</head>");
	out.println("<body>");
	out.println("<h1>Hello World!</h1>");
	out.println("</body>");
	out.println("</html>");
	
	//
	
}

}