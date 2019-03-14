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
import Dot_tea.shop.service.Com_ReviewService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class Com_ReviewController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "com_reviewService")
	private Com_ReviewService com_reviewService;

	@RequestMapping(value = "/com_re/openBoardList.tea")
	public ModelAndView openBoardList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/member/com/com_review/com_reList");
		Map<String, Object> resultMap = com_reviewService.reviewCompany(commandMap.getMap());

		mv.addObject("paginationInfo", (PaginationInfo) resultMap.get("paginationInfo"));
		mv.addObject("list", resultMap.get("result"));
		mv.addObject("MEM_COM_ID", commandMap.get("MEM_COM_ID"));

		return mv;
	}

	@RequestMapping(value = "/com_re/policeWrite.tea")
	public ModelAndView openBoardWrite(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/member/com/com_review/PolicewriteForm");
		Map<String, Object> map = com_reviewService.PoliceReviewDE(commandMap.getMap());
		mv.addObject("RE_NO", commandMap.get("RE_NO"));
		mv.addObject("map", map);
		return mv;
	}

	@RequestMapping(value = "/com_re/policeinsert.tea")
	public ModelAndView QnAinsert(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/teaDeal/starts.tea");

		com_reviewService.reviewPolice(commandMap.getMap());
		mv.addObject("RE_NO", commandMap.get("RE_NO"));
		mv.addObject("MEM_USER_NO", commandMap.get("MEM_USER_NO"));
		mv.addObject("DEAL_NO", commandMap.get("DEAL_NO"));
		return mv;
	}

	/*
	 * @RequestMapping(value="/com_re/selectBoardList.tea") public ModelAndView
	 * selectBoardList(CommandMap commandMap) throws Exception{ ModelAndView mv =
	 * new ModelAndView("jsonView");
	 * 
	 * List<Map<String,Object>> list =
	 * com_reviewService.reviewBoardList(commandMap.getMap()); mv.addObject("list",
	 * list); if(list.size() > 0){ mv.addObject("TOTAL",
	 * list.get(0).get("TOTAL_COUNT")); } else{ mv.addObject("TOTAL", 0); }
	 * 
	 * return mv; }
	 */

}
