package springdi.a00_exp;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import springdi.a00_exp.z02_vo.Company;

public class A06_0310 {
	public static void main(String[] args) {
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("springdi\\a00_exp\\container4.xml");
		
		Company company = ctx.getBean("company", Company.class);
		company.show();
	}
}
