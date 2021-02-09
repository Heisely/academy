package a02_object.a07_oneVSmulti;

import java.util.ArrayList;

/*
 ex) 1:다 관계의 내용을 아래의 구조로 처리하세요 
 	 Travel: 필드 - 여행타이틀(여름휴가/취억여행/...), ArrayList<Location>
 	 		 메서드 - 여행지 객체 추가 메서드
 	 		 		전체 여행일정 리스트 메서드
 	 Location(여행지) - 위치, 수단(배, 비행기, 차량, ...), 기간
 */

class Travel {
	private String title;
	private ArrayList<Location> list;

	public Travel(String title) {
		super();
		this.title = title;
		list = new ArrayList<Location>();
	}

	public void addLocation(Location loc) {
		list.add(loc);
	}

	public void showAllTravle() {
		System.out.println("# " + title + " #");
		System.out.println("위치\t수단\t기간");
		for (Location loc : list) {
			loc.showTravel();
		}

	}
}

class Location {
	private String loc;
	private String trans;
	private int date;

	public Location(String loc, String trans, int date) {
		super();
		this.loc = loc;
		this.trans = trans;
		this.date = date;
	}

	public void showTravel() {
		System.out.println(loc + "\t");
		System.out.println(trans + "\t");
		System.out.println(date + "\n");
	}
}

public class Z04_Travel {
	public static void main(String[] args) {
		ArrayList<Travel> tr1 = new ArrayList<Travel>();
		tr1.add(new Travel("취업여행"));
		tr1.add(new Travel("여름방학여행"));
		

	}
}
