package a00_exp.a06_1218;
/*
 3. 필기구와 노트를 1:1 관계로 설정하여
 		@@필기구를 이용하여 노트에 @@를 기록하다.
 		객체 1:1 관계 설정으로 프로그램을 처리하세요.
 */

class Stationery {
	String name;
	int price;

	public Stationery(String name, int price) {
		this.name = name;
		this.price = price;
	}
}

class Note {
	String memo;
	Stationery stationery;

	public Note(String memo) {
		this.memo = memo;
	}
}

public class A03 {
	public static void main(String[] args) {
		Stationery s = new Stationery("샤프", 2000);
		Note n = new Note("안녕하세요. 박혜선입니다.");
		n.stationery = s;
		System.out.println(n.stationery.name + "을 " + n.stationery.price + "에 구매해서 노트에 '" + n.memo + "'라고 기록하다.");
	}
}
