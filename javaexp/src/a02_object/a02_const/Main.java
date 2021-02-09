package a02_object.a02_const;

public class Main {
	public static void main(String[] args) {
		// ex) BaseBallPlayer 호출
		BaseBallPlayer b1 = new BaseBallPlayer();
		BaseBallPlayer b2 = new BaseBallPlayer("루친스키");
		BaseBallPlayer b3 = new BaseBallPlayer("NC", "루친스키", 0.345);

		System.out.println("#매개변수가 없는 생성자 호출#");
		System.out.println("b1.team: " + b1.team);
		System.out.println("b1.name: " + b1.name);
		System.out.println("b1.score: " + b1.score);
		System.out.println();
		System.out.println("#이름 매개변수만 있는 생성자 호출#");
		System.out.println("b2.team: " + b2.team);
		System.out.println("b2.name: " + b2.name);
		System.out.println("b2.score: " + b2.score);
		System.out.println();
		System.out.println("#모든 매개변수가 포함된 생성자 호출#");
		System.out.println("b3.team: " + b3.team);
		System.out.println("b3.name: " + b3.name);
		System.out.println("b3.score: " + b3.score);

	}
}
