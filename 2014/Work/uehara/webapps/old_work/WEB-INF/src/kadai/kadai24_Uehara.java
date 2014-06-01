package kadai;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class kadai24_Uehara extends HttpServlet {
	public void service(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		res.setContentType("text/html;charset=ISO-2022-JP");
		PrintWriter out = res.getWriter();
		out.println("<html><head></head><body><center>");
		out.println("service");
		out.println("</center></body></html>");
		out.close();
	}
}//http://localhost:8080/tomcat_test/kadai24.html
