package kadai;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class kadai25_Uehara extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		res.setContentType("text/html;charset=Shift_JIS");
		PrintWriter out = res.getWriter();
		out.println("<html><head></head><body><center>");
		out.println("");
		out.println("</center></body></html>");
		out.close();

	}
}// http://localhost:8080/tomcat_test/kadai25.html