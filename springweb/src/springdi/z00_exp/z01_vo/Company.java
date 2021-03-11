package springdi.z00_exp.z01_vo;

import org.springframework.beans.factory.annotation.Autowired;

public class Company {
	private String company;
	@Autowired(required = false)
	private Emp emp;
	@Autowired(required = false)
	private Manager manager;
	@Autowired(required = false)
	private Ceo ceo;

	public Company() {
		super();
		company = "IT기업(기본회사)";
		// TODO Auto-generated constructor stub
	}

	public Company(String company) {
		super();
		this.company = company;
	}

	public void info() {
		System.out.println(company + "의 정보");		
		if(ceo!=null) ceo.info();
		if(manager!=null) manager.info();
		if(emp!=null) emp.info();
	}

	public String getName() {
		return company;
	}

	public void setName(String name) {
		this.company = name;
	}

	public Emp getEmp() {
		return emp;
	}

	public void setEmp(Emp emp) {
		this.emp = emp;
	}

	public Manager getManager() {
		return manager;
	}

	public void setManager(Manager manager) {
		this.manager = manager;
	}

	public Ceo getCeo() {
		return ceo;
	}

	public void setCeo(Ceo ceo) {
		this.ceo = ceo;
	}

}
