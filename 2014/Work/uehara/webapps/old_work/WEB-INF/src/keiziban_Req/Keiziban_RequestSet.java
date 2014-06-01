package keiziban_Req;

import java.io.IOException;

import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import keiziban_Cus.Keiziban_Customer;

public class Keiziban_RequestSet extends HttpServlet {

	HttpSession session;
	Keiziban_Customer cust = new Keiziban_Customer();
	boolean error;
	int No;
	String day;

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		common(req, res);
	}

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		common(req, res);
	}

	public void common(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		// 文字化け修正
		req.setCharacterEncoding("Shift_JIS");
		res.setContentType("text/html; charset=Shift_JIS");

		// セッション保持
		if (session == null) {
			session = req.getSession(true);

			// 各ArrayList作成
			cust.namelist = new ArrayList<String>();
			cust.kenmeilist = new ArrayList<String>();
			cust.komentlist = new ArrayList<String>();
			cust.numlist = new ArrayList<String>();
			cust.daylist = new ArrayList<String>();
			No = 0;

		} else {
			session = req.getSession(true);
		}

		// リクエストゲット
		String Name = req.getParameter("NAME");
		String Kenmei = req.getParameter("KENMEI");
		String Koment = req.getParameter("KOMENT");

		// 認証処理
		String page = null;
		if (!"".equals(Kenmei) && !"".equals(Koment)) {

			if ("".equals(Name)) {
				Name = "名無しさん";
				System.out.println(Name + "Name");
			}

			// データクラスにデータ移す
			ServletContext sc = getServletConfig().getServletContext();
			Data appData = (Data) sc.getAttribute("appData");
			if (appData == null) {
				appData = new Data();
			}

			No++;// ナンバーカウント
			cust.setName(Name);
			cust.setkenmei(Kenmei);
			cust.setkoment(Koment);
			cust.setNum(No);
			cust.setDay();

			sc.setAttribute("appData", appData);

			appData.nameData = cust.namelist;
			appData.kenmeiData = cust.kenmeilist;
			appData.komentData = cust.komentlist;
			appData.numData = cust.numlist;
			appData.dayData = cust.daylist;
			appData.Error = false;

			page = "/keiziban.jsp";
		} else {
			error = true;
			ServletContext sc = getServletConfig().getServletContext();
			Data appData = (Data) sc.getAttribute("appData");
			if (appData == null) {
				appData = new Data();
			}
			sc.setAttribute("appData", appData);
			appData.Error = error;

			page = "/keiziban.jsp";// 仮エラーページ
		}

		try {
			getServletContext().getRequestDispatcher(page).forward(req, res);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

}
// http://localhost:8080/tomcat_test/keiziban.jsp
