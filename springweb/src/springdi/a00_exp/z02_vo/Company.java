package springdi.a00_exp.z02_vo;

import org.springframework.beans.factory.annotation.Autowired;

public class Company {
	private String name;
	@Autowired(required = false)
	private Ceo ceo;
	@Autowired(required = false)
	private Manager manager;
	@Autowired(required = false)
	private Emp emp;

	public Company() {
		super();
		// TODO Auto-generated constructor stub
		name = "행복한 회사";
	}

	public void show() {
		System.out.println("# 회사 정보 #");
		System.out.println(name);
		if (ceo != null) ceo.show();
		if (manager != null) manager.show();
		if (emp != null) emp.show();
	}

	public void setCeo(Ceo ceo) {
		this.ceo = ceo;
	}

	public void setManager(Manager manager) {
		this.manager = manager;
	}

	public void setEmp(Emp emp) {
		this.emp = emp;
	}
	
	
}
