package springdi.z00_exp.z01_vo;

public class Ceo {
	private String name;

	public Ceo() {
		super();
		name = "신길동(사장)";
		// TODO Auto-generated constructor stub
	}

	public Ceo(String name) {
		super();
		this.name = name;
	}

	public void info() {
		System.out.println("이름(사장): "+name);
	}

}
