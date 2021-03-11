<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<fmt:requestEncoding value="UTF-8" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script type="text/javascript">
<%--
[스프링]
[하] 1. 소스에 @Autowired 설정처리시, 사용되는 객체와 객체간의 연계부분을 기술하세요.
1. 의존관계는 XML을 통해서 설정할 수 있다.
	- 특정한 패키지의 filtering을 통해서 컨테이너 안에 객체를 로딩처리한다.
2. Java class를 통해 의존관계를 바로 설정하여 처리할 수 있다.
	1) @Autowired 선언
	2) private 자동 등록할 객체   참조변수
		- 필드, 메서드, 생성자에 설정하여 할당할 수 있다.
		  주의) 접근제어자에 상관없이 할당 가능
		ex) controller 단에서
			@Autowired
			private BoardService service;
			컨테이너 내용 BoardService가 선언되어 있으면,
			객체가 생성이 되면 Controller에서 해당 autowire가 선언된 객체가 할당 된다.
			service 참조변수에 객체가 자동으로 할당되어 처리된다.
			접근제어자의 범위를 벗어난다.
3. container 환경 구성
	1) 특정 패키지 기준으로 객체가 로딩되게 처리한다.
		[일반적인 조건]
		ex) Controller, Service, Repository는 특정 package와 @annotation으로 메모리에 로딩한다.
	2) 컨테이너 @@.xml의 상단에
		context:annotation-config 태그를 통해 객체 내에서 autowire를 선언할 수 있게끔 한다.

[하] 2. 특정패키지에 Emp(이름), Manager(이름), Ceo(이름) 클래스를 Company클래스(회사명,Emp, Manager, Ceo)로
        설정하여, 소스상 Autowired로 설정하여 호출처리하게 하세요.
		[Emp.java], [Manager.java-생략], [Ceo.java-생략]
		package springdi.z00_exp.z01_vo;
		
		public class Emp {
			private String name;
		
			public Emp() {
				super();
				name = "홍길동(기본 사원)";
				// TODO Auto-generated constructor stub
			}
		
			public Emp(String name) {
				super();
				this.name = name;
			}
		
			public void info() {
				System.out.println("이름(직원): "+name);
			}
		
		}		
		
		[Company.java]
		package springdi.z00_exp.z01_vo;
		
		import org.springframework.beans.factory.annotation.Autowired;
		
		public class Company {
			private String company;
			@Autowired(required = false)
			private Emp emp;
			@Autowired(required = false)
			private Manager manager;
			@Autowired(required = false)
			private Ceo ceo;
		
			public Company() {
				super();
				company = "IT기업(기본회사)";
				// TODO Auto-generated constructor stub
			}
		
			public Company(String company) {
				super();
				this.company = company;
			}
		
			public void info() {
				System.out.println(company + "의 정보");		
				if(ceo!=null) ceo.info();
				if(manager!=null) manager.info();
				if(emp!=null) emp.info();
			}
		
			public String getName() {
				return company;
			}
		
			public void setName(String name) {
				this.company = name;
			}
		
			public Emp getEmp() {
				return emp;
			}
		
			public void setEmp(Emp emp) {
				this.emp = emp;
			}
		
			public Manager getManager() {
				return manager;
			}
		
			public void setManager(Manager manager) {
				this.manager = manager;
			}
		
			public Ceo getCeo() {
				return ceo;
			}
		
			public void setCeo(Ceo ceo) {
				this.ceo = ceo;
			}
		
		}
		
		[container3.xml]
		<context:annotation-config/>
		<context:component-scan base-package="springdi.z00_exp.z01_vo">
			<context:include-filter type="regex" expression=".*"/>
		</context:component-scan>
		
		[A01_DI_Start3.java]
		package springdi.z00_exp;
		
		import org.springframework.context.support.AbstractApplicationContext;
		import org.springframework.context.support.GenericXmlApplicationContext;
		
		import jspexp.z01_vo.Person;
		import springdi.z00_exp.z01_vo.Company;
		
		public class A01_DI_Start3 {
			public static void main(String[] args) {
				AbstractApplicationContext ctx = new GenericXmlApplicationContext("springdi\\z00_exp\\container3.xml");
				Company company = ctx.getBean("company", Company.class);
				company.info();
			}
		}		

[하] 3. ModelAttribute란 무엇인가? 개념을 기술하고, 기본 예제를 만들어 보세요. 
		1. controller단의 공통 모델데이터에 대한 선언을 하는 것을 말한다.
		2. 요청값+모델데이터를 동시에 처리해줌.
		
		ex)
		@ModelAttribute("memberInfo")
		public Member getMember(){
			return new Member("홍길동",26,"경기수원");
		}
		
		@RequestMapping("/modelAttrExp.do")
		public String form(@ModelAttribute("emp") Emp sch){
			System.out.println("사원명: "+sch.getEname());
			System.out.println("직책명: "+sch.getJob());
			return "WEB-INF\\views\\z01_exp.a05_0310.jsp";
		}
--%>
<%--  
[jquery]
[하] 1. filter기능 메서드를 이용해서, 5X5테이블에서 각 td의 3개단위로 배경색상이 다르게 출력, tr의 짝홀번째 글자가 다르게
    출력처리하세요. end()메서드 활용.
--%>
//
	$(document).ready(function(){
		$("td").each(function(idx){
			$(this).text(idx+1);
		});
		$("tr").filter(function(idx,ele){
			return idx%2==0;
		}).css("font-size","30px").end().filter(function(idx,ele){
			return idx%2==1;
		}).css("font-size","20px");
		$("td").filter(function(idx,ele){
			return idx%3==0;
		}).css("background-color","red").end().filter(function(idx,ele){
			return idx%3==1;
		}).css("background-color","yellow").end().filter(function(idx,ele){
			return idx%3==2;
		}).css("background-color","skyblue");
	});
</script>
</head>
<body>
	<table>
		<tr><td></td><td></td><td></td><td></td><td></td></tr>
		<tr><td></td><td></td><td></td><td></td><td></td></tr>
		<tr><td></td><td></td><td></td><td></td><td></td></tr>
		<tr><td></td><td></td><td></td><td></td><td></td></tr>
		<tr><td></td><td></td><td></td><td></td><td></td></tr>
	</table>
</body>
</html>