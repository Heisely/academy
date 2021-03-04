package jspexp.a04_mvc;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jspexp.a03_database.A03_ShopDao;
import jspexp.z01_vo.Product2;

/**
 * Servlet implementation class A06_prodDetailController
 */
@WebServlet(name = "prodDetail.do", urlPatterns = { "/prodDetail.do" })
public class A06_prodDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A06_prodDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    // 추가!! if(pnoS==null) pnoS="0"; 처리 대신 try-catch문으로 처리
    private int pInt(String s) {
    	int ret = 0;
    	try {
			ret = Integer.parseInt(s);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
    	return ret;
    }
    private String pStr(String s) {
    	String ret = "";
    	if(s!=null) ret = s;
    	return ret;
    }
	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 요청값
		request.setCharacterEncoding("utf-8");
		String proc = request.getParameter("proc");
		
		String pnoS = request.getParameter("pno");		
		int pno = pInt(pnoS); // null이나 문자열 형태도 0으로 리턴된다.
		
		// 2. 모델데이터
		A03_ShopDao dao = new A03_ShopDao();
		if(proc!=null) {
			if(proc.equals("ins")) {
				dao.insertProduct(
						new Product2(pno, 
									 pStr(request.getParameter("name")),
									 pInt(request.getParameter("price")),
									 pInt(request.getParameter("cnt")),
									 pStr(request.getParameter("credte")),
									 pStr(request.getParameter("company")),
									 pStr(request.getParameter("incomedte")),
									 pStr(request.getParameter("inmanager"))
									)
				);
				pno = dao.getMaxPno();
			}
			if(proc.equals("upt")) {
				System.out.println("수정 처리");
				dao.updateProduct(
					new Product2(pno, 
								 pStr(request.getParameter("name")),
								 pInt(request.getParameter("price")),
								 pInt(request.getParameter("cnt")),
								 pStr(request.getParameter("credte")),
								 pStr(request.getParameter("company")),
								 pStr(request.getParameter("incomedte")),
								 pStr(request.getParameter("inmanager"))
								)
				);				
			}
			if(proc.equals("del")) {
				System.out.println("삭제 처리");
				dao.delProduct(pno);
			}
		}
		request.setAttribute("prod", dao.getProd(pno));
		
		// 3. view
		String page = "a00_exp\\a25_0303\\a37_proDetail.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
	
	}
}
