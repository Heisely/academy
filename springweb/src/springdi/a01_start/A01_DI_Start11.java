package springdi.a01_start;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import springdi.z01_vo.Computer2;

public class A01_DI_Start11 {
	public static void main(String[] args) {
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("springdi\\a01_start\\container11.xml");
		
		Computer2 com = ctx.getBean("com", Computer2.class);
		com.showInfo();
	}
}
