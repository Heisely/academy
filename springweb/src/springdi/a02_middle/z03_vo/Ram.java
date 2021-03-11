package springdi.a02_middle.z03_vo;

public class Ram {
	private String company;
	private String spec;

	public Ram() {
		super();
		company = "삼성(기본옵션)";
		spec = "8GB(기본옵션)";
		// TODO Auto-generated constructor stub
	}

	public Ram(String company, String spec) {
		super();
		this.company = company;
		this.spec = spec;
	}

	public void info() {
		System.out.println(company + "\t" + spec);
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public void setSpec(String spec) {
		this.spec = spec;
	}
	
	
}
