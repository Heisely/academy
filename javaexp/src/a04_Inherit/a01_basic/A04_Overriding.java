package a04_Inherit.a01_basic;

import java.util.ArrayList;

/*
 ex) overriding 예제 만들기
 	 	Duck 오리 클래스
 	 	 - 필드: kind
 	 	 - 메서드: sound();
 NomalDuck 집오리, 메서드 재정의 sound() 꽉꽉!!
 Mallard 청둥오리, 메서드 재정의 sound() 꽥꽥!!
 */
/*
 # 다형성과 형변환
 1. sound()라는 재정의 메서드는 각 하위 객체별로 선언하는데,
 	만약에 고통부분이 필요하지 않고, 하위에 개별적인 내용만 선언해야 한다면?
 2. 상속받는 모든 하위클래스에서 반드시 특정한 기능메서드의 구현을 필요(재정의)로 하는 경우에는 어떻게 할까?
 	==> 강제화 하기 위해서 필요로 하는 메서드
 3. 상위 내용은 공통적으로 쓰지만, 현실적으로 실현화 될 필요가 없는 추상적인 클래스일 경우, 
 	굳이 실제 클래스를 만들어 놓지 않아도 되는 경우가 있다.
 4. 이런 필요에 의해 상위는 추상적인 클래스만 선언하고, 하위의 구체적인 객체를 생성화하는 것이 추상화 개념이고,
 	이것을 필요로 하는 부분이 다형성 개념이다.
 	
 # 다형성
 1. 상위 클래스의 공통된 내용의 객체를 기반으로 하위에 여러가지 객체를 다양하게 생성하는 것
 	ex) 오리를 상위하고 실제 상속받은 하위 객체로 보통오리, 청둥오리, 장난감 오리 등의 모양을 만든다고 할 수 있다.
 2. 메모리 관점에서의 다형성의 개념
 	1) 상속을 한다는 것은 상위 객체를 통해서 하위 객체가 만들어지는 것을 의미하므로
 	   모든 하위 객체는 상위 객체의 메모리(참조변수)에 할당이 가능하다.
 	   ex) 상위클래스 참조변수 = new 하위생성자();
 	   	   참조변수.메서드();
 	2) 다형성의 한계
 		다형성을 통한 상위클래스의 처리내용은 상위 클래스의 변수와 상위클래스에서 재정의한 메서드까지 상위클래스의 참조객체로 사용할 수 있다.
 		
 */
class Duck {
	String kind;

	public Duck(String kind) {
		super();
		this.kind = kind;
	}

	public void sound() {
		System.out.println(kind + "가 운다.");
	}
}

class NormalDuck extends Duck {
	public NormalDuck() {
		super("집오리");
	}

	@Override
	public void sound() {
		super.sound();
		System.out.println("꽉꽉");
	}

}

class Mallard extends Duck {
	public Mallard() {
		super("청둥오리");
	}

	@Override
	public void sound() {
		super.sound();
		System.out.println("꽥꽥");
	}

}

public class A04_Overriding {
	public static void main(String[] args) {
		NormalDuck d1 = new NormalDuck();
		d1.sound();
		Mallard d2 = new Mallard();
		d2.sound();

		// 상위 메모리에 하위 객체들을 할당할 수 있다.
		// 다형성이 하나의 객체를 통해서 여러 모양의 객체로 만들어 지는것이라서 다형성(Polymorpism)이라는 말을 쓴다.
		//
		Duck dk1 = new NormalDuck();
		Duck dk2 = new Mallard();
		dk1.sound();
		dk2.sound();
		System.out.println();
		// dk1.move(); // NormalDuck에 있는 move()메서드는 사용할 수 없다.
		// 다형성의 한계로 하위의 고유 추가 멤버(필드, 메서드)를 사용할 수 는 없다.
		// 하위클래스 = (타입캐스팅)다형성으로 만든 참조변수;
		// 하위의 고유기능을 쓰려면 타입 캐스팅이 필요하다.
		NormalDuck nd = (NormalDuck) dk1;
		// nd.running();

		// ex) 상위 Book(필드 - 종류, 도서명, 가격, buy()..)
		// 하위 ITBook(.. 추가메서드 read() @@도서를 읽다)
		// 다형성과 type casting을 처리하여 재정의한 메서드와 하위 추가한 메서드를 호출하세요
		Book b1 = new ItBook("자바 기초", 28000);
		b1.buy(); // 다형성은 하위에 재정의된 내용까지 영향을 미친다.
		// b1.read(); // 사용 불가. 하위에서만 사용 가능
		System.out.println();

		// 타입캐스팅
		ItBook itb = (ItBook) b1;
		itb.buy();
		itb.read();
		System.out.println();

		// 자바의 최상클래스(Object)는 모든 클래스를 다형성으로 할당할 수 있다.
		Object ob1 = new Book("인문학", "서양사", 23000);
		Object ob2 = new ItBook("스프링", 28000);
		// 해당 내용을 구성해서 처리하려면 타입캐스팅을 해야한다.
		Book bk5 = (Book) ob1;
		ItBook bk6 = (ItBook) ob2;
		// ArrayList 형태에서도 상송관계가 있는 클래스는 모두 다 할당이 가능하다.
		ArrayList<Book> list = new ArrayList<Book>();
		list.add(new ItBook("jsp 기초", 32000));
		list.add(new HistoryBook("한국사", 20000));
		for(Book b: list) {
			b.buy();
		}

	}
}

class Book {
	private String kind;
	private String title;
	private int price;

	public Book(String kind, String title, int price) {
		super();
		this.kind = kind;
		this.title = title;
		this.price = price;
	}

	public void buy() {
		System.out.println(kind + "도서를 " + price + "원에 구매하다.");
	}

	public String getTitle() { // 필드를 읽어오는 메서드
		return title;
	}

}

class HistoryBook extends Book {

	public HistoryBook(String title, int price) {
		super("역사", title, price);
	}

}

class ItBook extends Book {

	public ItBook(String title, int price) {
		super("IT 기술", title, price);
	}

	@Override
	public void buy() {
		System.out.println("# IT 기술 관련 서적 파트에서 구매 #");
		super.buy();
	}

	public void read() {
		System.out.println(getTitle() + "를 읽다.");
	}
}