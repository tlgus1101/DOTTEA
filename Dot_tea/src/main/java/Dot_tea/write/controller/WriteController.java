package Dot_tea.write.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import Dot_tea.setting.CommandMap;
import Dot_tea.write.service.WriteService;

@Controller
public class WriteController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "writeService")
	private WriteService writeService;

	@RequestMapping(value = "/member/reviewlist.tea")
	public ModelAndView reviewlist(Map<String, Object> commandMap, HttpServletRequest request) throws Exception {
		String sessionVal = request.getSession().getAttribute("idSession").toString();
		System.out.println("세션 나와요?" + sessionVal);
		commandMap.put("idSession", sessionVal);

		ModelAndView mv = new ModelAndView("/member/user/list/reviewList");

		return mv;
	}

	@RequestMapping(value = "/member/reviewboard.tea")
	public ModelAndView reviewboard(CommandMap commandMap, HttpServletRequest request) throws Exception {
		String sessionVal = request.getSession().getAttribute("idSession").toString();
		System.out.println("id 세션 나와요?" + sessionVal);
		commandMap.put("idSession", sessionVal);

		String tkeyword = (String) commandMap.get("tkeyword");

		if (tkeyword != null) {
			ModelAndView mv2 = new ModelAndView("jsonView");

			commandMap.put("inputKeyword", "%" + tkeyword + "%");

			List<Map<String, Object>> reviewsearch = writeService.reviewSearchList(commandMap.getMap());
			mv2.addObject("review", reviewsearch);

			if (reviewsearch.size() > 0) {
				mv2.addObject("TOTAL", reviewsearch.get(0).get("TOTAL_COUNT"));
			} else {
				mv2.addObject("TOTAL", 0);
			}
			return mv2;
		} else {

			ModelAndView mv = new ModelAndView("jsonView");

			List<Map<String, Object>> reviewlist = writeService.reviewPagingList(commandMap.getMap());
			mv.addObject("review", reviewlist);
			if (reviewlist.size() > 0) {
				mv.addObject("TOTAL", reviewlist.get(0).get("TOTAL_COUNT"));
			} else {
				mv.addObject("TOTAL", 0);
			}

			return mv;
		}
	}

	@RequestMapping(value = "/member/qnalist.tea")
	public ModelAndView qnalist(Map<String, Object> commandMap, HttpServletRequest request) throws Exception {
		String sessionVal = request.getSession().getAttribute("idSession").toString();
		System.out.println("세션 나와요?" + sessionVal);
		commandMap.put("idSession", sessionVal);

		ModelAndView mv = new ModelAndView("/member/user/list/qnaList");
		return mv;
	}

	@RequestMapping(value = "/member/qnaboard.tea")
	public ModelAndView qnaboard(CommandMap commandMap, HttpServletRequest request) throws Exception {
		String sessionVal = request.getSession().getAttribute("idSession").toString();
		System.out.println("세션 나와요?" + sessionVal);
		commandMap.put("idSession", sessionVal);

		String tkeyword = (String) commandMap.get("tkeyword");
		if (tkeyword != null) {
			ModelAndView mv2 = new ModelAndView("jsonView");

			commandMap.put("inputKeyword", "%" + tkeyword + "%");

			List<Map<String, Object>> qnasearch = writeService.qnaSearchList(commandMap.getMap());
			mv2.addObject("qna", qnasearch);

			if (qnasearch.size() > 0) {
				mv2.addObject("TOTAL", qnasearch.get(0).get("TOTAL_COUNT"));
			} else {
				mv2.addObject("TOTAL", 0);
			}
			return mv2;
		} else {

			ModelAndView mv = new ModelAndView("jsonView");

			List<Map<String, Object>> qnalist = writeService.qnaPagingList(commandMap.getMap());
			mv.addObject("qna", qnalist);
			if (qnalist.size() > 0) {
				mv.addObject("TOTAL", qnalist.get(0).get("TOTAL_COUNT"));
			} else {
				mv.addObject("TOTAL", 0);
			}

			return mv;
		}
	}

	@RequestMapping(value = "/member/qnadetail.tea")
	public ModelAndView qnadetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/member/user/detail/qnaDetail");

		Map<String, Object> map = writeService.qnaBoardDetail(commandMap.getMap());
		mv.addObject("map", map);

		return mv;
	}

	@RequestMapping(value = "/member/reviewdetail.tea")
	public ModelAndView reviewdetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/member/user/detail/reviewDetail");

		Map<String, Object> map = writeService.reviewBoardDetail(commandMap.getMap());
		mv.addObject("map", map);

		return mv;
	}

	@RequestMapping(value = "/member/qnaupdate.tea")
	public ModelAndView qnaupdate_1(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/member/user/update/qnaUpdate");

		Map<String, Object> map = writeService.qnaBoardDetail(commandMap.getMap());
		mv.addObject("map", map);

		return mv;
	}

	@RequestMapping(value = "/member/updatefinQ.tea")
	public ModelAndView qnaupdate_2(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/member/qnadetail.tea");

		writeService.qnaUpdate(commandMap.getMap());
		mv.addObject("QA_NO", commandMap.get("QA_NO"));

		return mv;
	}

	@RequestMapping(value = "/member/qnadelete.tea")
	public ModelAndView qnadelete(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/member/qnalist.tea");

		writeService.qnaDelete(commandMap.getMap());

		return mv;
	}

	@RequestMapping(value = "/member/reviewupdate.tea")
	public ModelAndView reviewupdate_1(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/member/user/update/reviewUpdate");

		Map<String, Object> map = writeService.reviewBoardDetail(commandMap.getMap());
		mv.addObject("map", map);

		return mv;
	}

	@RequestMapping(value = "/member/updatefinR.tea")
	public ModelAndView reviewupdate_2(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/member/reviewdetail.tea");

		writeService.reviewUpdate(commandMap.getMap());
		mv.addObject("RE_NO", commandMap.get("RE_NO"));

		return mv;
	}

	@RequestMapping(value = "/member/reviewdelete.tea")
	public ModelAndView reviewdelete(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/member/reviewlist.tea");

		writeService.reviewDelete(commandMap.getMap());

		return mv;
	}
}
