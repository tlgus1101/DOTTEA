package Dot_tea.admin.controller;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import Dot_tea.admin.service.PoliceComService;
import Dot_tea.setting.CommandMap;

@Controller
public class PoliceComController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "policeComService")
	private PoliceComService policeComService;

	// 리스트
	@RequestMapping(value = "/admin/ReportComList.tea")
	public ModelAndView reportComList(Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin/policeCom/ReportComList");

		return mv;
	}

	@RequestMapping(value = "/admin/selectReportComList.tea")
	public ModelAndView selectReportComList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");

		policeComService.reportComDelete(commandMap.getMap());
		List<Map<String, Object>> list = policeComService.reportComList(commandMap.getMap());
		mv.addObject("list", list);
		if (list.size() > 0) {
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		} else {
			mv.addObject("TOTAL", 0);
		}

		return mv;
	}
	
	@RequestMapping(value = "/admin/ReportBlComList.tea")
	public ModelAndView reportBlComList(Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin/policeCom/ReportBlComList");

		return mv;
	}

	@RequestMapping(value = "/admin/selectReportBlComList.tea")
	public ModelAndView selectReportBlComList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");

		policeComService.reportComDelete(commandMap.getMap());
		List<Map<String, Object>> list = policeComService.reportBlComList(commandMap.getMap());
		mv.addObject("list", list);
		if (list.size() > 0) {
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		} else {
			mv.addObject("TOTAL", 0);
		}

		return mv;
	}

	// 글 상세보기
	@RequestMapping(value = "/admin/ReportComView.tea")
	public ModelAndView reportComView(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin/policeCom/ReportComView");

		Map<String, Object> map = policeComService.reportComView(commandMap.getMap());
		Map<String, Object> map2 = policeComService.reportComBView(commandMap.getMap());
		Map<String, Object> map3 = policeComService.c_mView(commandMap.getMap());

		if (map3 != null) {
			mv.addObject("map", map);
			return mv;

		} else {
			mv.addObject("map", map2);
			return mv;
		}
	}

	// 글 수정 폼
	@RequestMapping(value = "/admin/openComUpdateStatus2.tea")
	public ModelAndView openUpdateStatus2(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin/policeCom/ReportComUpdate");

		Map<String, Object> map = policeComService.reportComView(commandMap.getMap());
		mv.addObject("map", map);

		return mv;
	}

	// 거절
	@RequestMapping(value = "/admin/ComUpdateStatus2.tea")
	public ModelAndView refusalComUpdate2(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/ReportComView.tea");

		policeComService.updateStatus2(commandMap.getMap());

		mv.addObject("P_COM_NO", commandMap.get("P_COM_NO"));
		mv.addObject("MEM_COM_NO", commandMap.get("MEM_COM_NO"));

		return mv;
	}

	// 승인 상태 변경
	@RequestMapping(value = "/admin/ComUpdateStatus1.tea")
	public ModelAndView updateStatus1(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin/policeCom/ReportComCheck");

		Map<String, Object> map = policeComService.reportComView(commandMap.getMap());
		policeComService.updateStatus1(commandMap.getMap());
		mv.addObject("DEAL_NO", commandMap.get("DEAL_NO"));
		mv.addObject("map", map);
		return mv;
	}

	// 승인 상태 취소
	@RequestMapping(value = "/admin/ComCancelStatus1.tea")
	public ModelAndView refusalComUpdate1(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/reportComView.tea");

		Map<String, Object> map = policeComService.reportComView(commandMap.getMap());
		policeComService.cancelStatus1(commandMap.getMap());
		mv.addObject("P_COM_NO", commandMap.get("P_COM_NO"));
		mv.addObject("map", map);
		return mv;
	}

	// 승인 신고횟수 +1
	@RequestMapping(value = "/admin/ComUpdateApproval.tea")
	public ModelAndView updateApproval(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/ReportComList.tea");

		policeComService.updateApproval(commandMap.getMap());
		mv.addObject("P_COM_NO", commandMap.get("P_COM_NO"));
		mv.addObject("MEM_COM_NO", commandMap.get("MEM_COM_NO"));
		return mv;
	}

}
