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
		service.insertFile(rep);
		// 파일 확인
		System.out.println("## 파일명 ##");
		System.out.println(rep.getReport()[0].getOriginalFilename());
		System.out.println(rep.getReport()[1].getOriginalFilename());
		System.out.println(rep.getReport()[2].getOriginalFilename());
		
		return "WEB-INF\\views\\a01_start\\a15_fileExp.jsp";
	}
}
