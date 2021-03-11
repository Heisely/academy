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
