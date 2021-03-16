package springweb.a01_start;

import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import springweb.z02_vo.Code;
import springweb.z02_vo.MemberReg;

@Controller
@RequestMapping("memberReg.do") // 공통 요청값 처리
public class A05_ValidatorController {
	// 공통 attribute 선언
	@ModelAttribute("jobCodes")
	public List<Code> jobCodes() {
		return Arrays.asList(new Code("1", "운동선수"), new Code("2", "프로그래머"), new Code("3", "예술가"), new Code("4", "작가"));
	}

	@ModelAttribute("favoriteOsNames")
	public List<String> favoriteOs() {
		return Arrays.asList("윈도우10", "윈도우7", "맥OS", "우분투");
	}

	@ModelAttribute("tools")
	public List<String> tools() {
		return Arrays.asList("이클립스", "인텔리J", "넷빈즈", "Vim");
	}

	// http://localhost:7080/springweb/memberReg.do
	@RequestMapping(method = RequestMethod.GET)
	public String form(@ModelAttribute("memInfo") MemberReg mem) {
		return "WEB-INF\\views\\a01_start\\a13_registerForm.jsp";
	}
	@RequestMapping(method = RequestMethod.POST)
	public String form1(@ModelAttribute("memInfo") MemberReg mem) {
		return "WEB-INF\\views\\a01_start\\a13_registerForm.jsp";
	}
}
