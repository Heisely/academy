package jspexp.a04_mvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jspexp.a03_database.A01_Dao;
import jspexp.z01_vo.Emp;

/**
 * Servlet implementation class A04_EmpInsController
 */
@WebServlet(name = "empInsert.do", urlPatterns = { "/empInsert.do" })
public class A04_EmpInsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A04_EmpInsController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	# controller 처리
	1. 초기화면 호출
	2. 등록
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 1. 요청값
		request.setCharacterEncoding("utf-8");
		String ename = request.getParameter("ename");
		if(ename==null) ename="";
		String job = request.getParameter("job"); 
		if(job==null) job="";
		String mgr = request.getParameter("mgr"); 
		if(mgr==null||mgr.trim().equals("")) mgr="0";
		String hiredate_s = request.getParameter("hiredate_s"); 
		if(hiredate_s==null) hiredate_s="";
		String sal = request.getParameter("sal"); 
		if(sal==null||sal.trim().equals("")) sal="0";
		String comm = request.getParameter("comm"); 
		if(comm==null||comm.trim().equals("")) comm="0";	
		String deptno = request.getParameter("deptno"); 
		if(deptno==null||deptno.trim().equals("")) deptno="0";
		
		// 입력할 객체 완성.
		if(!ename.equals("")){ // 초기 화면과 구분하기 위해서
			Emp ins = new Emp(0, ename, job, new Integer(mgr), hiredate_s, 
					new Double(sal), new Double(comm), new Integer(deptno));
			A01_Dao dao = new A01_Dao();
			dao.insertEmp(ins);
		}
		// 2. 모델
		
		// 3. view 호출
		String page = "a11_mvc\\a03_empInsert.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
	}

}
