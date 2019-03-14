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
import Dot_tea.shop.service.ShopService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class ShopController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "shopService")
	private ShopService shopService;

	@RequestMapping(value = "/shop/Main.tea")
	public ModelAndView openMainpage(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/main/main");

		return mv;
	}

	@RequestMapping(value = "/shop/Mainpage.tea")
	public ModelAndView openMypage(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/member/com/com_mypage");

		return mv;
	}

	@RequestMapping(value = "/shop/openBoardList.tea")
	public ModelAndView openBoardList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/member/com/comlist");
		commandMap.put("MEM_COM_ID",request.getSession().getAttribute("idSession"));
		Map<String, Object> resultMap = shopService.selectBoardList(commandMap.getMap());

		mv.addObject("paginationInfo", (PaginationInfo) resultMap.get("paginationInfo"));
		mv.addObject("list", resultMap.get("result"));

		return mv;
	}

	/*
	 * @RequestMapping(value="/shop/selectBoardList.tea") public ModelAndView
	 * selectBoardList(CommandMap commandMap) throws Exception{ ModelAndView mv =
	 * new ModelAndView("jsonView");
	 * 
	 * List<Map<String,Object>> list =
	 * shopService.selectBoardList(commandMap.getMap()); mv.addObject("list", list);
	 * if(list.size() > 0){ mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT")); }
	 * else{ mv.addObject("TOTAL", 0); }
	 * 
	 * return mv; }
	 */

	@RequestMapping(value = "/shop/openBoardWrite.tea")
	public ModelAndView openBoardWrite(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/member/com/comWrite");

		return mv;
	}

	@RequestMapping(value = "/shop/insertBoard.tea")
	public ModelAndView insertBoard(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/shop/openBoardList.tea");
		commandMap.put("MEM_COM_ID", request.getSession().getAttribute("idSession"));
		shopService.insertBoard(commandMap.getMap(), request);
		shopService.uploadimage(commandMap.getMap(), request);
		return mv;
	}

	@RequestMapping(value = "/shop/openBoardDetail.tea")
	public ModelAndView openBoardDetail(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/member/com/comDetail");

		Map<String, Object> map = shopService.selectBoardDetail(commandMap.getMap(), request);
		mv.addObject("map", map);

		return mv;
	}

	@RequestMapping(value = "/shop/openBoardUpdate.tea")
	public ModelAndView openBoardUpdate(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/member/com/comUpdate");

		Map<String, Object> map = shopService.selectBoardDetail(commandMap.getMap(), request);
		mv.addObject("map", map);

		return mv;
	}

	@RequestMapping(value = "/shop/updateBoard.tea")
	public ModelAndView updateBoard(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/shop/openBoardDetail.tea");

		shopService.updateBoard(commandMap.getMap(), request);
		mv.addObject("DEAL_NO", commandMap.get("DEAL_NO"));
		return mv;
	}

	@RequestMapping(value = "/shop/deleteBoard.tea")
	public ModelAndView deleteBoard(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/shop/openBoardList.tea");

		shopService.deleteBoard(commandMap.getMap());
		mv.addObject("MEM_COM_ID", commandMap.get("MEM_COM_ID"));

		return mv;
	}
}
