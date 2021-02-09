package a02_object.a05_oneVSone;
/*
 # 객체를 메서드의 매개변수로 할당하여 사용하기
 1. 클래스 내에 객체나 변수는 일반적으로 보안적인 문제와 코드의 안정성 때문에
    접근 제어자를 이용하여 접근이 가능한 방법으로만 방법(메서드)으로만 처리를 한다. 
 2. 객체는 일반적으로 메서드의 매개변수로 할당을 한다.
 3. 형식
 	1) 클래스 선언
 	2) 메서드의 매개변수를 통해서 할당 처리
 	class Robot {
 		String kind;
 		Weapon wp;
 		
 		//Weapon wp = new Weapon("레이저빔",95);
 		void setWeapon(Weapon wp){
 			this.wp = wp;
 		}
 		
 		// String kind = "다간";
 		void setKind(String kind) {
 			this.kind = kind;
 		}
 	}
 	class Weapon {
 		String name;
 		int attackPt;
 	}
 	main()
 		Robot rb1 = new Robot("MZ");
 		rb1.wp = new Weapon("로켓포",80");	//(X)
 		// 바로 할당하는 것 보다는 기능메서드를 통해서 할당하고, 기능 메서드를 통해서 호출한다.
 		rb1.setWeapon(new Weapon("레이저빔",95));
 		rb1.setKind("다간");
 */
public class Z02_MainExp {
	public static void main(String[] args) {
		A09_Robot r1 = new A09_Robot("MZ");
		r1.attack();
		r1.setWeapon(new A10_Weapon("로켓포",80));
		// A09_Robot의 필드에 변경해서 처리
		r1.setWeapon(new A10_Weapon("레이저빔",95));
		r1.attack();
	}
}
