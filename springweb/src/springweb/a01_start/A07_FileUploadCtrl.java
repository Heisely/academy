package springweb.a01_start;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import springweb.z03_vo.Repository;

@Controller
public class A07_FileUploadCtrl {
	@Autowired(required = false)
	private B02_FileUploadService service;
	
	// http://localhost:7080/springweb/fileList.do
	@GetMapping("fileList.do")
	public String fileList(Model d) {
		// 파일 확인
		d.addAttribute("fileList", service.fileList());
		return "WEB-INF\\views\\a01_start\\a16_fileList.jsp";
	}
	
	// http://localhost:7080/springweb/fileDown.do?fname=
	@GetMapping("fileDown.do")
	public String download(@RequestParam("fname") String fname, Model d) {
		System.out.println("파일명: "+fname);
		d.addAttribute("downloadFile", fname); // viewer 안에 선언한 모델명
		// 컨테이너 안에 있는 viewer명
		return "downloadviewer";
	}
	
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
