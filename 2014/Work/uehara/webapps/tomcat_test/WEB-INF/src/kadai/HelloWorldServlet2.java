package kadai;

import java.io.IOException;
import java.io.PrintWriter;
import java.rmi.ServerException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloWorldServlet2 extends HttpServlet {

	//POST�ｽv�ｽ�ｽ
	public void doGet(HttpServletRequest req, HttpServletResponse res)
	//public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServerException, IOException{

		//�ｽR�ｽ�ｽ�ｽe�ｽ�ｽ�ｽc�ｽ^�ｽC�ｽv�ｽﾌ指�ｽ�ｽ
		res.setContentType("text/html; charset=Shift_JIS");
		
		//�ｽX�ｽg�ｽ�ｽ�ｽ[�ｽ�ｽ�ｽﾌ取得
		PrintWriter pw = res.getWriter();
		
		//�ｽR�ｽ�ｽ�ｽe�ｽ�ｽ�ｽc�ｽ^�ｽC�ｽv�ｽﾌ指�ｽ�ｽ
		res.setCharacterEncoding("Shift_JIS");

		String name = "";
		String message = null;
		
		//�ｽp�ｽ�ｽ�ｽ�ｽ�ｽ[�ｽ^�ｽ�ｽ�ｽo�ｽ�ｽ
		//String name = req.getParameter("NAME");
		name = req.getParameter("NAME");
//		if ("sousin1".equals(req.getParameter("action"))){
//			�ｽ�ｽ�ｽO�ｽ�ｽﾍの確�ｽF
//			message = "�ｽ�ｽ�ｽ�ｽﾉゑｿｽ�ｽﾍ、" + name + "�ｽ�ｽ�ｽ�ｽ �ｽB�ｽ@<br>�ｽ@�ｽ�ｽ�ｽ�ｽ�ｽ�ｽ�ｽ�ｽ謦｣�ｽ�ｽﾜゑｿｽ�ｽ蛯､";
//		}else if ("sousin2".equals(req.getParameter("action"))){
//			�ｽ�ｽ�ｽO�ｽ�ｽﾍの確�ｽF
//			message = "�ｽ�ｽ�ｽ�ｽﾉゑｿｽ�ｽﾍ、" + name + "�ｽ�ｽ�ｽ�ｽ �ｽB�ｽ@<br>�ｽ@�ｽ�ｽ�ｽ�ｽ�ｽ�ｽ�ｽ�ｽ謦｣�ｽ�ｽﾜゑｿｽ";		
//		}
		
		//�ｽ�ｽ�ｽO�ｽ�ｽﾍの確�ｽF
		if (name == null){
			message = "�ｽp�ｽ�ｽ�ｽ�ｽ�ｽ[�ｽ^�ｽﾌ指�ｽ�ｽﾉ間違い�ｽ�ｽ�ｽ�ｽ�ｽ�ｽﾜゑｿｽ";
		} else if (name.equals("")){
		//	equals�ｽ�ｽequals(str)�ｽ�ｽ�ｽ�ｽ�ｽ�ｽ�ｽX�ｽg�ｽ�ｽ�ｽ�ｽ�ｽO�ｽ^�ｽ�ｽ�ｽ`�ｽF�ｽb�ｽN�ｽ�ｽ�ｽ�ｽ�ｽ�ｽ
			message = "�ｽ�ｽ�ｽO�ｽ�ｽ�ｽﾍゑｿｽ�ｽﾄゑｿｽ�ｽ�ｽ�ｽ�ｽ�ｽ�ｽ";
		} else {
			//message = "�ｽ�ｽ�ｽ�ｽﾉゑｿｽ�ｽﾍ、" + name + "�ｽ�ｽ�ｽ�ｽ �ｽB�ｽ@<br>�ｽ@�ｽ�ｽ�ｽ�ｽ�ｽ�ｽ�ｽ�ｽ謦｣�ｽ�ｽﾜゑｿｽ�ｽ蛯､";
		}
		//縺ゅ≠縺ゅ≠		
		//�ｽo�ｽ�ｽ
		pw.println("<html><head></head><body><center>");
		pw.println(name);
		pw.println("</center></body></html>");
		pw.close();	
	}
}//http://localhost:8080/tomcat_test/InputName.html