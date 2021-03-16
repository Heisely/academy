package springweb.a01_start;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import springweb.z02_vo.Code;
import springweb.z02_vo.Emp;
import springweb.z02_vo.Product;
import springweb.z03_vo.SearchType;
import springweb.z03_vo.SearchVo;

@Controller
public class A04_ModelAttrController {
	// 공통모델 선언(단위 컨트롤러)
	@ModelAttribute("prodInfo")
	public Product getProduct() {
		return new Product("사과", 3000, 2);
	}
/*
# ModelAttribute 활용
1. EmpController
	1) 조회
	2) 상세
	3) 수정/삭제
	4) 등록
2. 공통 모델
	key/value형식으로 코드와 실제화면에서 보일 데이터가 다를 때 설정하는 경우가 많다.
	1) 부서번호와 부서명으로 key/value 설정된 것 select
		DAO ==> ArrayList<Dept>
		<select>
			<option value="10">인사</option>
			<option value="20">재무</option>
			<option value="30">회계</option>
		</select>
	2) 관리자 정보
		
 */
	// http://localhost:7080/springweb/modelAttr01.do
	@RequestMapping("/modelAttr01.do")
	public String form(@ModelAttribute("emp") Emp sch) {
		// # 요청값과 모델데이터를 동시에 처리
		// 1. 요청값에 의해 받은 데이터를 DB처리/비지니스 로직을 하여,
		// 다시 변경된 데이터를 가지고 모델값으로 화면에서 활용할 때 주로 이용
		// 2. <spring:message> 스프링에서 지원하는 화면단 처리 태그라이브러리와
		// modelattribute를 사용하면 효과적으로 처리할 수 있다.
		System.out.println("사원명: " + sch.getEname());
		System.out.println("직책명: " + sch.getJob());
		return "WEB-INF\\views\\a01_start\\a10_modelAttrExp.jsp";
	}

	/* # 공통 모델 attribute 설정 */
	@ModelAttribute("searchTypeList")
	public List<SearchType> search() {
		List<SearchType> list = new ArrayList<SearchType>();
		list.add(new SearchType(1, "제목"));
		list.add(new SearchType(2, "작성자"));
		list.add(new SearchType(3, "내용"));

		return list;
	}

	@ModelAttribute("prodTypes")
	public List<Code> prodTypes() {
		List<Code> list = new ArrayList<Code>();
		list.add(new Code("10", "전자제품"));
		list.add(new Code("20", "식품"));
		list.add(new Code("30", "잡화"));

		return list;
	}
	
	/* 0316 수업 */
	// http://localhost:7080/springweb/search01.do
	@RequestMapping("/search01.do")
	public String search1() {
		return "WEB-INF\\views\\a01_start\\a11_searchForm.jsp";
	}

	@RequestMapping("/search02.do")
	public String search2(SearchVo vo, Model d) {
		System.out.println("# 검색된 내용: " + vo.getType());
		System.out.println("# 검색된 내용: " + vo.getQuery());
		d.addAttribute("search", vo);
		return "WEB-INF\\views\\a01_start\\a11_searchForm.jsp";
	}
	
	// http://localhost:7080/springweb/search03.do
	@RequestMapping("/search03.do")
	public String search3(@ModelAttribute("search") SearchVo vo) {
		return "WEB-INF\\views\\a01_start\\a12_searchForm.jsp";
	}
}
