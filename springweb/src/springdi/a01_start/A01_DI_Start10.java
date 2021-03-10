package springdi.a01_start;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import springdi.z01_vo.Computer;
import springdi.z01_vo.Mart;

public class A01_DI_Start10 {
	public static void main(String[] args) {
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("springdi\\a01_start\\container10.xml");
		Mart mart = ctx.getBean("mart", Mart.class);
		mart.buy();
		
		Computer computer = ctx.getBean("com", Computer.class);
		computer.showInfo();
	}
}
