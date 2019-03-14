package Dot_tea.admin.controller;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import Dot_tea.admin.service.ComManagementService;
import Dot_tea.setting.CommandMap;

@Controller
public class ComManagementController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "c_mService")
	private ComManagementService c_mService;

	// 리스트
	@RequestMapping(value = "/admin/CompanyList.tea")
	public ModelAndView c_mList(Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin/adminMain/AdminMain");

		int adminCode = 2;
		mv.addObject("adminCode", adminCode);
		return mv;
	}

	@RequestMapping(value = "/admin/selectCompanyList.tea")
	public ModelAndView selectc_mList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");

		List<Map<String, Object>> list = c_mService.c_mList(commandMap.getMap());
		mv.addObject("list", list);
		if (list.size() > 0) {
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		} else {
			mv.addObject("TOTAL", 0);
		}

		return mv;
	}

	// 글 상세보기
	@RequestMapping(value = "/admin/CompanyView.tea")
	public ModelAndView c_mView(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin/company/CompanyView");

		Map<String, Object> map = c_mService.c_mView(commandMap.getMap());
		mv.addObject("map", map);

		return mv;
	}

	// 글 수정 폼
	@RequestMapping(value = "/admin/openCompanyModify.tea")
	public ModelAndView openc_mUpdate(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin/company/CompanyModify");

		Map<String, Object> map = c_mService.c_mView(commandMap.getMap());
		mv.addObject("map", map);

		return mv;
	}

	// 글 수정
	@RequestMapping(value = "/admin/CompanyModify.tea")
	public ModelAndView c_mUpdate(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/CompanyView.tea");

		c_mService.c_mUpdate(commandMap.getMap());

		mv.addObject("MEM_COM_NO", commandMap.get("MEM_COM_NO"));

		return mv;
	}

	// 글 삭제
	@RequestMapping(value = "/admin/CompanyDelete.tea")
	public ModelAndView c_mDelete(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/CompanyList.tea");

		c_mService.c_mDelete(commandMap.getMap());

		return mv;
	}

}
