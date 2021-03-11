package springdi.z00_exp.z01_vo;

public class Manager {
	private String name;

	public Manager() {
		super();
		name = "김길동(기본 매니저)";
		// TODO Auto-generated constructor stub
	}

	public Manager(String name) {
		super();
		this.name = name;
	}

	public void info() {
		System.out.println("이름(매니저): "+name);
	}

}
