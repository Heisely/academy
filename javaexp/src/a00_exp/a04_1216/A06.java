package a00_exp.a04_1216;

/*
 6. 추상클래스와 인터페이스를 통한 익명클래스를 생성하여 처리하는 예제를 구현하세요.
    Larba/Robot DataAccessObj를 활용하여 처리.
 * 추상클래스나 인터페이스를 상속받는 하위 실제 클래스를 통해서 해당 내용을 사용하는게 일반적이지만,
   main()이나 호출하는 곳에서 바로 이름없이 정의하여 재정의된 메서드나 공통메서드를 사용하는 것을 말한다.
 */
public class A06 {
	public static void main(String[] args) {
		// 상속받은 하위 클래스를 하위 객체 이름없이 바로 선언하여 처리한다.
		// #주의
		// 추상클래스, 인터페이스 객체가 생성된 것이 아니고,폴리모피즘(상위 = 하위)에 의해서 이름없는 실제객체를 정의 및 생성해놓은 것
		// 정의된 내용을 메서드나 생성자를 통해서 사용할 수 있다.
		Larba a1 = new Larba("뮤탈리스크") {
			@Override
			void attack() {
				System.out.println("날으면서 원거리 공격을 하다.");
			}
		}; // 선언과 동시에 객체 생성
		a1.move();
		a1.attack();
		System.out.println();

		// 안드로이드에서 이벤트(클릭, 마우스 핸들링)에서 쓰이는 프로그래밍 방식
		DataAccessObj dao = new DataAccessObj() {
			@Override
			public void search() {
				System.out.println("익명 DB를 조회하다.");
			}

			@Override
			public void update() {
				System.out.println("익명 DB를 수정하다.");
			}

			@Override
			public void delete() {
				System.out.println("익명 DB를 삭제하다.");
			}

			@Override
			public void insert() {
				System.out.println("익명 DB를 등록하다.");
			}
		};
		dao.search();
		dao.update();
		dao.delete();
		dao.insert();
	}
}
