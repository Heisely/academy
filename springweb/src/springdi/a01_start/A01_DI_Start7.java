package springdi.a01_start;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import springdi.z01_vo.Book;
import springdi.z01_vo.Mart;
import springdi.z01_vo.Person;
import springdi.z01_vo.Product;
import springdi.z03_vo.Computer;
import springdi.z03_vo.Sensor;

public class A01_DI_Start7 {
	public static void main(String[] args) {
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("springdi\\a01_start\\container7.xml");
		Person p01 = ctx.getBean("person", Person.class);
		Book book = ctx.getBean("book", Book.class);
		Mart mart = ctx.getBean("mart", Mart.class);
		Product prod = ctx.getBean("prod", Product.class);
		System.out.println("객체생성여부(person): " + p01);
		System.out.println("객체생성여부(book): " + book);
		System.out.println("객체생성여부(mart): " + mart);
		System.out.println("객체생성여부(prod): " + prod);
		
		/*
		Person/Product 객체이름이 같아서 경로까지 포함해서 하거나, A01_DI_Start8.java로 따로 처리
		springdi.z02_vo.Person p02 = ctx.getBean("p02", springdi.z02_vo.Person.class);
		springdi.z02_vo.Product prod03 = ctx.getBean("prod03", springdi.z02_vo.Product.class);
		System.out.println("객체생성여부(p02): "+p02);
		System.out.println("객체생성여부(prod03): "+prod03);
		*/
		
		Computer computer = ctx.getBean("computer", Computer.class);
		Sensor sensor = ctx.getBean("sensor", Sensor.class);
		System.out.println("객체생성여부(computer): " + computer);
		System.out.println("객체생성여부(sensor): " + sensor);
	}
}
