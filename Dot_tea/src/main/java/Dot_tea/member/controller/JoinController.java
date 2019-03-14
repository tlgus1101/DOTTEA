package Dot_tea.member.controller;

import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.mail.internet.MimeMessage;

import org.apache.commons.lang3.RandomStringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import Dot_tea.member.service.MemberCompanyService;
import Dot_tea.member.service.MemberUserService;
import Dot_tea.setting.CommandMap;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

@Controller
@RequestMapping(value = "/join/*")
public class JoinController {
	Logger log = Logger.getLogger(this.getClass());

	// @Inject
	// private JavaMailSender mailSender;

	@Resource(name = "memberUserService")
	private MemberUserService memberUserService;

	@Resource(name = "memberCompanyService")
	private MemberCompanyService memberCompanyService;

	@RequestMapping(value = "/jointype.tea")
	public ModelAndView jointype() throws Exception {
		ModelAndView mv = new ModelAndView("/member/join/jointype");
		return mv;
	}

	@RequestMapping(value = "/UserJoinForm.tea")
	public ModelAndView UserjoinForm() throws Exception {
		ModelAndView mv = new ModelAndView("/member/join/UserJoinForm");
		return mv;
	}

//	@RequestMapping(value = "/UserJoin.tea")
//	public ModelAndView Userjoin(Map<String, Object> commandMap) throws Exception {
//		ModelAndView mv = new ModelAndView("/login/loginForm");
//		memberUserService.insertMemberUser(commandMap.getMap());
//		return mv;
//	}

	@RequestMapping(value = "/UserJoin.tea")
	public ModelAndView Userjoin(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/login/loginForm");
		String birth_year = (String) commandMap.get("birth_year");
		String birth_month = (String) commandMap.get("birth_month");
		String birth_day = (String) commandMap.get("birth_day");
		String MEM_USER_BIRTH = birth_year + birth_month + birth_day;

		commandMap.put("MEM_USER_BIRTH", MEM_USER_BIRTH);
		System.out.println("생년월일 나오니? " + MEM_USER_BIRTH);
		System.out.println("전체 데이터? " + commandMap.getMap());

		memberUserService.insertMemberUser(commandMap.getMap());

		System.out.println("2 생년월일 나오니? " + MEM_USER_BIRTH);
		System.out.println("2 전체 데이터? " + commandMap.getMap());

		return mv;
	}

	@RequestMapping(value = "/companyJoinForm.tea")
	public ModelAndView companyJoinForm(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/member/join/companyJoinForm");

		return mv;
	}

	@RequestMapping(value = "/chkId.tea")
	public ModelAndView companychkId(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");

		Map<String, Object> find_id = memberCompanyService.select_check_id(commandMap.getMap());

		if (find_id != null) {
			mv.addObject("TOTAL", 1);
		} else
			mv.addObject("TOTAL", 0);

		return mv;
	}

	@RequestMapping(value = "/companyJoin.tea")
	public ModelAndView companyJoin(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/login/loginForm");

		commandMap.put("MEM_COM_ACCOUNT", commandMap.get("account1") + "," + commandMap.get("account2"));

		memberCompanyService.insertMemberCompany(commandMap.getMap());

		return mv;
	}

	@RequestMapping(value = "/chkMenEmail.tea")
	public ModelAndView companychkEmail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");

		Map<String, Object> black_email = memberCompanyService.com_chk_blackMan_email(commandMap.getMap());
		System.out.println("black_email.size()" + (black_email == null));
		if (black_email == null) {
			Map<String, Object> find_email = memberCompanyService.select_check_man_email(commandMap.getMap());

			if (find_email != null) {
				// System.out.println("여기까지는 오는건가?");
				mv.addObject("TOTAL2", 1);
				// System.out.println("TOTLA2"+mv);
			} else {
				// System.out.println("여기까지는 오는건가???");
				mv.addObject("TOTAL2", 0);
				// System.out.println("TOTLA2"+mv);
			}
		} else {
			mv.addObject("BLACK", 1);
		}

		return mv;
	}

	@Resource
	private JavaMailSender mailSender;

	@RequestMapping(value = "/chkComEmail.tea")
	public ModelAndView companychkComEmail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");

		Map<String, Object> black_email = memberCompanyService.com_chk_blackcom_email(commandMap.getMap());

		System.out.println("black_email.size()" + (black_email == null));
		if (black_email == null) {
			Map<String, Object> find_email = memberCompanyService.select_check_com_email(commandMap.getMap());

			String setForm = "testforemail2233@gmail.com";
			System.out.println(commandMap.get("inputEmail2"));
			String toMail = (String) commandMap.get("inputEmail2");
			String title = "닷티 이메일 인증입니다.";
			String keyset = RandomStringUtils.randomAlphabetic(8);
			String content = "인증 번호는 " + keyset + " 입니다.";

			if (find_email != null) {
				mv.addObject("TOTAL3", 1);
			} else {
				mv.addObject("TOTAL3", 0);
				mv.addObject("keySet", keyset);
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

				System.out.println("여기까지 오나?");

				messageHelper.setFrom(setForm);
				messageHelper.setTo(toMail);
				messageHelper.setSubject(title);
				messageHelper.setText(content);

				mailSender.send(message);

			}
		} else {
			mv.addObject("BLACK", 1);
		}

		return mv;
	}

	/*
	 * @RequestMapping(value = "/UserJoin.tea") public ModelAndView
	 * Userjoin(CommandMap commandMap) throws Exception { ModelAndView mv = new
	 * ModelAndView("/login/loginForm");
	 * System.out.println("insert 나오기는 해?"+commandMap.get("MEM_USER_ZIPCODE"));
	 * memberUserService.insertMemberUser(commandMap.getMap()); return mv; }
	 */

//	
//	@RequestMapping(value = "/join/companyJoinForm.tea/AjaxRequest.tea")
//	public ModelAndView resi(CommandMap commandMap) throws Exception {
//		ModelAndView mv = new ModelAndView("/member/AjaxRequest");
//		
//		commandMap.put("getUrl",commandMap.get("getUrl"));
//		
//		return mv;
//	}

	@RequestMapping(value = "/chkUserId.tea")
	public ModelAndView userChkId(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		Map<String, Object> find_id = memberUserService.select_check_id(commandMap.getMap());

		if (find_id != null) {
			mv.addObject("TOTAL4", 1); // 아이디 중복
			// System.out.println("아이디 중복이요" + mv);
		} else
			mv.addObject("TOTAL4", 0); // 아이디 사용 가능
		// System.out.println("아이디 사용 가능" + mv);

		return mv;
	}

	@RequestMapping(value = "/chkUserEmail.tea")
	public ModelAndView userChkEmail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		Map<String, Object> find_email = memberUserService.select_check_email(commandMap.getMap());

//	      System.out.println(commandMap.get("inputUserEmail"));
		String keySet = RandomStringUtils.randomAlphanumeric(8);
		String setForm = "testforemail2233@gmail.com";
		String toMail = (String) commandMap.get("inputUserEmail");
		String title = "DotTea 이메일 인증번호입니다.";
		String content = "귀하의 인증번호는 " + keySet + " 입니다.";

		if (find_email != null) {
			// System.out.println("이메일 중복임");
			mv.addObject("TOTAL5", 1); // 이메일 중복
		} else {
			// System.out.println("이메일 사용 가능");
			mv.addObject("TOTAL5", 0); // 이메일 사용 가능
			mv.addObject("keySet", keySet);
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setForm);
			messageHelper.setTo(toMail);
			messageHelper.setSubject(title);
			messageHelper.setText(content);

			mailSender.send(message);

		}

		return mv;
	}

}
