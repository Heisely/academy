package springweb.a01_start;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import springweb.z02_vo.Product;
import springweb.z02_vo.Player;

// dispatcher-servlet.xml에서 등록해야 한다.
// springweb.a01_start.A01_StartController
@Controller
public class A01_StartController {
	// http://localhost:7080/springweb: 확인 초기 페이지 로딩
	// http://localhost:7080/springweb/start.do
	@RequestMapping("/start.do")
	public String start() {
		// View 호출
		return "WEB-INF\\views\\a01_start\\a01_springStart.jsp";
	}

	// http://localhost:7080/springweb/start2.do
	@RequestMapping("/start2.do")
	public String start2() {
		return "WEB-INF\\views\\z01_exp\\a01_exp01.jsp";
	}

	// http://localhost:7080/springweb/param1.do?name=홍길동
	@RequestMapping("/param1.do")
	public String param1(@RequestParam("name") String name) {
		System.out.println("요청값 name: " + name);
		return ""; // 초기 index화면 호출
	}

	// ex1) ?name=김철수&age=25&loc=신림동 요청값을 받아서 log로 출력
	// http://localhost:7080/springweb/param2.do?name=김철수&age=25&loc=신림동
	@RequestMapping("/param2.do")
	public String param2(@RequestParam("name") String name, @RequestParam("age") int age,
			@RequestParam("loc") String loc) {
		System.out.println("요청값 name: " + name);
		System.out.println("요청값 age: " + age);
		System.out.println("요청값 loc: " + loc);
		return "";
	}

	// 객체로 요청값 받기. useBean 기억
	// setXXX가 있을 때, 객체로 받을 수 있다.
	// http://localhost:7080/springweb/param3.do?name=사과&price=3000&cnt=2 이런 요청값을
	// 객체로 받아서 처리
	// setName(), setPrice(), setCnt()가 있으면 property 개념으로 요청값을 받을 수 있다.
	@RequestMapping("/param3.do")
	public String param3(Product d) { // 요청값에 맞는 setXXX()가 있으면 할당
		System.out.println("물건명: " + d.getName());
		System.out.println("가격: " + d.getPrice());
		System.out.println("개수: " + d.getCnt());
		return "";
	}

	// http://localhost:7080/springweb/param4.do?tname=LG트윈스&player=홍길동&hitRatio=0.321
	@RequestMapping("/param4.do")
	public String param4(Player t) {
		System.out.println("팀명: " + t.getTname());
		System.out.println("선수: " + t.getPlayer());
		System.out.println("타율: " + t.getHitRatio());
		return "";
	}
	
	// Model 데이터 처리
	// http://localhost:7080/springweb/model01.do
	@RequestMapping("/model01.do")
	public String model(Model d) {
		d.addAttribute("greet","스프링의 모델입니다.");
		return "WEB-INF\\views\\a01_start\\a02_modelShow.jsp";
	}
	
	// ex) http://localhost:7080/springweb/model02.do
	// prod 모델값을 객체로 Product로 생성자 할당해서 a03_modelShow.jsp출력
	@RequestMapping("/model02.do")
	public String model2(Model d) {
		d.addAttribute("prod", new Product("사과",3000,4));
		return "WEB-INF\\views\\a01_start\\a03_modelShow.jsp";
	}
	
	// 요청값과 모델 데이터 처리
	// http://localhost:7080/springweb/calcu.do?num01=25&num02=30
	@RequestMapping("/calcu.do")
	public String calcu(@RequestParam("num01") int num01,
						@RequestParam("num02") int num02,
						Model d
						) 
	{
		d.addAttribute("tot", num01+num02);
		return "WEB-INF\\views\\a01_start\\a04_calcu.jsp";
	}
	
	// ex) http://localhost:7080/springweb/login.do?id=himan&pass=7777
	// 모델 데이터 요청값이 himan/7777일 때 로그인성공 , 그 위는 로그인 실패 출력
	@RequestMapping("/login.do")
	public String login(@RequestParam("id") String id,
						@RequestParam("pass") String pass,
						Model d)
	{
		/*
		d.addAttribute("id", id);
		d.addAttribute("pass", pass);
		*/
		String result = "로그인 실패";
		if(id.equals("himan")&&pass.equals("7777")) {
			result = "로그인 성공";
		}
		d.addAttribute("result",result);
		// view에서 ${result}
		return "WEB-INF\\views\\a01_start\\a05_loginResult.jsp";
	}
	
	// 위의 요청값을 던지는 화면 처리
	// http://localhost:7080/springweb/loginFrm.do
	@RequestMapping("/loginFrm.do")
	public String loginFrm() {
		return "WEB-INF\\views\\a01_start\\a06_loginForm.jsp";
	}
	
	// ex) http://localhost:7080/springweb/calcuFrm.do
	// 로 숫자1, 숫자2를 입력하여 위에 선언한 calcu.do를 호출하여 결과값을 처리하게 하세요.
	@RequestMapping("/calcuFrm.do")
	public String calcuFrm() {
		return "WEB-INF\\views\\a01_start\\a07_calcuForm.jsp";
	}
}
