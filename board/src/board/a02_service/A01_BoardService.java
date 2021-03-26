package board.a02_service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
//board.a02_service.A01_BoardService
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import board.a03_dao.A01_BoardDao;
import board.z01_vo.Board;
import board.z01_vo.BoardFile;
import board.z01_vo.BoardSch;

@Service
public class A01_BoardService {
	@Autowired(required = false)
	private A01_BoardDao dao;
	// upload uploadTmp: info에 설정값 확인
	@Value("${upload}")
	private String upload;
	@Value("${uploadTmp}")
	private String uploadTmp;

	public ArrayList<Board> boardList(BoardSch sch) {
		if (sch.getSubject() == null) sch.setSubject("");
		if (sch.getWriter() == null) sch.setWriter("");
		// 1. 데이터 총 건수 할당
		sch.setCount(dao.totCnt(sch));
		// 2. 화면에서 요청값으로 가져온 pageSize로 총 페이지 수 할당
		// 	  1) 초기 화면에 표시될 pageSize를 default로 설정
		if(sch.getPageSize()==0) {
			sch.setPageSize(5);
		}
		//    2) 총 페이지수: 올림(총 건수/페이지 당 건수)
		int totPg = (int)(Math.ceil(sch.getCount()/(double)sch.getPageSize()));
		sch.setPageCount(totPg);
		// 3. 클릭한 현재 페이지(요청) default를 1로 선언
		if(sch.getCurPage()==0) {
			sch.setCurPage(1);
		}		
		// start, end 속성을 도출하기
		sch.setStart((sch.getCurPage()-1)*sch.getPageSize()+1);
		sch.setEnd(sch.getCurPage()*sch.getPageSize());

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
					System.out.println("상태 예외 발생: " + e.getMessage());
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
		// 메인 board정보와 연결되어 있는 파일리스트 정보를 VO객체에서 1:다 관계로 설정
		board.setFileInfo(dao.fileInfo(no));

		return board;
	}

	public void updateBoard(Board upt) {
		System.out.println("## 기존파일 개수: " + upt.getFnames().length);
		System.out.println("## 수정할 파일 개수: " + upt.getReport().length);
		int no = upt.getNo();

		// 첨부파일 물리적 위치 지정
		String fname = null; // 수정할 파일명
		String orgFname = null; // 기존 파일명
		File tmpFile = null;
		File orgFile = null;
		BoardFile uptFile = null; // 수정 파일 정보
		// 변경할 파일
		MultipartFile mpf = null;

		// 임시파일 삭제 처리
		File pathFile = new File(uploadTmp); // 폴더 객체 생성
		for (File f : pathFile.listFiles()) {
			System.out.println("삭제할 파일: " + f.getName());
			f.delete();
		}

		for (int idx = 0; idx < upt.getReport().length; idx++) {
			mpf = upt.getReport()[idx];
			fname = mpf.getOriginalFilename();
			// 기존 파일명
			orgFname = upt.getFnames()[idx];
			if (fname != null && !fname.trim().equals("")) {
				// 해당 폴더의 기존 파일은 일단 삭제(임시폴더)
				tmpFile = new File(uploadTmp + orgFname);
				if (tmpFile.exists()) {
					tmpFile.delete();
				}
				// 해당 폴더의 기존파일은 일단 삭제(대상폴더)
				orgFile = new File(upload + orgFname);
				if (orgFile.exists()) {
					orgFile.delete();
				}

				tmpFile = new File(uploadTmp + fname);
				orgFile = new File(upload + fname);

				try {
					// MultipartFile을 임시파일객체로 변환
					mpf.transferTo(tmpFile);
					Files.copy(tmpFile.toPath(), orgFile.toPath(), StandardCopyOption.REPLACE_EXISTING);
				} catch (IllegalStateException e) {
					e.printStackTrace();
					System.out.println("# 상태 에러: " + e.getMessage());
				} catch (IOException e) {
					e.printStackTrace();
					System.out.println("# 파일 변환 에러: " + e.getMessage());
				} catch (Exception e) {
					System.out.println("# 기타 에러: " + e.getMessage());
				}
				// 변경된 파일 정보 수정
				HashMap<String, String> hs = new HashMap<String, String>();
				hs.put("no", "" + no);
				hs.put("fname", fname);
				hs.put("orgFname", upt.getFnames()[idx]);
				// dao단 호출
				dao.updateFile(hs);
			}
		}
		// 메일 게시판 정보 수정
		dao.updateBoard(upt);
	}

	public void deleteBoard(int no) {
		dao.deleteFile(no);
		dao.deleteBoard(no);
		// 파일 삭제는 생략
	}
}
