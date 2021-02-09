package a00_exp.a06_1218;

import java.util.ArrayList;

class Train {
	private String name;
	private ArrayList<Seat> slist;

	public Train(String name, ArrayList<Seat> slist) {
		super();
		this.name = name;
		this.slist = slist;
	}

	// 좌석 정보 리스트
	public void showList() {
		System.out.println(name + "기차 좌석 현황");
		for (Seat s : slist) {
			s.info();
		}
	}

	// 예약처리
	public void reserved(int numCart, int num) {
		System.out.println(numCart + "호차 " + num + "좌석 예약 여부 확인");
		Seat reSeat = null;
		// for (Seat st : slist) {
		for (int i = 0; i < slist.size(); i++) {
			Seat st = slist.get(i);
			if (st.getNumCart() == numCart && st.getNum() == num) {
				reSeat = st; // 해당 호차와 좌석정보가 있을 때, 해당 좌석을 return
				System.out.println(reSeat.isFull() ? "예약된 좌석입니다." : "예약 가능합니다");
				st.setFull(true);
				slist.set(i, st); // 변경할당 처리
			}
		}
		if (reSeat == null) {
			System.out.println("해당 좌석이 없습니다.");
		}
	}
}

class Seat {
	private int numCart; // 호차
	private int num; // 좌석
	private boolean isFull; // 예약여부
//	구간 처리 - 배열을 문자열로 설정해서, 해당 구간별로 예약여부를 처리
//	1. 배열
//	{"서울~수원", "수원~대전", "대전~대구", "대구~부산"}
//	{true, false, false, true}
//	2. 아래 객체로 또 호출 처리
//	객체 안에 또 객체 class Loc{String location, boolean isFull};

	public Seat(int numCart, int num, boolean isFull) {
		super();
		this.numCart = numCart;
		this.num = num;
		this.isFull = isFull;
	}

	public void info() {
		System.out.print(numCart + "호차\t");
		System.out.print(num + "번 좌석\t");
		System.out.println((isFull ? "예약" : "빈") + "좌석입니다.");
	}

	// 예약여부 변경 처리(외부에서 호출처리) - 임시
	public boolean isReserved(int numCart, int num) {
		System.out.println("예약 여부 확인");
		if (this.numCart == numCart && this.num == num) {
			return isFull;
		} else {
			return false;
		}
	}

	public int getNumCart() {
		return numCart;
	}

	public int getNum() {
		return num;
	}

	public boolean isFull() {
		return isFull;
	}

	public void setFull(boolean isFull) {
		this.isFull = isFull;
	}

}

public class A04_class {
	public static void main(String[] args) {
		// ArrayList 좌석 설정
		ArrayList<Seat> slist = new ArrayList<Seat>();
		for (int cnt = 1; cnt < 5; cnt++) {
			for (int scnt = 1; scnt <= 60; scnt++) {
				slist.add(new Seat(cnt, scnt, false));
			}
		}

		Train t = new Train("서울-부산 열차", slist);
		t.showList();
		t.reserved(1, 1);
		t.reserved(1, 2);
		t.reserved(1, 2);
		t.showList();
	}
}
