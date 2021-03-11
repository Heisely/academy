package springdi.a02_middle.z02_vo;

public class Passenger {
	private String name;
	private int age;

	public Passenger() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Passenger(String name, int age) {
		super();
		this.name = name;
		this.age = age;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}
	
	public void info() {
		System.out.println("탑승객: "+name+"("+age+")");
	}
}
