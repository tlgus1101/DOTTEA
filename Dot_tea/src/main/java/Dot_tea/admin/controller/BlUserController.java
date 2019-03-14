package Dot_tea.admin.controller;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import Dot_tea.admin.service.BlComService;
import Dot_tea.admin.service.BlUserService;
import Dot_tea.admin.service.ComManagementService;
import Dot_tea.setting.CommandMap;

@Controller
public class BlUserController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "bluserService")
	private BlUserService bluserService;

	// ∏ÆΩ∫∆Æ
	@RequestMapping(value = "/admin/BlUserList.tea")
	public ModelAndView bluserList(Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin/adminMain/AdminMain");

		int adminCode = 3;

		mv.addObject("adminCode", adminCode);

		return mv;
	}

	@RequestMapping(value = "/admin/selectBlUserList.tea")
	public ModelAndView selectBlUserList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");

		List<Map<String, Object>> list = bluserService.bluserList(commandMap.getMap());
		mv.addObject("list", list);
		if (list.size() > 0) {
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		} else {
			mv.addObject("TOTAL", 0);
		}

		return mv;
	}

	@RequestMapping(value = "/admin/BlUserPoliceList.tea")
	public ModelAndView bluserPoliceList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin/blackUser/BlackPoliceList");

		List<Map<String, Object>> list = bluserService.bluserPoliceList(commandMap.getMap());
		mv.addObject("list", list);

		mv.addObject("MEM_USER_NO", commandMap.get("MEM_USER_NO"));

		return mv;
	}

	// ±€ ªÛºº∫∏±‚
	@RequestMapping(value = "/admin/BlUserView.tea")
	public ModelAndView bluserView(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin/blackUser/BlackView");

		Map<String, Object> map = bluserService.bluserView(commandMap.getMap());
		mv.addObject("map", map);

		return mv;
	}

	// ±€ ºˆ¡§ ∆˚
	@RequestMapping(value = "/admin/openBlUserModify.tea")
	public ModelAndView openbluserUpdate(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin/blackUser/BlackModify");

		Map<String, Object> map = bluserService.bluserView(commandMap.getMap());
		mv.addObject("map", map);

		return mv;
	}

	// ±€ ºˆ¡§
	@RequestMapping(value = "/admin/BlUserModify.tea")
	public ModelAndView bluserUpdate(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/BlUserView.tea");

		bluserService.bluserUpdate(commandMap.getMap());

		mv.addObject("MEM_USER_NO", commandMap.get("MEM_USER_NO"));

		return mv;
	}

	// ±€ ªË¡¶
	@RequestMapping(value = "/admin/BlUserDelete.tea")
	public ModelAndView bluserDelete(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/BlUserList.tea");

		bluserService.bluserDelete(commandMap.getMap());

		return mv;
	}

}
