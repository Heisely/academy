package b01_servlet;

public class Lotto {
	public static void main(String[] args) {
		int[] ball = new int[45];
		for(int i=0; i<ball.length; i++) {
			ball[i] = i+1; // 1~45 입력
		}
		
//		 for(int i=1; i<=6;i++) {
//		 int j = (int)(Math.random()*45);
//		 System.out.println(ball[j]); }
//		 >> 이렇게 진행하게 되면 중복되는 값이 나올 수 있다.
		int j=0;
		int tmp = 0;
		for(int i=0; i<6; i++) {
			j = (int)(Math.random()*45);
			tmp = ball[i];
			ball[i] = ball[j];
			ball[j] = tmp;
		}
		
		for(int i=0; i<6; i++) {
			System.out.print(ball[i]+" ");
		}
	}
}
