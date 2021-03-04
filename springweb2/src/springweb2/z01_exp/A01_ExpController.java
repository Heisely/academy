package springweb2.z01_exp;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class A01_ExpController {
	// http://localhost:7080/springweb2/newSpring.do
	@RequestMapping("/newSpring.do")
	public String newSpring() {
		return "WEB-INF\\views\\z01_exp\\a01_0304.jsp";
	}
}
