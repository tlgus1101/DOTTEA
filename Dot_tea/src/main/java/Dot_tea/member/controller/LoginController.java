package Dot_tea.member.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.apache.log4j.Logger;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import Dot_tea.member.service.MemberCompanyService;
import Dot_tea.member.service.MemberUserService;
import Dot_tea.order.service.OrderService;
import Dot_tea.setting.CommandMap;

@Controller
public class LoginController {

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "memberCompanyService")
	private MemberCompanyService memberCompanyService;

	@Resource(name = "orderService")
	private OrderService orderService;

	@Resource(name = "memberUserService")
	private MemberUserService memberUserService;

	@Resource
	private JavaMailSender mailSender;

	@RequestMapping(value = "/login/loginForm.tea")
	public ModelAndView loginForm(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/login/loginForm");

		System.out.println(commandMap.get("login"));
		return mv;
	}

	@RequestMapping(value = "/login/login.tea", method = RequestMethod.POST)
	public ModelAndView loginUser(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/login/loginForm.tea");
		String hidden_Type = (String) commandMap.get("loginType");

		if (hidden_Type.equals("1")) {
			commandMap.put("MEM_USER_USERID", commandMap.get("member_id"));
			commandMap.put("MEM_USER_PASSWORD", commandMap.get("memeber_password"));
			Map<String, Object> login = memberUserService.selectLoginUser(commandMap.getMap());

			if (login == null) {
				System.out.println("회원 로그인 실패 ");
				mv.setViewName("/login/loginForm");
				mv.addObject("loginfalse", "1");
				return mv;
			} else {
				HttpSession session = request.getSession();
				session.setAttribute("NOSession", login.get("MEM_USER_NO"));
				session.setAttribute("idSession", login.get("MEM_USER_USERID"));
				session.setAttribute("NameSession", login.get("MEM_USER_USERNAME"));
				session.setAttribute("typeSession", 1);

				if (session.getAttribute("bascket") != null) {
					List<Map<String, Object>> list = (List<Map<String, Object>>) session.getAttribute("bascket");
					System.out.println(" 로그인 list : " + list);
					for (int i = 0; i < list.size(); i++) {
						commandMap.put("B_COUNT", list.get(i).get("count"));
						commandMap.put("DEAL_NO", list.get(i).get("DEAL_NO"));
						commandMap.put("MEM_USER_NO", login.get("MEM_USER_NO"));

						orderService.InBasket(commandMap.getMap());
					}
				}
				session.removeAttribute("bascket");

				return new ModelAndView("redirect:/teaDeal/TeaRecommendList.tea");
			}

		} else if (hidden_Type.equals("2")) {
			commandMap.put("MEM_COM_ID", commandMap.get("member_id"));
			commandMap.put("MEM_COM_PASSWORD", commandMap.get("memeber_password"));

			Map<String, Object> login = memberCompanyService.selectLoginCompany(commandMap.getMap());

			if (login == null) {
				System.out.println("기업 로그인 실패 ");
				mv.setViewName("/login/loginForm");
				mv.addObject("loginfalse", "1");
				return mv;

			} else {
				HttpSession session = request.getSession();
				session.setAttribute("NOSession", login.get("MEM_COM_NO"));
				session.setAttribute("idSession", login.get("MEM_COM_ID"));
				session.setAttribute("NameSession", login.get("MEM_COM_NAME"));
				session.setAttribute("typeSession", 2);

				System.out.println("idSession" + login.get("MEM_COM_ID"));

				return new ModelAndView("redirect:/teaDeal/TeaRecommendList.tea");
			}
		}

		return mv;
	}

	@RequestMapping(value = "/login/logout.tea")
	public ModelAndView loginOut(CommandMap commandMap, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		session.removeAttribute("idSession");
		session.removeAttribute("NOSession");
		session.removeAttribute("NameSession");
		session.removeAttribute("typeSession");

		System.out.println(session.toString());
		return new ModelAndView("redirect:/teaDeal/TeaRecommendList.tea");
	}

	@RequestMapping(value = "/login/loginAdmin.tea")
	public ModelAndView loginCom(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/login/loginForm");

		commandMap.put("ADMIN_ID", commandMap.get("member_id"));
		commandMap.put("ADMIN_PW", commandMap.get("memeber_password"));

		Map<String, Object> login = memberCompanyService.selectMemberAdmin(commandMap.getMap());

		if (login.isEmpty() == true) {
			System.out.println("관리자 로그인 실패 ");
			mv.setViewName("/login/loginForm");
			mv.addObject("loginfalse", "1");
			return mv;
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("NOSession", "admin");
			session.setAttribute("idSession", "admin");
			session.setAttribute("NameSession", "admin");
			session.setAttribute("typeSession", 0);

			return new ModelAndView("redirect:/teaDeal/TeaRecommendList.tea");
		}
	}

	// 아이디 찾기 폼
	@RequestMapping(value = "/login/findIdForm.tea")
	public ModelAndView findIdForm() throws Exception {
		ModelAndView mv = new ModelAndView("/login/find_id_form");
		return mv;
	}

	// 아이디 찾기
	@RequestMapping(value = "/login/findId.tea", method = RequestMethod.POST)
	public ModelAndView find_user_id(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/login/success_find_id");
		String memberType = (String) commandMap.get("memberType");
		// System.out.println("개인1, 기업2 : "+memberType);

		if (memberType.equals("1")) {
			commandMap.put("MEM_USER_USEREMAIL", commandMap.get("member_email"));
			Map<String, Object> findedId = memberUserService.find_user_id(commandMap.getMap());
			String resultId = (String) findedId.get("MEM_USER_USERID");

			mv.addObject("findedId", resultId);
			if (resultId == null) {
				System.out.println("개인 회원 아이디 찾기 실패");
				return new ModelAndView("/login/find_id_form");
			}

		} else if (memberType.equals("2")) {
			commandMap.put("MEM_COM_COMPANY_EMAIL", commandMap.get("member_email"));
			Map<String, Object> findedId = memberCompanyService.find_com_id(commandMap.getMap());
			String resultId = (String) findedId.get("MEM_COM_ID");

			mv.addObject("findedId", resultId);
			if (resultId == null) {
				System.out.println("기업 회원 아이디 찾기 실패");
				return new ModelAndView("/login/find_id_form");
			}
		}

		return mv;
	}

	// 비밀번호 찾기 폼
	@RequestMapping(value = "/login/findPwForm.tea")
	public ModelAndView findPwForm() throws Exception {
		ModelAndView mv = new ModelAndView("/login/find_pw_form");
		return mv;
	}

	@RequestMapping(value = "/login/findPw.tea", method = RequestMethod.POST)
	public ModelAndView find_user_pw(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/login/success_find_pw");
		String memberType = (String) commandMap.get("memberType");
		/*
		 * String memberId = (String) commandMap.get("inputID"); String memberEmail =
		 * (String) commandMap.get("inputEmail");
		 */
		/*
		 * System.out.println("개인1, 기업2 : "+memberType);
		 * System.out.println("memberId  : "+memberId);
		 * System.out.println("memberEmail  : "+memberEmail);
		 */

		String keySet = RandomStringUtils.randomAlphanumeric(8);
		String setForm = "testforemail2233@gmail.com";
		String toMail = (String) commandMap.get("inputEmail");
		String title = "DotTea 임시 비밀번호입니다.";
		String content = "귀하의 임시비밀번호는 " + keySet + " 입니다.";
		/*
		 * System.out.println("keySet  : "+keySet);
		 * System.out.println("toMail  : "+toMail);
		 */

		commandMap.put("tempKey", keySet);

		if (memberType.equals("1")) {
			// commandMap.put("MEM_USER_USEREMAIL", commandMap.get("inputEmail"));
			Map<String, Object> findedEmail = memberUserService.find_user_pw(commandMap.getMap());
			System.out.println("findedEmail : " + findedEmail);

			if (findedEmail == null) {
				mv.setViewName("/login/find_pw_form");
				mv.addObject("NoOne", 1);
				System.out.println("이메일 없음 들어오나?");
				return mv;
			}

			String resultEmail = (String) findedEmail.get("MEM_USER_USEREMAIL");
			System.out.println("resultEmail : " + resultEmail);

			mv.addObject("keySet", keySet);
			mv.addObject("resultEmail", resultEmail);

			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			System.out.println("여기까지 오나?");

			messageHelper.setFrom(setForm);
			messageHelper.setTo(toMail);
			messageHelper.setSubject(title);
			messageHelper.setText(content);

			mailSender.send(message);

		} else if (memberType.equals("2")) {
			Map<String, Object> findedEmail = memberCompanyService.find_com_pw(commandMap.getMap());
			System.out.println("findedEmail : " + findedEmail);

			if (findedEmail == null) {
				mv.setViewName("/login/find_pw_form");
				mv.addObject("NoOne", 1);
				System.out.println("이메일 없음 들어오나?");
				return mv;
			}

			String resultEmail = (String) findedEmail.get("MEM_COM_COMPANY_EMAIL");
			System.out.println("resultEmail : " + resultEmail);

			mv.addObject("keySet", keySet);
			mv.addObject("resultEmail", resultEmail);

			System.out.println("Controller의 keySet : " + keySet);
			memberCompanyService.temp_com_pw(commandMap.getMap());
			System.out.println(commandMap.get("MEM_COM_PASSWORD"));

			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			System.out.println("여기까지 오나?");

			messageHelper.setFrom(setForm);
			messageHelper.setTo(toMail);
			messageHelper.setSubject(title);
			messageHelper.setText(content);

			mailSender.send(message);
		}

		return mv;
	}

}
