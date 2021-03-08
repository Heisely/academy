package springdi.a01_start;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import springdi.z01_vo.Book;
import springdi.z01_vo.Compart;
import springdi.z01_vo.Computer;


public class A01_DI_Start4 {
	public static void main(String[] args) {
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("springdi\\a01_start\\container4.xml");
		Book b01 = ctx.getBean("b01", Book.class);
		System.out.println(b01.getName());
		System.out.println(b01.getPrice());
		System.out.println(b01.getWriter());
		System.out.println(b01.getPublisher());
		
		Computer com = ctx.getBean("com", Computer.class);
		Compart p02 = ctx.getBean("p02", Compart.class);
		Compart p03 = ctx.getBean("p03", Compart.class);
		com.setPart(p02);
		com.setPart(p03);
		com.showInfo();
		
		Computer comM = ctx.getBean("comM", Computer.class);
		comM.showInfo();
	}
}
