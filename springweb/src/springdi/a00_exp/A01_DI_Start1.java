package springdi.a00_exp;

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
