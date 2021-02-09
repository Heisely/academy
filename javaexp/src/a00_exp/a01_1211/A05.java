package a00_exp.a01_1211;

/*
 5. 버스 클래스를 만들고 필드로 번호, 시작점, 마지막 종착점 선언
 	생성자를 통해서 해당 필드값을 초기화 처리
 	메서드를 통해서 @@번 버스 @@@~@@노선 출력..
 */
class Bus {
	int no;
	String start;
	String end;

	public Bus(int no, String start, String end) {
		super();
		this.no = no;
		this.start = start;
		this.end = end;
	}

	void showInfo() {
		System.out.println(no + "번 버스는 " + start + "~" + end + " 노선입니다.");
	}
}

public class A05 {
	public static void main(String[] args) {
		Bus b1 = new Bus(17,"병점역","동탄역(동측)");
		b1.showInfo();
		Bus b2 = new Bus(64,"동탄차고지","안양역");
		b2.showInfo();
	}
}
