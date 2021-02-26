package jspexp.a00_exp;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jspexp.z01_vo.Member;

/**
 * Servlet implementation class A01_0226_Servlet
 */
@WebServlet(name = "mvcEx.do", urlPatterns = { "/mvcEx.do" })
public class A01_0226_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A01_0226_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String idS = request.getParameter("id");
		String passS = request.getParameter("pass");
		
		String id = null; if(idS!=null) id = idS;
		String pass = null; if(passS!=null) pass = passS;		
		request.setAttribute("mem", new Member(id,pass));		
		
		String page = "a00_exp\\a23_0226\\a01_0226.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(page);	
		rd.forward(request, response);
		
	}
}
