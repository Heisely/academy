package springweb.a02_mvc.a01_controller;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import springweb.a02_mvc.a02_service.A04_MailService;
import springweb.z02_vo.Mail;

@Controller
@RequestMapping("mail.do")
public class A04_MailCtrl {
	// 초기화면
	// http://localhost:7080/springweb/mail.do?method=init
	@RequestMapping(params = "method=init")
	public String init() {
		return "WEB-INF\\views\\a02_mvc\\a04_mail.jsp";
	}

	@Autowired(required = false)
	private A04_MailService service;
	// 메일 발송
	// http://localhost:7080/springweb/mail.do?method=send
	@RequestMapping(params = "method=send")
	public String send(Mail send) throws MessagingException {
		System.out.println(send.getSubject());
		service.sendMail(send);
		// 메일 전송은 service단에서 처리
		return "WEB-INF\\views\\a02_mvc\\a04_mail.jsp";
	}
}
