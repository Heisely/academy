package a00_exp.a06_1218;

import java.util.Scanner;

class MemValidateException extends Exception{
	MemValidateException(String msg){
		super(msg);
	}
}
public class A10_class {
	public static void main(String[] args) {
		try {
			Scanner sc = new Scanner(System.in);
			System.out.print("아이디를 입력하세요: ");
			String id = sc.nextLine();
			System.out.print("패스워드를 입력하세요: ");
			String pass = sc.nextLine();
			
			if(!(id.equals("himan")&&pass.equals("7777"))) {
				throw new MemValidateException(id+"는 인증되지 못했습니다.");
			}
		} catch(MemValidateException e) {
			System.out.println("인증 오류: "+e.getMessage());
		} catch(Exception e) {
			System.out.println("기타 예외: "+e.getMessage());
		}
		
	}
}
