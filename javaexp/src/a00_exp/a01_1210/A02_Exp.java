package a00_exp.a01_1210;

/*
 # 1:1 관련 연습 예제
 1. 사람(이름, 주소, 핸드폰) vs 핸드폰(전화번호, 제조사) 관계를 메서드로 할당하는데까지 처리해서 출력해주세요.
 2. 컴퓨터(종류, 제조사) vs cpu(클럭속도, 제조사)	관계를 메서드로 할당하고, CPU 장착 여부에 대한 처리 출력.
 3. Person(이름, Friend) vs Friend(이름, 좋은 기억)
 */
class People { // ex1.class(1)
	String name;
	String adress;
	Phone phone;

	public People(String name, String adress) {
		super();
		this.name = name;
		this.adress = adress;
	}

	void setPhone(Phone phone) {
		this.phone = phone;
	}

	void aboutPeople() {
		System.out.println("사용자 이름: " + name);
		System.out.println("사용자 주소: " + adress);
		if (phone != null) {
			System.out.println("# 사용자 핸드폰 정보 #");
			phone.aboutPhone();
		} else {
			System.out.println("사용자 핸드폰 정보가 없습니다.");
		}

	}
}

class Phone { // ex1.class(2)
	String number;
	String made;

	public Phone(String number, String made) {
		super();
		this.number = number;
		this.made = made;
	}

	void aboutPhone() {
		System.out.println("핸드폰 번호: " + number);
		System.out.println("핸드폰 제조사: " + made);
	}
}

class Computer { // ex2.class(1)
	String type;
	String madeCompany;
	Cpu c;

	public Computer(String type, String madeCompany) {
		super();
		this.type = type;
		this.madeCompany = madeCompany;
	}

	void setCpu(Cpu c) {
		this.c = c;
	}

	void aboutComputer() {
		System.out.println("컴퓨터 종류: " + type);
		System.out.println("컴퓨터 제조사: " + madeCompany);
		if (c != null) {
			System.out.println("# CPU가 장착되어 있음 #");
			c.aboutCpu();
		} else {
			System.out.println("# CPU가 장착되어 있지 않음 #");
		}
	}
}

class Cpu { // ex2.class(2)
	String v;
	String company;

	public Cpu(String v, String company) {
		super();
		this.v = v;
		this.company = company;
	}

	void aboutCpu() {
		System.out.println("CPU 속도: " + v);
		System.out.println("CPU 제조사: " + company);
	}
}

class Person { // ex3.class(1)
	String name;
	Friend friend;

	public Person(String name) {
		super();
		this.name = name;
	}

	void setFriend(Friend friend) {
		this.friend = friend;
	}

	void aboutPerson() {
		System.out.println("# 친구와의 기억 #");
		if (friend != null) {
			System.out.println("# " + name + "과 친구 " + friend.name + "의 좋은 기억 #");
			friend.setMemory();
		} else {
			System.out.println(name + "은(는) 친구와의 좋은 기억이 없습니다....ㅠㅠ");
		}
	}
}

class Friend { // ex3.class(2)
	String name;
	String goodMemory;

	public Friend(String name, String goodMemory) {
		super();
		this.name = name;
		this.goodMemory = goodMemory;
	}

	void setMemory() {
		System.out.println("친구 이름: " + name);
		System.out.println("좋은 기억: " + goodMemory);
	}

}

public class A02_Exp {
	public static void main(String[] args) {
		// ex1.main()
		People p1 = new People("홍길동", "서울시 구로구");
		p1.aboutPeople();
		System.out.println();
		p1.setPhone(new Phone("010-1234-5678", "삼성"));
		p1.aboutPeople();
		System.out.println();

		// ex2.main()
		Computer c1 = new Computer("그램", "LG");
		c1.aboutComputer();
		System.out.println();
		c1.setCpu(new Cpu("5G", "인텔"));
		c1.aboutComputer();
		System.out.println();

		// ex3.main()
		Person p = new Person("이자바");
		p.aboutPerson();
		System.out.println();
		p.setFriend(new Friend("김프로", "함께 남산에 올라가서 야경을 봤다."));
		p.aboutPerson();
	}

}
