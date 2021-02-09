package a02_object.a02_const;

/*
 * 1. default 생성자는 생성자를 선언하는 순간 사라지지만, 매개변수가 없는 생성자는 다른 생성자와 함께 사용할 수 있다.
 * 2. 매개변수가 없는 생성자는 특정 데이터를 할당하거나 프로세스를 코드로 추가 정의할 수 있다.
 */
/*
 # 전역변수와 지역변수
 1. 전역변수: 클래스에 전체적으로 영향을 미치는 변수
 			클래스 선언 하위에 선언되어 필드의 전역변수로 사용된다.
 	1) 클래스의 구성요소인 생성자와 메서드에 영향을 미치고
 	2) 이름이 동일한 생성자 또는 메서드에 있는 지역변수와 구분하기 위해서 this.전역변수 = 지역변수; 로 식별하여 사용한다.
 2. 지역변수: 특정한 블럭(중괄호{})안에서 선언하여 사용하는 변수
 	1) 매개변수 ex) BaseBallPlayer(String name)
 	2) 중괄호 블럭 안에서 새로 선언된 변수
 		void vall(){
 			int ag2 = 25;
 		}
 3. 자바에서는 지역변수가 이름이 겹치지 않으면 this 없이도 사용하여도 무방하다.
 	BaseBallPlayer(String name) 생성자 내의 team은 필드에 있는 변수(전역변수)이지만,
 	중괄호 내에 동일한 지역변수가 없기 때문에 선언된 내용으로 사용할 수 있다.
 */
public class BaseBallPlayer {
	String team;
	String name;
	double score;

	BaseBallPlayer() {
		team = "알 수 없음";
		name = "알 수 없음";
	}

	BaseBallPlayer(String name) {
		team = "알 수 없음";
		this.name = name;
	}

	BaseBallPlayer(String team, String name, double score) {
		this.team = team;
		this.name = name;
		this.score = score;
	}
}
