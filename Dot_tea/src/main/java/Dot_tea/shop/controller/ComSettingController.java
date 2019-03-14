package Dot_tea.shop.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import Dot_tea.setting.CommandMap;
import Dot_tea.shop.service.ComSettingService;

@Controller
public class ComSettingController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "comsettingService")
	private ComSettingService comsettingService;

	@RequestMapping(value = "/com_setting/settingDetail.tea")
	public ModelAndView openBoardDetail(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/member/user/pass/checkForm");
		// ModelAndView mv = new ModelAndView("/member/com/com_setting/comsetting");

		Map<String, Object> map = comsettingService.comSettingView(commandMap.getMap(), request);
		mv.addObject("map", map);

		return mv;
	}

	@RequestMapping(value = "/com_setting/opensettingUpdate.tea")
	public ModelAndView openBoardUpdate(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/member/com/com_setting/comsettingForm");

		System.out.println("MEM_COM_NO" + request.getSession().getAttribute("NOSession"));
		commandMap.put("MEM_COM_NO", request.getSession().getAttribute("NOSession"));

		Map<String, Object> map = comsettingService.comSettingView(commandMap.getMap(), request);
		mv.addObject("map", map);

		return mv;
	}

	@RequestMapping(value = "/com_setting/updateSetting.tea")
	public ModelAndView updateBoard(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/member/com/com_setting/comsetting");

		commandMap.put("MEM_COM_NO", request.getSession().getAttribute("NOSession"));
		comsettingService.comSettingupdate(commandMap.getMap(), request);
		mv.addObject("MEM_COM_NO", commandMap.get("MEM_COM_NO"));

		Map<String, Object> map = comsettingService.comSettingView(commandMap.getMap(), request);
		mv.addObject("map", map);

		return mv;
	}

	@RequestMapping(value = "/com_setting/deleteCheck.tea")
	public ModelAndView settingDelete(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/member/com/com_setting/comsettingdelete");
		Map<String, Object> map = comsettingService.comSettingView(commandMap.getMap(), request);
		mv.addObject("map", map);

		return mv;
	}

	@RequestMapping(value = "/com_setting/deleteSetting.tea")
	public ModelAndView deleteBoard(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/shop/Mainpage.tea");

		comsettingService.comSettingdelete(commandMap.getMap());

		return mv;
	}

	@RequestMapping(value = "/com_setting/ck_Com_Password.tea")
	public ModelAndView ck_Com_Password(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();

		System.out.println("MEM_COM_NO" + request.getSession().getAttribute("NOSession"));
		commandMap.put("MEM_COM_NO", request.getSession().getAttribute("NOSession"));

		Map<String, Object> map = comsettingService.comSettingView(commandMap.getMap(), request);
		mv.addObject("map", map);

		if (commandMap.get("password").equals(map.get("MEM_COM_PASSWORD"))) {
			System.out.println("dir;emfdjdhsidkdkdkdkdkdkkd");
			ModelAndView mv1 = new ModelAndView("redirect:/com_setting/opensettingUpdate.tea");

			mv1.addObject("check", "1");
			return mv1;
		} else {
			ModelAndView mv2 = new ModelAndView("/member/user/pass/fff");

			return mv2;
		}
	}
}
