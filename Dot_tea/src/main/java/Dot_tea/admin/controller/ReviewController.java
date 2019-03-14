package Dot_tea.admin.controller;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import Dot_tea.admin.service.ReviewService;
import Dot_tea.setting.CommandMap;

@Controller
public class ReviewController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "reviewService")
	private ReviewService reviewService;

	// 리스트
	@RequestMapping(value = "/admin/ReviewList.tea")
	public ModelAndView reviewList(Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin/review/ReviewList");

		return mv;
	}

	@RequestMapping(value = "/admin/selectReviewList.tea")
	public ModelAndView selectReviewList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");

		List<Map<String, Object>> list = reviewService.reviewList(commandMap.getMap());
		mv.addObject("list", list);
		if (list.size() > 0) {
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		} else {
			mv.addObject("TOTAL", 0);
		}

		return mv;
	}

	// 글 상세보기
	@RequestMapping(value = "/admin/ReviewView.tea")
	public ModelAndView reviewView(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin/review/ReviewView");

		Map<String, Object> map = reviewService.reviewView(commandMap.getMap());
		mv.addObject("map", map);

		return mv;
	}

}
