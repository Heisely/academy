package springweb.a01_start;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import springweb.a02_mvc.a03_dao.Z01_ExpDao;
import springweb.z03_vo.FileVo;
import springweb.z03_vo.Repository;

@Service
public class B02_FileUploadService {
	@Autowired(required = false)
	private Z01_ExpDao dao;
	@Value("${upload}")
	private String upload;
	@Value("${tmpUpload}")
	private String tmpUpload;

	public void insertFile(Repository rep) {
		// 파일업로드
		String fname = null;
		File tmpFile = null;
		File orgFile = null;
		System.out.println("파일의 개수: " + rep.getReport().length);
		// 임시파일 객체
		File pathFile = new File(tmpUpload);
		for (File f : pathFile.listFiles()) {
			System.out.println("삭제할 파일: " + f.getName());
			f.delete();
		}

		for (MultipartFile mpf : rep.getReport()) {
			fname = mpf.getOriginalFilename();
			if (fname != null && !fname.trim().equals("")) {
				tmpFile = new File(tmpUpload + fname);
				try {
					mpf.transferTo(tmpFile);
					orgFile = new File(upload + fname);
					Files.copy(tmpFile.toPath(), orgFile.toPath(), StandardCopyOption.REPLACE_EXISTING);
					System.out.println("# 파일명: " + upload + fname);
					System.out.println("# 내용: " + rep.getContent());
					// 내용과 파일명을 데이터베이스에 입력
					dao.insertFile(new FileVo(rep.getContent(), fname));
					System.out.println("# DB처리 완료");
				} catch (IllegalStateException e) {
					e.printStackTrace();
					System.out.println("상태값 에러: " + e.getMessage());
				} catch (IOException e) {
					e.printStackTrace();
					System.out.println("파일 처리 에러: " + e.getMessage());
				}
			}
		}
	}
}
