package Dot_tea.teaQnA.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.activation.FileDataSource;
import javax.mail.internet.MimeMessage;

import org.apache.commons.lang3.RandomStringUtils;
import org.apache.log4j.Logger;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import Dot_tea.setting.CommandMap;

@Controller
public class One2oneQnAController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource
	private JavaMailSender mailSender;
	
	@RequestMapping("/teaMailQnA.tea")
	public ModelAndView teaMailQnA(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/mailQnA/teaMailQnA");
		return mv;
	}
	
	@RequestMapping("/teaSendMail.tea")
	public ModelAndView teaMailSend(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/mailQnA/sendMail");
		
		String setTo = "dhdusrud1355@gmail.com";
		String title = (String) commandMap.get("inputTitle");
		String content = "답변 받을 이메일 주소: "+(String) commandMap.get("inputEmail") + "\n"
						+ (String) commandMap.get("inputContent");
		System.out.println("여기까지 오나? 1 ");
		
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
		System.out.println("받는이: "+setTo);
		System.out.println("제목: "+title);
		System.out.println("내용: "+content);
		System.out.println("여기까지 오나? 2 ");

		messageHelper.setTo(setTo);
		messageHelper.setSubject(title);
		messageHelper.setText(content);

		mailSender.send(message);

		return mv;
	}

}
