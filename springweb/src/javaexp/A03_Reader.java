package javaexp;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

/*
# 2byte 이상 문자를 stream으로 처리해주는 객체
1. Reader/Writer

# 여러 가지 buffer메모리를 처리하고 이에 대한 기능 메소드 지원 객체
1. BufferedReader/BufferedWriter
 */
public class A03_Reader {
	public static void main(String[] args) {
		BufferedReader buffer = null;
		try {
			System.out.println("데이터를 입력하세요.");
			// System.in(InputStream) ==> InputStreamReader ==> BufferedReader
			// 상속관계에서 하위 객체의 기능 추가를 생성자를 통해 처리
			buffer = new BufferedReader(new InputStreamReader(System.in));
			String str = buffer.readLine();
			// readLine(): 라인별 데이터 입력. enter칠 때까지 데이터 입력처리 기능메서드
			System.out.println("입력 값: " + str);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				buffer.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
