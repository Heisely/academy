package jspexp.a00_exp;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jspexp.a03_database.A03_ShopDao;
import jspexp.z01_vo.Product2;

/**
 * Servlet implementation class A01_0302_Servlet
 */
@WebServlet(name = "shop.do", urlPatterns = { "/shop.do" })
public class A01_0302_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public A01_0302_Servlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 0. encoding
		request.setCharacterEncoding("utf-8");
		// 1. 요청값
		String name = request.getParameter("name");

		// 2. 모델
		if (name == null) name = "";
		
		A03_ShopDao dao = new A03_ShopDao();
		request.setAttribute("plist", dao.shopList2(new Product2(name)));

		// 3. view
		String page = "a00_exp\\a24_0302\\a01_JSPExp.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
	}

}
