package springweb.a01_start;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import springweb.z02_vo.Emp;
import springweb.z02_vo.Product;

@Controller
public class A04_ModelAttrController {
	// 공통모델 선언(단위 컨트롤러)
	@ModelAttribute("prodInfo")
	public Product getProduct() {
		return new Product("사과",3000,2);
	}
	// http://localhost:7080/springweb/modelAttr01.do
	@RequestMapping("/modelAttr01.do")
	public String form(@ModelAttribute("emp") Emp sch) {
		// 요청값과 모델데이터를 동시에 처리
		System.out.println("사원명: "+sch.getEname());
		System.out.println("직책명: "+sch.getJob());
		return "WEB-INF\\views\\a01_start\\a10_modelAttrExp.jsp";
	}
}
