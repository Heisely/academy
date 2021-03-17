package springweb.a01_start;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import springweb.z03_vo.Product;

@Controller
public class A06_FormExp {
/*
# 구매물품
물건 종류 [전자제품 / 식품류 / 잡화]
가격: [1000~10000] 천단위로 10000까지
개수: [1~10]

form:form modelAttribute를 이용해서 GET/POST 방식으로 호출
WEB-INF\views\a01_start\a14_formExp.jsp
 */
	@ModelAttribute("buyList")
	public ArrayList<String> buyList(){
		ArrayList<String> blist = new ArrayList<String>();
		blist.add("전자제품");
		blist.add("식품");
		blist.add("잡화");
		return blist;
	}
	
	/*
	# 주의
	1. 공통된 모델 어트리뷰트와 요청값 또는 모델에 의해 처리하는 데이터 차이
		물건종류 [전자제품/식품/잡화] ==> 공통모델어트리뷰트에서 선언
				[submit] 클릭해서 선택한 내용을 요청값으로 처리하는 부분
						>> public String postBuy(@ModelAttribute("prod") Product sch)
							Product의 setKind() 선택한 물건 종류 할당
	 */
	
	// http://localhost:7080/springweb/buy.do
	@GetMapping("buy.do")
	public String buy(Model d) {
		d.addAttribute("prod", new Product());
		return "WEB-INF\\views\\a01_start\\a14_formExp.jsp";
	}
	
	@PostMapping("buy.do")
	public String buyPost(@ModelAttribute("prod") Product prod) {
		return "WEB-INF\\views\\a01_start\\a14_formExp.jsp";
	}
}
