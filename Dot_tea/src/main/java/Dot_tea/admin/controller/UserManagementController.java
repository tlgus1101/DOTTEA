package Dot_tea.admin.controller;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import Dot_tea.admin.service.UserManagementService;
import Dot_tea.setting.CommandMap;

@Controller
public class UserManagementController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "u_mService")
	private UserManagementService u_mService;

	// 리스트
	@RequestMapping(value = "/admin/UserList.tea")
	public ModelAndView u_mList(Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin/user/UserList");
		

		return mv;
	}

	
	@RequestMapping(value = "/admin/selectUserList.tea")
	public ModelAndView selectu_mList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");

		List<Map<String, Object>> list = u_mService.u_mList(commandMap.getMap());
		mv.addObject("list", list);
		if (list.size() > 0) {
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		} else {
			mv.addObject("TOTAL", 0);
		}

		return mv;
	}


	// 글 상세보기
	@RequestMapping(value = "/admin/UserView.tea")
	public ModelAndView u_mView(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin/user/UserView");

		Map<String, Object> map = u_mService.u_mView(commandMap.getMap());
		mv.addObject("map", map);
		
		return mv;
	}

	// 글 수정 폼
	@RequestMapping(value = "/admin/openUserModify.tea")
	public ModelAndView openu_mUpdate(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin/user/UserModify");

		Map<String, Object> map = u_mService.u_mView(commandMap.getMap());
		mv.addObject("map", map);

		return mv;
	}

	// 글 수정
	@RequestMapping(value = "/admin/UserModify.tea")
	public ModelAndView u_mUpdate(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/UserView.tea");

		u_mService.u_mUpdate(commandMap.getMap());

		mv.addObject("MEM_USER_NO", commandMap.get("MEM_USER_NO"));

		return mv;
	}

	// 글 삭제
	@RequestMapping(value = "/admin/UserDelete.tea")
	public ModelAndView u_mDelete(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/UserList.tea");

		u_mService.u_mDelete(commandMap.getMap());

		return mv;
	}

}
