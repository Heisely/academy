package a02_object.a05_oneVSone;

public class A08_Driver {
	String name;
	A07_Car car;

	public A08_Driver(String name) {
		super();
		this.name = name;
	}

	void dirivingCar() {
		if (car != null) {
			System.out.println("# 차량 정보가 할당 되었을 때 #");
			System.out.println(name + "이(가) " + car.carName + "을(를) 몰고 최고 " + car.maxSpeed + "km/h로 주행합니다.");
		} else {
			System.out.println(name + "은(는) 차가 없네요..");
		}
	}
}
