package jspexp.a04_mvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jspexp.a03_database.A01_Dao;

/**
 * Servlet implementation class A05_DeptController
 */
@WebServlet(name = "dept.do", urlPatterns = { "/dept.do" })
public class A05_DeptController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A05_DeptController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 요청값
		request.setCharacterEncoding("utf-8");
		String dname = request.getParameter("dname");
		String loc = request.getParameter("loc");
		
		// 2. 모델
		if(dname==null) dname="";
		if(loc==null) loc="";
		A01_Dao dao = new A01_Dao();
		request.setAttribute("deptList", dao.deptList2(dname, loc));
		
		// 3. View
		String page = "a11_mvc\\a04_deptList.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
	}

}
