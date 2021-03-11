package springdi.a02_middle.z03_vo;

public class Ssd {
	private String company;
	private String spec;

	public Ssd() {
		super();
		company = "삼성(기본옵션)";
		spec = "256GB(기본옵션)";
		// TODO Auto-generated constructor stub
	}

	public Ssd(String company, String spec) {
		super();
		this.company = company;
		this.spec = spec;
	}

	public void info() {
		System.out.println(company + "\t" + spec);
	}
}
