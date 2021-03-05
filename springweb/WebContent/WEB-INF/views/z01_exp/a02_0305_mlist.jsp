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
[spring]
[하] 1. 스프링 MVC로 회원 정보 리스트 출력하세요.
		# dispatcher-servlet.xml
		<bean class="springweb.z01_exp.A02_MemberController"/>
		
		# A02_MemberController.java
		package springweb.z01_exp;

		import org.springframework.stereotype.Controller;
		import org.springframework.ui.Model;
		import org.springframework.web.bind.annotation.RequestMapping;		
		import jspexp.a03_database.A04_MemberDao;
		import jspexp.z01_vo.Member;
		
		@Controller
		public class A02_MemberController {
			// http://localhost:7080/springweb/memberList.do
			@RequestMapping("/memberList.do")
			public String memberList(Member mem, Model d) {
				A04_MemberDao dao = new A04_MemberDao();
				if(mem.getId()==null) mem.setId("");
				if(mem.getName()==null) mem.setName("");
				d.addAttribute("mlist", dao.memberList(mem.getId(),mem.getName()));
				return "WEB-INF\\views\\z01_exp\\a02_0305.jsp";
			}
		}
		
		# a02_0305.jsp
		(하단 참조)

[하] 2. DI를 이용해서 Book의 생성자를 통해서 데이터를 할당하소 출력처리하세요.
		# springdi\z02_exp\container1.xml
		<bean id="b01" class="springdi.z01_vo.Book">
			<constructor-arg value="알고리즘 문제"/>
			<constructor-arg value="23000"/>
			<constructor-arg value="알고맨"/>
			<constructor-arg value="IT서적"/>
		</bean>
		
		# springdi\z02_exp\A01_DI_Start1.java
		package springdi.z02_exp;

		import org.springframework.context.support.AbstractApplicationContext;
		import org.springframework.context.support.GenericXmlApplicationContext;
		import springdi.z01_vo.Book;		
		
		public class A01_DI_Start1 {
			public static void main(String[] args) {
				AbstractApplicationContext ctx = new GenericXmlApplicationContext("springdi\\z02_exp\\container1.xml");
				Book b01 = ctx.getBean("b01", Book.class);
				System.out.println(b01.getName());
				System.out.println(b01.getPrice());
				System.out.println(b01.getWriter());
				System.out.println(b01.getPublisher());
			}
		}
		

[하] 3. DI를 이용해서 Computer객체에 부품(Cpu, Ram, Hdd 객체)를 할당하여 
        Computer의 showInfo()메서드를 통해서 출력 처리하세요.
        컴퓨터명 @@@에 포함된
        Cpu 이름은 @@, 사양은 @@@
        Ram는 이름은 @@, 사양은 @@@
        Hdd는 이름은 @@, 사양은 @@@
        입니다.
        
        # springdi.z01_vo.Cpu.java / springdi.z01_vo.Ram.java / springdi.z01_vo.Hdd.java
        	private String name; private String spec; 으로 선언 후 생성자/getter/setter 설정
        	
        # springdi.z01_vo.Computer.java
        	private String name; private Cpu cpu; private Ram ram; private Hdd hdd;
        	public Computer() {	super(); }		
			public Computer(String name) { super(); this.name = name; }
			그 외 getter/setter 작성
			
			public void showInfo() {
				System.out.println("컴퓨터명 " + name + "에 포함된 ");
				if (cpu != null && ram != null && hdd != null) {
					System.out.println("CPU 이름은 " + cpu.getName() + ", 사양은 " + cpu.getSpec());
					System.out.println("RAM 이름은 " + ram.getName() + ", 사양은 " + ram.getSpec());
					System.out.println("HDD 이름은 " + hdd.getName() + ", 사양은 " + hdd.getSpec());
					System.out.println("입니다.");
				} else {
					System.out.println("부품의 정보를 정확히 파악할 수 없습니다.");
				}
			} 
        
		# springdi\z02_exp\A01_DI_Start2.java
		package springdi.z02_exp;

		import org.springframework.context.support.AbstractApplicationContext;
		import org.springframework.context.support.GenericXmlApplicationContext;		
		import springdi.z01_vo.Computer;
		
		public class A01_DI_Start2 {
			public static void main(String[] args) {
				AbstractApplicationContext ctx = new GenericXmlApplicationContext("springdi\\z02_exp\\container2.xml");
				Computer com01 = ctx.getBean("com01", Computer.class);
				com01.showInfo();
			}
		}
        
--%>
//
	$(document).ready(function(){
		
	});
</script>
</head>
<body>
<div class="jumbotron text-center">
  <h2>부트스트랩 form</h2>
</div>
<div class="container">
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	<form class="form-inline" method="post" action="${path}/memberList.do">
		<input class="form-control mr-sm-2" type="text" name="id" value="${param.id}" placeholder="아이디">
		<input class="form-control mr-sm-2" type="text" name="name" value="${param.name}" placeholder="회원명">
		<button class="btn btn-success" type="submit">Search</button>
	</form>
</nav>
<table class="table table-hover">
	<thead>
		<tr class="table-success text-center">
			<th>아이디</th>
			<th>비밀번호</th>
			<th>포인트</th>
			<th>이름</th>
			<th>권한</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="mem" items="${mlist}">
		<tr class="text-center">
			<td>${mem.id}</td>
			<td>${mem.pass}</td>
			<td>${mem.point}</td>
			<td>${mem.name}</td>
			<td>${mem.auth}</td>
		</tr>
		</c:forEach>
	</tbody>
</table>    
</div>
</body>
</html>