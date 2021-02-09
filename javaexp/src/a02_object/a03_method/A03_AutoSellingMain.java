package a02_object.a03_method;

public class A03_AutoSellingMain {
	public static void main(String[] args) {
		AutoSellingMachine am = new AutoSellingMachine();
		am.inputMoney(1000);
		am.inputMoney(500);
		am.inputMoney(1000);
		System.out.println();
		
		String bev = am.choiceButton(2);
		System.out.println("자판기를 통해 나온 음료: "+bev);
		System.out.println("자판기를 통해 나온 음료: "+am.choiceButton(3));
	}
}
