package springweb.z01_exp;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import springdi.z02_vo.Product;

@Controller
public class A01_ExpController {
	// http://localhost:7080/springweb/start3.do
	@RequestMapping("/start3.do")
	public String start3() {
		return "WEB-INF\\views\\z01_exp\\a03_exp.jsp";
	}
/*
210311 Spring 과제
[하] 1. controller와 view를 만들고, controller에 공통 model데이터 ArrayList형태로
        사과 2000
        바나나 3000
        딸기  12000 으로 설정한 뒷, 화면에 select로 출력하게 하세요.
 */
	@ModelAttribute("fruits")
	public ArrayList<Product> flist(){
		ArrayList<Product> plist = new ArrayList<Product>();
		plist.add(new Product("사과",2000,0));
		plist.add(new Product("바나나",3000,0));
		plist.add(new Product("딸기",12000,0));
		return plist;
	}
}
