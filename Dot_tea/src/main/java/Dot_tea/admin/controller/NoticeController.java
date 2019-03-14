package Dot_tea.admin.controller;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.log4j.Logger;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import Dot_tea.admin.service.NoticeService;
import Dot_tea.setting.CommandMap;

@Controller
public class NoticeController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "noticeService")
	private NoticeService noticeService;

	// 리스트
	@RequestMapping(value = "/admin/NoticeList.tea")
	public ModelAndView NoticeList(Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin/notice/NoticeList");

		return mv;
	}

	
	@RequestMapping(value = "/admin/selectNoticeList.tea")
	public ModelAndView selectNoticeList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");

		List<Map<String, Object>> list = noticeService.noticeList(commandMap.getMap());
		mv.addObject("list", list);
		if (list.size() > 0) {
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		} else {
			mv.addObject("TOTAL", 0);
		}

		return mv;
	}

	@RequestMapping(value = "/admin/testMapArgumentResolver.tea")
	public ModelAndView testMapArgumentResolver(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("");

		if (commandMap.isEmpty() == false) {
			Iterator<Entry<String, Object>> iterator = commandMap.getMap().entrySet().iterator();
			Entry<String, Object> entry = null;
			while (iterator.hasNext()) {
				entry = iterator.next();
				log.debug("key : " + entry.getKey() + ", value : " + entry.getValue());
			}
		}
		return mv;
	}

	// 글쓰기 폼
	@RequestMapping(value = "/admin/openNoticeWrite.tea")
	public ModelAndView openBoardWrite(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/admin/notice/NoticeWrite");

		return mv;
	}

	// 글작성
	@RequestMapping(value = "/admin/NoticeWrite.tea")
	public ModelAndView noticeWrite(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/NoticeList.tea");

		noticeService.noticeWrite(commandMap.getMap(), request);
		noticeService.noticeFileUpdate(commandMap.getMap(), request);
		return mv;
	}

	// 글 상세보기
	@RequestMapping(value = "/admin/NoticeView.tea")
	public ModelAndView noticeView(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin/notice/NoticeView");

		Map<String, Object> map = noticeService.noticeView(commandMap.getMap());
		mv.addObject("map", map);

		return mv;
	}

	// 글 수정 폼
	@RequestMapping(value = "/admin/openNoticeUpdate.tea")
	public ModelAndView openNoticeUpdate(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin/notice/NoticeUpdate");

		Map<String, Object> map = noticeService.noticeView(commandMap.getMap());
		mv.addObject("map", map);

		return mv;
	}

	// 글 수정
	@RequestMapping(value = "/admin/NoticeUpdate.tea")
	public ModelAndView noticeUpdate(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/NoticeView.tea");

		noticeService.noticeUpdate(commandMap.getMap(), request);

		mv.addObject("N_NO", commandMap.get("N_NO"));

		return mv;
	}

	// 글 삭제
	@RequestMapping(value = "/admin/NoticeDelete.tea")
	public ModelAndView noticeDelete(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/NoticeList.tea");

		noticeService.noticeDelete(commandMap.getMap());

		return mv;
	}

}
