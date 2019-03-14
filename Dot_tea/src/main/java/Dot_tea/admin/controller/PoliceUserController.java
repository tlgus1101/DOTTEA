package Dot_tea.admin.controller;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import Dot_tea.admin.service.PoliceUserService;
import Dot_tea.setting.CommandMap;

@Controller
public class PoliceUserController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "policeUserService")
	private PoliceUserService policeUserService;

	// 리스트
	@RequestMapping(value = "/admin/ReportUserList.tea")
	public ModelAndView reportUserList(Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin/policeUser/ReportUserList");

		return mv;
	}

	@RequestMapping(value = "/admin/selectReportUserList.tea")
	public ModelAndView selectReportUserList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");

		policeUserService.reportUserDelete(commandMap.getMap());
		List<Map<String, Object>> list = policeUserService.reportUserList(commandMap.getMap());

		mv.addObject("list", list);

		if (list.size() > 0) {

			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));

		} else {
			mv.addObject("TOTAL", 0);

		}

		return mv;

	}

	@RequestMapping(value = "/admin/ReportBlUserList.tea")
	public ModelAndView reportBlUserList(Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin/policeUser/ReportBlUserList");

		return mv;
	}

	@RequestMapping(value = "/admin/selectReportBlUserList.tea")
	public ModelAndView selectReportBlUserList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");

		policeUserService.reportUserDelete(commandMap.getMap());

		List<Map<String, Object>> list = policeUserService.reportBlUserList(commandMap.getMap());
		mv.addObject("list", list);

		if (list.size() > 0) {

			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));

		} else {
			mv.addObject("TOTAL", 0);

		}

		return mv;

	}

	// 글 상세보기
	@RequestMapping(value = "/admin/ReportUserView.tea")
	public ModelAndView reportUserView(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin/policeUser/ReportUserView");

		Map<String, Object> map2 = policeUserService.reportUserBView(commandMap.getMap());
		Map<String, Object> map = policeUserService.reportUserView(commandMap.getMap());
		Map<String, Object> map3 = policeUserService.u_mView(commandMap.getMap());

		if (map3 != null) {
			mv.addObject("map", map);
			return mv;

		} else {
			mv.addObject("map", map2);
			return mv;
		}

	}

	// 글 수정 폼
	@RequestMapping(value = "/admin/openUserUpdateStatus2.tea")
	public ModelAndView openUpdateStatus2(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin/policeUser/ReportUserUpdate");

		Map<String, Object> map = policeUserService.reportUserView(commandMap.getMap());
		mv.addObject("map", map);

		return mv;
	}

	// 거절
	@RequestMapping(value = "/admin/UserUpdateStatus2.tea")
	public ModelAndView refusalUserUpdate2(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/ReportUserView.tea");

		policeUserService.updateStatus2(commandMap.getMap());

		mv.addObject("P_USER_NO", commandMap.get("P_USER_NO"));
		mv.addObject("MEM_USER_NO", commandMap.get("MEM_USER_NO"));

		return mv;
	}

	// 승인 상태 변경
	@RequestMapping(value = "/admin/UserUpdateStatus1.tea")
	public ModelAndView updateStatus1(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin/policeUser/ReportUserCheck");

		Map<String, Object> map = policeUserService.reportUserView(commandMap.getMap());
		policeUserService.updateStatus1(commandMap.getMap());
		mv.addObject("RE_NO", commandMap.get("RE_NO"));
		mv.addObject("map", map);
		return mv;
	}

	// 승인 상태 취소
	@RequestMapping(value = "/admin/UserCancelStatus1.tea")
	public ModelAndView refusalUserUpdate1(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/ReportUserView.tea");

		Map<String, Object> map = policeUserService.reportUserView(commandMap.getMap());
		policeUserService.cancelStatus1(commandMap.getMap());
		mv.addObject("P_USER_NO", commandMap.get("P_USER_NO"));
		mv.addObject("map", map);
		return mv;
	}

	// 승인 신고횟수 +1
	@RequestMapping(value = "/admin/UserUpdateApproval.tea")
	public ModelAndView updateApproval(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/ReportUserList.tea");

		policeUserService.updateApproval(commandMap.getMap());
		mv.addObject("P_USER_NO", commandMap.get("P_USER_NO"));
		mv.addObject("MEM_USER_NO", commandMap.get("MEM_USER_NO"));
		return mv;
	}

}
