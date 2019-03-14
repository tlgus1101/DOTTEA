package Dot_tea.info.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.apache.log4j.Logger;
import org.springframework.http.HttpRequest;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import Dot_tea.info.service.InfoService;
import Dot_tea.member.service.MemberUserService;
import Dot_tea.product.service.TeaDealService;
import Dot_tea.setting.CommandMap;

@Controller
public class InfoController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "infoService")
	private InfoService infoService;

	@Resource(name = "memberUserService")
	private MemberUserService memberUserService;

	@RequestMapping(value = "/member/checkU.tea")
	public ModelAndView memberCheck(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/member/user/pass/checkForm");
		return mv;
	}

	@RequestMapping(value = "/member/infoupdate.tea")
	public ModelAndView infoupdate(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/member/user/pass/update");
		// System.out.println("핸드폰 번호 : "+commandMap.get("MEM_USER_PHONE"));
		System.out.println("유저 번호 : " + commandMap.get("MEM_USER_NO"));
		// System.out.println("정보가 뭐 뭐 오지? "+commandMap.getMap());

		String birth_year = (String) commandMap.get("birth_year");
		String birth_month = (String) commandMap.get("birth_month");
		String birth_day = (String) commandMap.get("birth_day");
		String MEM_USER_BIRTH = birth_year + birth_month + birth_day;
		System.out.println("생일 나와? " + MEM_USER_BIRTH);
		commandMap.put("MEM_USER_BIRTH", MEM_USER_BIRTH);

		infoService.infoUpdate(commandMap.getMap());

		mv.addObject("user_no", commandMap.get("MEM_USER_NO"));
		mv.addObject("user_name", commandMap.get("MEM_USER_USERNAME"));
		mv.addObject("user_phone", commandMap.get("MEM_USER_PHONE"));
		mv.addObject("user_email", commandMap.get("MEM_USER_USEREMAIL"));
		mv.addObject("user_zipcode", commandMap.get("MEM_USER_ZIPCODE"));
		mv.addObject("user_ziburn", commandMap.get("MEM_USER_ZIBUNADDR"));
		mv.addObject("user_load", commandMap.get("MEM_USER_LOADADDR"));
		mv.addObject("user_detail", commandMap.get("MEM_USER_DETAILADDR"));
		mv.addObject("birth_year", birth_year);
		mv.addObject("birth_month", birth_month);
		mv.addObject("birth_day", birth_day);

		return mv;
	}

	@RequestMapping(value = "/member/infodelete.tea")
	public ModelAndView infodelete(CommandMap commandMap, HttpServletRequest request) throws Exception {
		request.getSession().getAttribute("NOSession");
		commandMap.put("MEM_USER_NO", request.getSession().getAttribute("NOSession"));
		// System.out.println("컨트롤러에서 여기까지 오나?");
		ModelAndView mv = new ModelAndView("/member/user/pass/byebye");
		infoService.infoDelete(commandMap.getMap());
		// System.out.println("컨트롤러에서 여기까지 오나?22 ");
		return mv;
	}

	@RequestMapping(value = "/member/info.tea")
	public ModelAndView MyInfo(CommandMap commandMap, HttpServletRequest request) throws Exception {
		request.getSession().getAttribute("NOSession");
		commandMap.put("MEM_USER_NO", request.getSession().getAttribute("NOSession"));

		ModelAndView mv = new ModelAndView();
		Map<String, Object> map = infoService.MyInfo(commandMap.getMap());
		mv.addObject("map", map);

		if (commandMap.get("password").equals(map.get("MEM_USER_PASSWORD"))) {
			ModelAndView mv1 = new ModelAndView("/member/user/info/info");
			Map<String, Object> check = infoService.memberCheck(commandMap.getMap());

			String birth_year = (String) check.get("MEM_USER_BIRTH").toString().substring(0, 4);
			String birth_month = (String) check.get("MEM_USER_BIRTH").toString().substring(4, 6);
			String birth_day = (String) check.get("MEM_USER_BIRTH").toString().substring(6, 8);

			System.out.println("생년 월일이 나오나 봅시다 " + birth_year + " / " + birth_month + " / " + birth_day);
			mv1.addObject("birth_year", birth_year);
			mv1.addObject("birth_month", birth_month);
			mv1.addObject("birth_day", birth_day);
			mv1.addObject("map", map);
			mv1.addObject("check", check);
			return mv1;
		} else {
			ModelAndView mv2 = new ModelAndView("/member/user/pass/fff");

			return mv2;
		}
	}

	@Resource
	private JavaMailSender mailSender;

	@RequestMapping(value = "/member/chekEmail.tea")
	public ModelAndView chekEmail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");

		Map<String, Object> find_email = memberUserService.select_check_email(commandMap.getMap());

		// System.out.println(commandMap.get("inputUserEmail"));
		String keySet = RandomStringUtils.randomAlphanumeric(8);
		String setForm = "khacademy@gmail.com";
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

	@Resource(name = "teaDealService")
	private TeaDealService teaDealService;

	@RequestMapping(value = "/member/likeList.tea")
	public ModelAndView likeList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("member/user/list/likeList");
		commandMap.put("MEM_USER_NO", commandMap.get("NOSession"));

		Map<String, Object> like = memberUserService.likeSelect(commandMap.getMap());

		String likeStr = (String) like.get("MEM_LIKE_DEAL");
		String[] likeNOList = likeStr.split(" ");

		List<Map<String, Object>> likeList = new ArrayList<Map<String, Object>>();

		for (int i = 0; i < likeNOList.length; i++) {
			commandMap.put("DEAL_NO", likeNOList[i]);
			Map<String, Object> temp = teaDealService.selectTeaDealDetail(commandMap.getMap());
			likeList.add(temp);
		}

		return mv;
	}

}
