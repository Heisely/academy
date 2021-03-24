package springweb.a01_start;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import springweb.z03_vo.Repository;

@Controller
public class A07_FileUploadCtrl {
	@Autowired(required = false)
	private B02_FileUploadService service;
	
	// http://localhost:7080/springweb/fileExp.do
	@GetMapping("fileExp.do")
	public String fileExp() {
		return "WEB-INF\\views\\a01_start\\a15_fileExp.jsp";
	}
	
	@PostMapping("fileExp.do")
	public String fileExp1(Repository rep) {
		// Repository에 name="content"와 name="report"배열을 받을 수 있는 property 선언
		System.out.println("### 실행 (파일 업로드) ###");
		service.insertFile(rep);
		
		return "WEB-INF\\views\\a01_start\\a15_fileExp.jsp";
	}
}
