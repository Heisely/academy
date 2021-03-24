package board.a02_service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
//board.a02_service.A01_BoardService
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import board.a03_dao.A01_BoardDao;
import board.z01_vo.Board;
import board.z01_vo.BoardFile;

@Service
public class A01_BoardService {
	@Autowired(required = false)
	private A01_BoardDao dao;
	// upload uploadTmp: info에 설정값 확인
	@Value("${upload}")
	private String upload;
	@Value("${uploadTmp}")
	private String uploadTmp;

	public ArrayList<Board> boardList(Board sch) {
		if (sch.getSubject() == null)
			sch.setSubject("");
		if (sch.getWriter() == null)
			sch.setWriter("");
//		System.out.println("upload: " + upload);
//		System.out.println("uploadTmp: " + uploadTmp);

		return dao.boardList(sch);
	}

	public void insertBoard(Board insert) {
		System.out.println("upload: " + upload);
		System.out.println("uploadTmp: " + uploadTmp);
		// 2.데이터베이스
		dao.insertBoard(insert);

		// 1. 물리적 파일 업로드
		String fname = null;
		File tmpFile = null; // 임시 위치
		File orgFile = null; // 업로드 위치
		// 임시파일 삭제 처리
		File pathFile = new File(uploadTmp); // 폴더 객체 생성
		// .listFiles(): 해당 폴더 객체 안에 있는 파일을 가져오기
		// 임시 폴더에 있는 모든 파일을 삭제 함으로써 중복 예외를 방지
		for (File f : pathFile.listFiles()) {
			System.out.println("삭제할 파일: " + f.getName());
			// 단위 파일을 삭제
			f.delete();
		}
		
		// # 다중 파일 처리 / 반복문 수행
		for (MultipartFile mpf : insert.getReport()) {
			// 1) 파일명 지정
			fname = mpf.getOriginalFilename();

			// 파일을 등록하지 않았을 때 제외 처리
			if (fname != null && !fname.trim().equals("")) {
				// 임시파일 객체 선언(경로명+파일명)
				// ps) File 객체는 파일과 폴더를 처리할 수 있다.
				tmpFile = new File(uploadTmp + fname);				

				// MultipartFile ==> File로 변환 후 할당
				try {
					mpf.transferTo(tmpFile); // IO발생 --> 예외 필수 처리 & 해당 위치에 파일이 생성 됨

					// 임시 위치에서 z01_upload로 복사
					orgFile = new File(upload + fname);

					// 복사
					// StandardCopyOption.REPLACE_EXISTING: 동일한 파일명 업로드 시 대체처리
					Files.copy(tmpFile.toPath(), orgFile.toPath(), StandardCopyOption.REPLACE_EXISTING);

					// 파일명, 업로드위치, 제목
					dao.uploadFile(new BoardFile(fname, upload, insert.getSubject()));
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
					System.out.println("파일 생성 에러: " + e.getMessage());
				} catch (Exception e) {
					System.out.println("기타 에러: " + e.getMessage());
				}
			}
		}
	}
	
	public Board getBoard(int no) {
		// 1. 조회 cnt 수정(readcnt)증가
		dao.uptReadCnt(no);
		// 2. 기본 board정보 할당
		Board board = dao.getBoard(no);
		// 3. 첨부파일 정보 할당
		board.setFileInfo(dao.fileInfo(no));
		
		return board;
	}
}
