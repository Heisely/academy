package a02_object.a07_oneVSmulti;

import java.util.ArrayList;

/*
 # 1:多 관계의 객체처리
 1. 생각해봅시다..
 	1) 현실에서 1:多 관계가 어떤 것이 있을까?
 		ex) 버스 안의 승객, 편의점/마트에서 물건을 구매할 때,
 			컴퓨터의 구성요소로 여러 개의 부품들, 한 반에 있는 여러 명의 학생들, ...
 	2) 웹프로그래밍에서 처리해야할 1:多 관계 어떤 것이 있을까?
 		ex) 쇼핑몰 웹사이트에서 로그인한 사용자가 여러 개의 물건을 구매할 때,
 			영화 예약시스템에서 하나의 상영관에 여러 명의 고객이 좌석을 예매할 때,
 			온라인 기차표 예매 시 하나의 열차에 여러 개의 좌석을 예약할 때, ...
 2. 자바에서 1:多 관계의 프로그래밍
 	1) 자바의 객체로 다른 여러 개의 객체와, 종류는 같지만 여러 리스트형 객체의 처리가 위의 예제와 같이 필요로 하는 것을 볼 수 있다.
 	2) 유형 분류..
 		- 하나의 객체 안에 다른 종류의 여러 객체 할당
 			컴퓨터라는 객체 안에 cpu, ram, hdd, ...
 			자동차라는 객체 안에 엔진, 바퀴, 핸들, 디스플레이, ...
 		- 하나의 객체 안에 각종 종류의 리스트형 객체 할당
 			기차예매시스템에 열차 시간표라는 리스트
 			게시판 게시물 리스트
 			마트에서 구매하는 물품 리스트
 */
public class Z01_mainExp {
	public static void main(String[] args) {
		Mart m1 = new Mart("행복");
		m1.buyList();
		ArrayList<Product> plist = new ArrayList<Product>();
		plist.add(new Product("사과", 3000, 2));
		plist.add(new Product("바나나", 4000, 3));
		plist.add(new Product("딸기", 12000, 4));
		m1.setPlist(plist); // 구매 물건 할당
		System.out.println();

		m1.setPlist(plist); // 구매 물건 할당
		System.out.println("# 단위 객체로 물건 담기 처리 #");
		m1.buy(new Product("오렌지", 2000, 5));
		m1.buy(new Product("수박", 12000, 1));

		m1.buyList();
	}
}
