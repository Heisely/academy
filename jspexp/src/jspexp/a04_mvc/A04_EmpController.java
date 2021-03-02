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
 * Servlet implementation class A04_EmpController
 */
@WebServlet(name = "emp.do", urlPatterns = { "/emp.do" })
public class A04_EmpController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A04_EmpController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// # MVC를 통한 EMP 조회 처리
		// 1. 요청
		//	1) 한글에 대한 encoding - 하지 않으면 글자가 깨짐
		request.setCharacterEncoding("utf-8");
		String ename = request.getParameter("ename");
		String job = request.getParameter("job");
		System.out.println("## 이름: "+ename);
		System.out.println("## 직책: "+job);
		
		// 2. 모델
		if(ename==null) ename="";
		if(job==null) job="";
		// DB접속 메서드를 통해 모델 데이터 처리
		A01_Dao dao = new A01_Dao();
		request.setAttribute("empList", dao.empList2(ename, job));
		
		// 3. View 처리
		String page = "a11_mvc\\a03_empList.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
	}

}
