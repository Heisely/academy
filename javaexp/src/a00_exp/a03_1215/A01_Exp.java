package a00_exp.a03_1215;

import java.util.ArrayList;

/*
 1. 1:다 중 종류가 다른 객체를 포함하는 객체에 할당하는 예제를 만들어보세요
 	1) 컴퓨터 vs CPU/메모리/hdd
 	   - 컴퓨터 필드: 컴퓨터 종류, Cpu, Ram, Hdd
 	   - 컴퓨터 메서드: showInfo() - @@@ 컴퓨터 부품 사양
 	   Cpu, Ram, Hdd: 필드- 이름, capacity(기능속도/메모리크기)
 	   
 2. java에서 상속이 현실 세계의 상속과 어떤 점이 공통인지를 기술하고,
 	기본 문법을 예제를 통해서 선언하세요.
 	- 현실 세계의 자식이 부모에게서 유전자 등을 물려받듯
 	  자식(하위, 파생) 클래스는 부모 클래스의 멤버를 물려받는다.
 	- ex)
 	  class Mother {
 	  	String skill = "요리를 잘 한다.";
 	  	void driving(){
 	  		System.out.println("운전을 잘 한다.");
 		}
 	  }
 	  class Daughter {
 	  	String study = "공부를 잘 한다.";
 	  	void riding(){
 	  		System.out.println("자전거를 잘 탄다");
 	  	}
 	  }
 	  public class A02_Exp {
 	  	public static void main(String[] args) {
 	  		Daughter d1 = new Daughter();
 	  		System.out.prinln(d1.skill); // 부모 필드 활용: "요리를 잘 한다." 출력
 	  		d1.driving(); // 부모 메서드 활용: "운전을 잘 한다." 출력
 	  		System.out.pintln(d1.study); // 자식 필드 활용: "공부를 잘 한다." 출력
 	  		d1.riding(); // 자식 메서드 활용: "자전거를 잘 탄다." 출력
 	  	}
 	  }
	- 위 예제처럼 자식클래스는 부모클래스의 필드 및 메서드를 사용할 수 있다.
	
 3. 상속에서 접근제어자로 통한 한계를 기술하세요.
 	- 부모클래스에서 private로 선언한 변수는 자식클래스에서 사용할 수 없다.
 	- 자식클래스의 접근 제어자는 부모클래스보다 더 넓어야 한다.
 	  ex) default ==> default 이상인 default, protected, public 
 		  public ==> default(X)
 		  
 4. 자바에서 다중상속이 안 된다는 말은 무엇을 의미하는지 개념과 소스코드 예제를 통해서 기술하세요.
 	- class Father{}, class Mother{}, class Daughter{} 가 있다고 할 때,
 	  class Daughter{}가 상속을 받으려고 한다면 Father와 Mother 중 하나만 선택할 수 있다.
 	  class Daughter extends Mother{} 혹은 class Daughter extends Father{} ==> (O)
 	  class Daughter extends Mother, Father {} ==> (X)
 	  
 5. 상속에서 상위 생성자에 따른 하위 생성자의 영향을 매개변수 관점에서 예제 코드를 통해 설명하세요.
 	- 상위 생성자에 매개변수가 있으면 하위 생성자에도 매개변수가 존재해야 한다.
 	- ex)
 	class Duck1 {
		String name;
		Duck1() {
			System.out.println("# 상위생성자 Duck1 #");
		}
		public void sound() {
			System.out.println("Duck1 오리가 운다.");
		}
	}

	class LubberDuck extends Duck1 {
		String name;
		LubberDuck(){
			System.out.println("# 하위생성자 LubberDuck #");
		}
		public void sound() {
			super.sound();
			System.out.println("꽥꽥");
		}
	}

	class Duck2 {
		String name;
		Duck2(String name) {
			this.name = name;
			System.out.println("# 상위생성자 Duck2 #");
		}
		void sounds() {
			System.out.println("Duck2 오리가 운다.");
		}
	}

	class NorDuck extends Duck2 {
		String name;
		NorDuck(String name) {
			super("NorDuck");
			System.out.println("# 하위생성자 NorDuck #");
		}
		void sounds() {
			super.sounds();
			System.out.println("꽈악-");
		}
	}
	
 6. overloading과 overriding의 차이점을 기술하세요.
 	overloading은 같은 메서드 이름을 쓰면서 변수의 타입을 다르게 하는 경우를 말하고
 		- 예) add(int a, int b){ a+b; }
 		     add(int a , float b){ a+b; }
 	overriding은 상속관계에서 자식클래스가 부모클래스의 메서드를 불러와서 재정의해서 쓰는 경우를 말한다.
 		- 예) 5번의 예제 참고
 */

// 상속 관계로 처리
// 상위 공통부분 설정
class ComPart {
	private String kind;
	private double capacity;

	public ComPart(String kind, double capacity) {
		this.kind = kind;
		this.capacity = capacity;
	}

	public void info() {
		System.out.println("# 부품 사양 #");
		System.out.println("부품명: " + kind);
		System.out.print("성능: " + capacity);
	}
}

class Cpu extends ComPart {
	private String kind;
	private int capacity;

	public Cpu(double capacity) {
		super("CPU", capacity);
	}

	public void info() { // 재정의 처리
		super.info();
		System.out.println("GHZ");
	}
}

class Ram extends ComPart {
	private String kind;
	private int capacity;

	public Ram(int capacity) {
		super("Ram", capacity);
	}

	public void info() { // 재정의 처리
		super.info();
		System.out.println("GBytes");
	}
}

class Hdd extends ComPart {
	private String kind;
	private int capacity;

	public Hdd(int capacity) {
		super("Hdd", capacity);
	}

	public void info() { // 재정의 처리
		super.info();
		System.out.println("GBytes");
	}
}

class Computer {
	private String kind;
	// 하나씩 추가 처리
	private Cpu cpu;
	private Ram ram;
	private Hdd hdd;
	// 상위 = 하위 (다형성처리)
	private ArrayList<ComPart> list;

	public Computer(String kind) {
		super();
		this.kind = kind;
		list = new ArrayList<ComPart>();
	}

	// 컴퓨터 부품 추가 처리
	public void setCpu(Cpu cpu) {
		this.cpu = cpu;
	}

	public void setRam(Ram ram) {
		this.ram = ram;
	}

	public void setHdd(Hdd hdd) {
		this.hdd = hdd;
	}

	// 컴퓨터 부분 추가 처리
	public void setPart(ComPart part) {
		list.add(part);
	}

	// 하나씩 설정한 경우
	public void showInfo1() {
		System.out.println("# " + kind + " 컴퓨터활용 #");
		cpu.info();
		ram.info();
		hdd.info();
	}

	// ArrayList로 한번에 할당한 경우
	public void showInfo2() {
		System.out.println("# " + kind + " 컴퓨터활용 #");
		for (ComPart part : list) {
			part.info();
		}
	}

}

public class A01_Exp {
	public static void main(String[] args) {
		Computer c1 = new Computer("맥프로");
		// 1개씩 부품 추가
		c1.setCpu(new Cpu(3.2));
		c1.setRam(new Ram(16));
		c1.setHdd(new Hdd(256));
		c1.showInfo1();
		System.out.println();
		c1.setPart(new Cpu(3.5)); // 상위 = 하위 (다형성) ComPart p = new Cpu(3.5);
		c1.setPart(new Ram(32));
		c1.setPart(new Hdd(500));
		c1.showInfo2();
	}
}
