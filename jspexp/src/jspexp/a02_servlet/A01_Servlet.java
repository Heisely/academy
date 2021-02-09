package jspexp.a02_servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class A01_Servlet
 */
@WebServlet(name = "exam01.do", urlPatterns = { "/exam01.do" })
public class A01_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A01_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// jsp 코드 ==> servlet 클래스로 만들어서..
		// response객체의 출력내용을 전송할 print()안에 html태그와 js, css 등이 들어간다.
		response.getWriter().print("html코드");
		// jsp에서는 request, response객체가 Servlet에서 선언되어 참조변수를 default로 받는 상황이므로 그대로 사용할 수 있다.
		PrintWriter out = response.getWriter();
		// jsp의 모든 tag들은 out.print()로 포함되어 처리된다.
		out.print("<h2>안녕하세요</h2>");
		// out으로 response.getWriter()를 선언해서, out을 출력용으로 바로 사용할 수 있다.
		HttpSession session = request.getSession();
		// session도 request.getSession()으로 선언했으므로 바로 사용할 수 있다.
		// >> request, response, out, session를 jsp에서 바로 사용할 수 있는 이유. 
	}

}
