package springdi.a02_middle;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import springdi.a02_middle.z03_vo.Computer;
import springdi.a02_middle.z03_vo.Ram;

public class A01_DI_Start5 {
	public static void main(String[] args) {
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("springdi\\a02_middle\\container5.xml");
		Computer computer = ctx.getBean("computer", Computer.class);
		Ram ram = ctx.getBean("ram", Ram.class);
		// 속성 바꾸기
		ram.setCompany("하이닉스");
		ram.setSpec("16GB");
		computer.info();
	}
}
