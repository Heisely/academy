package a02_object.a05_oneVSone;

/*
 # 1:1 관계 설정 연습
 1. Car 필드: 자동차명, 최고 속도
 	   메서드: showInfo()
 2. Driver 필드: 이름, Car
 		 메서드: drivingCar() - @@@가 차가 없네요..
 		  					- @@@가 @@@차를 몰고 최고 @@로 주행합니다.
 */
public class A07_Car {
	String carName;
	int maxSpeed;

	public A07_Car(String carName, int maxSpeed) {
		super();
		this.carName = carName;
		this.maxSpeed = maxSpeed;
	}

	void showInfo() {

	}
}
