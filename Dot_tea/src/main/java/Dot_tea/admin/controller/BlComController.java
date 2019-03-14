package Dot_tea.admin.controller;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import Dot_tea.admin.service.BlComService;
import Dot_tea.admin.service.ComManagementService;
import Dot_tea.setting.CommandMap;

@Controller
public class BlComController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "blcomService")
	private BlComService blcomService;

	// 리스트
	@RequestMapping(value = "/admin/BlComList.tea")
	public ModelAndView blcomList(Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin/adminMain/AdminMain");

		int adminCode = 4;

		mv.addObject("adminCode", adminCode);
		return mv;
	}

	@RequestMapping(value = "/admin/selectBlComList.tea")
	public ModelAndView selectBlComList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");

		List<Map<String, Object>> list = blcomService.blcomList(commandMap.getMap());
		mv.addObject("list", list);
		if (list.size() > 0) {
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		} else {
			mv.addObject("TOTAL", 0);
		}

		return mv;
	}

	@RequestMapping(value = "/admin/BlComPoliceList.tea")
	public ModelAndView blcomPoliceList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin/blackCom/BlackPoliceList");

		List<Map<String, Object>> list = blcomService.blcomPoliceList(commandMap.getMap());
		mv.addObject("list", list);

		mv.addObject("MEM_COM_NO", commandMap.get("MEM_COM_NO"));

		return mv;
	}

	/*
	 * @RequestMapping(value = "/admin/selectBlComPoliceList.tea") public
	 * ModelAndView selectBlcomPoliceList(CommandMap commandMap) throws Exception {
	 * ModelAndView mv = new ModelAndView("jsonView");
	 * System.out.println(commandMap.getMap()); List<Map<String, Object>> list =
	 * blcomService.blcomPoliceList(commandMap.getMap()); mv.addObject("list",
	 * list);
	 * 
	 * mv.addObject("MEM_COM_NO", commandMap.get("MEM_COM_NO"));
	 * 
	 * return mv; }
	 */

	// 글 상세보기
	@RequestMapping(value = "/admin/BlComView.tea")
	public ModelAndView blcomView(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin/blackCom/BlackView");

		Map<String, Object> map = blcomService.blcomView(commandMap.getMap());
		mv.addObject("map", map);

		return mv;
	}

	// 글 수정 폼
	@RequestMapping(value = "/admin/openBlComModify.tea")
	public ModelAndView openblcomUpdate(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin/blackCom/BlackModify");

		Map<String, Object> map = blcomService.blcomView(commandMap.getMap());
		mv.addObject("map", map);

		return mv;
	}

	// 글 수정
	@RequestMapping(value = "/admin/BlComModify.tea")
	public ModelAndView blcomUpdate(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/BlComView.tea");

		blcomService.blcomUpdate(commandMap.getMap());

		mv.addObject("MEM_COM_NO", commandMap.get("MEM_COM_NO"));

		return mv;
	}

	// 글 삭제
	@RequestMapping(value = "/admin/BlComDelete.tea")
	public ModelAndView blcomDelete(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/BlComList.tea");

		blcomService.blcomDelete(commandMap.getMap());

		return mv;
	}

}
