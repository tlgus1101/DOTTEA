package Dot_tea.shop.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import Dot_tea.setting.CommandMap;
import Dot_tea.shop.service.Com_OrdersService;

@Controller
public class Com_OrdersController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "com_ordersService")
	private Com_OrdersService com_ordersService;

	@RequestMapping(value = "/com_speed/openBoardList.tea")
	public ModelAndView openSpeed(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/member/com/com_speed/sweetTrackerAPI");
		return mv;
	}

	@RequestMapping(value = "/com_or/openBoardList.tea")
	public ModelAndView openBoardList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/member/com/com_orders/com_orList");

		String tkeyword = (String) commandMap.get("tkeyword");
		String searchOp = (String) commandMap.get("searchOp");
		String tkeyword2 = (String) commandMap.get("tkeyword2");
		String searchOp2 = (String) commandMap.get("searchOp2");
		String tkeyword3 = (String) commandMap.get("tkeyword3");
		String searchOp3 = (String) commandMap.get("searchOp3");
		System.out.println("tkeyword " + tkeyword + tkeyword2 + tkeyword3);
		System.out.println("searchOp " + searchOp + searchOp2 + searchOp3);

		if (tkeyword != null) {
			ModelAndView mv2 = new ModelAndView("jsonView");

			if (searchOp.equals("0")) { // 신규상품 이름 검색

				commandMap.put("inputKeyword", "%" + tkeyword + "%");
				List<Map<String, Object>> listSchName = com_ordersService.ordersBoardListSchName(commandMap.getMap());

				mv2.addObject("list", listSchName);
			} else if (searchOp.equals("1")) { // 신규상품 번호 검색

				commandMap.put("inputKeyword", "%" + tkeyword + "%");
				List<Map<String, Object>> listSchPhone = com_ordersService.ordersBoardListSchPhone(commandMap.getMap());

				mv2.addObject("list3", listSchPhone);
			}
		}

		if (tkeyword2 != null) {
			ModelAndView mv2 = new ModelAndView("jsonView");

			if (searchOp2.equals("0")) { // 상품취소 이름 검색

				commandMap.put("inputKeyword", "%" + tkeyword + "%");
				List<Map<String, Object>> listSchName2 = com_ordersService.ordersBoardList2SchName(commandMap.getMap());

				mv2.addObject("list", listSchName2);
			} else if (searchOp2.equals("1")) { // 상품취소 번호 검색

				commandMap.put("inputKeyword", "%" + tkeyword + "%");
				List<Map<String, Object>> listSchPhone2 = com_ordersService
						.ordersBoardList2SchPhone(commandMap.getMap());

				mv2.addObject("list1", listSchPhone2);
			}
		}

		if (tkeyword3 != null) {
			ModelAndView mv2 = new ModelAndView("jsonView");

			if (searchOp3.equals("0")) { // 반품,교환 이름 검색

				commandMap.put("inputKeyword", "%" + tkeyword + "%");
				List<Map<String, Object>> listSchName3 = com_ordersService.ordersBoardList3SchName(commandMap.getMap());

				mv2.addObject("list", listSchName3);
			} else if (searchOp3.equals("1")) { // 반품,교환 번호 검색

				commandMap.put("inputKeyword", "%" + tkeyword + "%");
				List<Map<String, Object>> listSchPhone3 = com_ordersService
						.ordersBoardList3SchPhone(commandMap.getMap());

				mv2.addObject("list2", listSchPhone3);
			}
		}

		List<Map<String, Object>> list = com_ordersService.orderBoardList(commandMap.getMap());
		List<Map<String, Object>> list1 = com_ordersService.orderBoardList2(commandMap.getMap());
		List<Map<String, Object>> list2 = com_ordersService.orderBoardList3(commandMap.getMap());
		List<Map<String, Object>> list3 = com_ordersService.orderBoardList4(commandMap.getMap());

		mv.addObject("list", list);
		mv.addObject("list1", list1);
		mv.addObject("list2", list2);
		mv.addObject("list3", list3);

		return mv;
	}

//	@RequestMapping(value = "/com_or/openBoardList.tea")
//	public ModelAndView openBoardList(CommandMap commandMap) throws Exception {
//		ModelAndView mv = new ModelAndView("/member/com/com_orders/com_orList");
//
//		List<Map<String, Object>> list = com_ordersService.orderBoardList(commandMap.getMap());
//		List<Map<String, Object>> list1 = com_ordersService.orderBoardList2(commandMap.getMap());
//		List<Map<String, Object>> list2 = com_ordersService.orderBoardList3(commandMap.getMap());
//		List<Map<String, Object>> list3 = com_ordersService.orderBoardList4(commandMap.getMap());
//
//		mv.addObject("list", list);
//		mv.addObject("list1", list1);
//		mv.addObject("list2", list2);
//		mv.addObject("list3", list3);
//
//		return mv;
//	}

	@RequestMapping(value = "/com_or/selectBoardList.tea")
	public ModelAndView selectBoardList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");

		List<Map<String, Object>> list = com_ordersService.orderBoardList(commandMap.getMap());
		mv.addObject("list", list);
		if (list.size() > 0) {
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		} else {
			mv.addObject("TOTAL", 0);
		}

		return mv;
	}

	@RequestMapping(value = "/com_or/openBoardDetail.tea")
	public ModelAndView openBoardDetail(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/member/com/com_orders/com_orDetail");

		commandMap.put("MEM_COM_NO", request.getSession().getAttribute("NOSession"));

		Map<String, Object> map = com_ordersService.orderBoardDetail(commandMap.getMap(), request);
		Map<String, Object> map1 = com_ordersService.orderBoardDetailC(commandMap.getMap(), request);

		mv.addObject("map", map);
		mv.addObject("map1", map1);
		mv.addObject("DEAL_NO", commandMap.get("DEAL_NO"));
		mv.addObject("OR_NO", commandMap.get("OR_NO"));
		mv.addObject("ORDER_DETAIL_NO", commandMap.get("ORDER_DETAIL_NO"));
		mv.addObject("MEM_COM_NO", commandMap.get("MEM_COM_NO"));
		return mv;
	}

	@RequestMapping(value = "/com_or/updateBoard.tea")
	public ModelAndView updateBoard(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/com_or/openBoardDetail.tea");
		commandMap.put("MEM_COM_NO", request.getSession().getAttribute("NOSession"));
		com_ordersService.updateBoard(commandMap.getMap());

		mv.addObject("DEAL_NO", commandMap.get("DEAL_NO"));
		mv.addObject("OR_NO", commandMap.get("OR_NO"));
		mv.addObject("ORDER_DETAIL_NO", commandMap.get("ORDER_DETAIL_NO"));
		mv.addObject("MEM_COM_NO", commandMap.get("MEM_COM_NO"));

		return mv;
	}

	@RequestMapping(value = "/com_or/orderBoardWrite.tea")
	public ModelAndView openBoardWrite(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/member/com/com_orders/com_orDelivery");
		commandMap.put("MEM_COM_NO", request.getSession().getAttribute("NOSession"));
		Map<String, Object> map = com_ordersService.orderBoardDetail(commandMap.getMap(), request);
		/*
		 * Map<String,Object> map1 =
		 * com_ordersService.orderBoardDetailC(commandMap.getMap(), request);
		 */
		mv.addObject("map", map);
		/* mv.addObject("map1", map1); */
		mv.addObject("MEM_COM_NO", request.getSession().getAttribute("NOSession"));
		mv.addObject("OR_NO", commandMap.get("OR_NO"));
		mv.addObject("ORDER_DETAIL_NO", commandMap.get("ORDER_DETAIL_NO"));

		return mv;
	}

	@RequestMapping(value = "/com_or/insertBoard.tea")
	public ModelAndView insertBoard(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/com_or/openBoardList.tea");
		commandMap.put("MEM_COM_NO", request.getSession().getAttribute("NOSession"));
		com_ordersService.orderinsert(commandMap.getMap());
		com_ordersService.updateBoard2(commandMap.getMap());
		mv.addObject("MEM_COM_NO", commandMap.get("MEM_COM_NO"));
		return mv;
	}

	@RequestMapping(value = "/com_or/updateBoard7.tea")
	public ModelAndView updateBoard7(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/com_or/openBoardDetail.tea");

		com_ordersService.updateBoard7(commandMap.getMap());
		mv.addObject("DEAL_NO", commandMap.get("DEAL_NO"));
		mv.addObject("OR_NO", commandMap.get("OR_NO"));
		mv.addObject("ORDER_DETAIL_NO", commandMap.get("ORDER_DETAIL_NO"));
		mv.addObject("MEM_COM_NO", commandMap.get("MEM_COM_NO"));
		return mv;
	}

	@RequestMapping(value = "/com_or/updateBoard8.tea")
	public ModelAndView updateBoard8(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/com_or/openBoardDetail.tea");

		com_ordersService.updateBoard8(commandMap.getMap());
		mv.addObject("DEAL_NO", commandMap.get("DEAL_NO"));
		mv.addObject("OR_NO", commandMap.get("OR_NO"));
		mv.addObject("ORDER_DETAIL_NO", commandMap.get("ORDER_DETAIL_NO"));
		mv.addObject("MEM_COM_NO", commandMap.get("MEM_COM_NO"));
		return mv;
	}

	@RequestMapping(value = "/com_or/updateBoard9.tea")
	public ModelAndView updateBoard9(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/com_or/openBoardDetail.tea");

		com_ordersService.updateBoard9(commandMap.getMap());
		mv.addObject("DEAL_NO", commandMap.get("DEAL_NO"));
		mv.addObject("OR_NO", commandMap.get("OR_NO"));
		mv.addObject("ORDER_DETAIL_NO", commandMap.get("ORDER_DETAIL_NO"));
		mv.addObject("MEM_COM_NO", commandMap.get("MEM_COM_NO"));
		return mv;
	}

	@RequestMapping(value = "/com_or/com_Month.tea")
	public ModelAndView MonthTotal(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/member/com/com_orders/totalMonth");
		// List<Map<String, Object>> list = calcService.calcList(commandMap.getMap());
		Date date = new Date();
		Calendar cal = Calendar.getInstance();

		mv.addObject("yearC", cal.get(Calendar.YEAR));

		return mv;
	}

	@RequestMapping(value = "/com_or/com_MonthAjax.tea")
	public ModelAndView com_MonthAjax(CommandMap commandMap, HttpSession session, HttpServletRequest request)
			throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		request.getSession().getAttribute("NOSession");

		commandMap.put("MEM_COM_NO", request.getSession().getAttribute("NOSession"));

		if (commandMap.get("monC").equals("undefined")) {
			Date date = new Date();
			Calendar cal = Calendar.getInstance();

			if (cal.MONTH == 0) {
				commandMap.put("Month_Date", (cal.get(Calendar.YEAR) - 1) + "/12");

			} else {
				String dt = cal.YEAR + "/" + cal.MONTH;
				System.out.println("date1 ....: " + cal.get(Calendar.YEAR) + " " + cal.get(Calendar.MONTH));
				String mon = "";
				if (cal.get(Calendar.MONTH) < 10) {
					mon = "0" + cal.get(Calendar.MONTH);
				}

				commandMap.put("Month_Date", cal.get(Calendar.YEAR) + "/" + mon);
			}

		} else {

			String year = (String) commandMap.get("yearC");
			String month = (String) commandMap.get("monC");
			commandMap.put("Month_Date", year + "/" + month);
		}

		List<Map<String, Object>> list = com_ordersService.MonthTotal(commandMap.getMap());
		System.out.println("list" + list);
		mv.addObject("list", list);
		if (list != null)
			mv.addObject("TOTAL", list.size());
		else if (list == null)
			mv.addObject("TOTAL", 0);

		mv.addObject("list", list);
		return mv;
	}

	@RequestMapping(value = "/com_or/com_Day.tea")
	public ModelAndView DayTotal(CommandMap commandMap, HttpSession session, HttpServletRequest request)
			throws Exception {
		ModelAndView mv = new ModelAndView("/member/com/com_orders/totalDay");
		request.getSession().getAttribute("NOSession");
		commandMap.put("MEM_COM_NO", request.getSession().getAttribute("NOSession"));
		List<Map<String, Object>> list = com_ordersService.DayTotal(commandMap.getMap());

		mv.addObject("list", list);

		return mv;
	}

}