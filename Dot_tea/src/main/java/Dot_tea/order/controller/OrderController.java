package Dot_tea.order.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import Dot_tea.info.service.InfoService;
import Dot_tea.order.service.OrderService;
import Dot_tea.product.service.TeaDealService;
import Dot_tea.setting.CommandMap;
import Dot_tea.setting.ListSortMapDesc;

@Controller
public class OrderController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "orderService")
	private OrderService orderService;

	@Resource(name = "infoService")
	private InfoService infoService;

	@Resource(name = "teaDealService")
	private TeaDealService teaDealService;

	@RequestMapping(value = "/member/orderlist.tea")
	public ModelAndView orderlist(Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/member/user/list/orderList");

		return mv;
	}

	@RequestMapping(value = "/member/orderboard.tea")
	public ModelAndView orderboard(CommandMap commandMap, HttpSession session, HttpServletRequest request)
			throws Exception {
		request.getSession().getAttribute("NOSession");

		commandMap.put("MEM_USER_USERID", request.getSession().getAttribute("idSession"));
		commandMap.put("MEM_USER_NO", request.getSession().getAttribute("NOSession"));
		System.out.println("1 : " + request.getSession().getAttribute("NOSession"));

		ModelAndView mv = new ModelAndView("jsonView");
		List<Map<String, Object>> orderlist = orderService.orderPagingList(commandMap.getMap());

		mv.addObject("order", orderlist);
		if (orderlist.size() > 0) {
			mv.addObject("TOTAL", orderlist.get(0).get("TOTAL_COUNT"));
		} else {
			mv.addObject("TOTAL", 0);
		}
		return mv;
	}

	@RequestMapping(value = "/member/ordersearch.tea")
	public ModelAndView ordersearch(CommandMap commandMap) throws Exception {

		ModelAndView mv = new ModelAndView("jsonView");
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		commandMap.put("first",
				dateFormat.parse((String) commandMap.get("YEAR") + "-" + (String) commandMap.get("MONTH") + "-1"));
		commandMap.put("end",
				dateFormat.parse((String) commandMap.get("YEAR") + "-" + (String) commandMap.get("MONTH") + "-31"));

		List<Map<String, Object>> ordersearch = orderService.orderSearchList(commandMap.getMap());
		mv.addObject("order", ordersearch);
		if (ordersearch.size() > 0) {
			mv.addObject("TOTAL", ordersearch.get(0).get("TOTAL_COUNT"));
		} else {
			mv.addObject("TOTAL", 0);
		}

		return mv;

	}

	@RequestMapping(value = "/member/orderdetail.tea")
	public ModelAndView orderDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/member/user/detail/orderDetail");

		Map<String, Object> map = orderService.orderBoardDetail(commandMap.getMap());
		mv.addObject("map", map);

		List<Map<String, Object>> list = orderService.orderDetailBuyList(map);
		mv.addObject("list", list);
		return mv;
	}

	@RequestMapping(value = "/member/orderCancel.tea")
	public ModelAndView orderCancel(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/member/mypage.tea");

		orderService.orderCancel(commandMap.getMap());
		mv.addObject("OR_NO", commandMap.get("OR_NO"));
		return mv;
	}

	@RequestMapping(value = "/member/orderReturn.tea")
	public ModelAndView orderReturn(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/member/mypage.tea");

		orderService.orderReturn(commandMap.getMap());
		mv.addObject("OR_NO", commandMap.get("OR_NO"));
		return mv;
	}

	@RequestMapping(value = "/member/orderChange.tea")
	public ModelAndView orderChange(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/member/mypage.tea");

		orderService.orderChange(commandMap.getMap());
		mv.addObject("OR_NO", commandMap.get("OR_NO"));
		return mv;
	}

//////////////////////////////// teaDealBuy///////////////////////////////////////////////////////

	@RequestMapping(value = "/member/teaDealInputBasket.tea")
	public ModelAndView teaDealInputBasket(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/teaDeal/teaDealDetail.tea");

		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		String LoginBasket = (String) commandMap.get("LoginBasket");

		if (LoginBasket.equals("1")) {// 비회원
			HttpSession session = request.getSession();
			// session.removeAttribute("bascket");

			if (session.getAttribute("bascket") != null) {
				list = (List<Map<String, Object>>) session.getAttribute("bascket");
			}
			Map<String, Object> map = new HashMap<String, Object>();
			System.out.println("alist: " + list);
			if (list != null) {
				for (int i = 0; i < list.size(); i++) {
					String no = (String) list.get(i).get("DEAL_NO");
					if (no.equals((String) commandMap.get("DEAL_NO"))) {// same session

						String count = list.get(i).get("count").toString();
						String tempCount = (String) commandMap.get("count");
						list.get(i).put("count", tempCount);
						// list.get(i).put("count", (Integer.parseInt(count) +
						// Integer.parseInt(tempCount)));

						mv.addObject("NO", commandMap.get("DEAL_NO"));
						session.setAttribute("bascket", list);
						return mv;
					}
				}
			}
			// no same session
			map.put("DEAL_NO", commandMap.get("DEAL_NO"));
			map.put("count", commandMap.get("count"));

			list.add(map);
			System.out.println("list: " + list);

			session.setAttribute("bascket", list);
		} else {// 회원
			int Count = Integer.parseInt((String) commandMap.get("count"));
			request.getSession().setAttribute("B_COUNT", Count);

			System.out.println(commandMap.get("count"));
			System.out.println(commandMap.get("DEAL_NO"));
			System.out.println(request.getSession().getAttribute("NOSession"));

			commandMap.put("B_COUNT", commandMap.get("count"));
			commandMap.put("DEAL_NO", commandMap.get("DEAL_NO"));
			commandMap.put("MEM_USER_NO", request.getSession().getAttribute("NOSession"));

			orderService.InBasket(commandMap.getMap());
			mv.addObject("NO", commandMap.get("DEAL_NO"));
			return mv;

		}

		mv.addObject("NO", commandMap.get("DEAL_NO"));

		return mv;
	}

	@RequestMapping(value = "/member/teaBasketList.tea")
	public ModelAndView teaBasketList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/member/user/list/teaBasketList");
		mv.addObject("MyPage", commandMap.get("MyPage"));
		return mv;
	}

	@RequestMapping(value = "/member/TeaBasketListAjax.tea")
	public ModelAndView TeaBasketListAjax(CommandMap commandMap, HttpServletRequest request) throws Exception {

		ModelAndView mv = new ModelAndView("jsonView");

		HttpSession session = request.getSession();
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

		if (session.getAttribute("NOSession") == null || ((int) session.getAttribute("typeSession") != 1)) {
			List<Map<String, Object>> sessionList = (List<Map<String, Object>>) session.getAttribute("bascket");

			if (sessionList != null) {
				for (int i = 0; i < sessionList.size(); i++) {

					commandMap.put("DEAL_NO", sessionList.get(i).get("DEAL_NO"));
					Map<String, Object> tempMap = (Map<String, Object>) orderService
							.SessionbasketDeal(commandMap.getMap());
					tempMap.put("B_COUNT", sessionList.get(i).get("count"));

					list.add(tempMap);
				}
				// list Map 정렬 방식 *****
				Collections.sort(list, new ListSortMapDesc("MEM_COM_ID"));
			}

		} else {
			commandMap.put("MEM_USER_NO", request.getSession().getAttribute("NOSession"));
			list = orderService.basketPagingList(commandMap.getMap());
		}

		System.out.println("장바구니 list : " + list.toString());
		mv.addObject("list", list);
		if (list.size() > 0) {
			mv.addObject("TOTAL", list.size());
			mv.addObject("firstCompany", list.get(0).get("MEM_COM_ID"));
		} else {
			mv.addObject("TOTAL", 0);
		}

		return mv;
	}

	@RequestMapping(value = "/member/B_Count_change.tea")
	public ModelAndView B_Count_change(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		HttpSession session = request.getSession();

		if (session.getAttribute("NOSession") == null) {

			List<Map<String, Object>> list = (List<Map<String, Object>>) session.getAttribute("bascket");

			if (list != null) {
				for (int i = 0; i < list.size(); i++) {
					String no = (String) list.get(i).get("DEAL_NO");
					if (no.equals((String) commandMap.get("DEAL_NO"))) {// same session

						String count = list.get(i).get("count").toString();

						if (commandMap.get("type").equals("1")) {
							count = (Integer.parseInt(count) + 1) + "";
						} else {
							count = (Integer.parseInt(count) - 1) + "";
						}
						String tempCount = count;
						list.get(i).put("count", tempCount);
						mv.addObject("NO", commandMap.get("DEAL_NO"));
						session.setAttribute("bascket", list);
						return mv;
					}
				}
			}

		} else {
			if (commandMap.get("type").equals("1")) {
				commandMap.put("B_COUNTSETTING", "+ 1");
			} else {
				commandMap.put("B_COUNTSETTING", "- 1");
			}
			orderService.BCountPlusMinus((commandMap).getMap());
		}
		return mv;
	}

	@RequestMapping(value = "/member/TeaBasketListDeleteAjax.tea")
	public ModelAndView TeaBasketListDeleteAjax(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		HttpSession session = request.getSession();
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		if (session.getAttribute("NOSession") == null || ((int) session.getAttribute("typeSession") != 1)) {
			List<Map<String, Object>> sessionlist = (List<Map<String, Object>>) session.getAttribute("bascket");
			for (int i = 0; i < sessionlist.size(); i++) {
				Map<String, Object> tempMap = sessionlist.get(i);
				if (tempMap.get("DEAL_NO").equals((String) commandMap.get("DEAL_NO"))) {// same session
				} else {
					list.add(tempMap);
				}
			}

			mv.addObject("NO", commandMap.get("DEAL_NO"));
			session.setAttribute("bascket", list);
			return mv;
		} else {
			orderService.TeaBasketListDelete(commandMap.getMap());
		}

		return mv;
	}

	@RequestMapping(value = "/member/teaDealBuy.tea")
	public ModelAndView teaDealBuy(CommandMap commandMap, HttpServletRequest request) throws Exception {
		request.getSession().getAttribute("NOSession");
		commandMap.put("MEM_USER_NO", request.getSession().getAttribute("NOSession"));

		// Map<String, Object> map = infoService.MyInfo(commandMap.getMap());

		ModelAndView mv = new ModelAndView("/teaDeal/teaDealBuy");
		System.out.println(commandMap.get("dealTitleList"));
		String dealTitle = (String) commandMap.get("dealTitleList");
		String[] dealTitleList = dealTitle.split(",");

		System.out.println("dealTitle " + dealTitle + " " + dealTitleList);

		if (dealTitleList.length > 1) {
			mv.addObject("buyDealNameSession", dealTitleList[0] + " 외 " + (dealTitleList.length - 1) + " 건 ");
		} else {
			mv.addObject("buyDealNameSession", dealTitleList[0]);
		}
		mv.addObject("buyDealPriceSession", commandMap.get("FinishBuyPrice"));
		mv.addObject("B_NOList", commandMap.get("B_NOList"));
		// mv.addObject("member", map);

		return mv;
	}

////////////////////////////////order Insert/////////////////////////////////////////////////////////////	
	@RequestMapping(value = "/member/teaDealBuyInsert.tea")
	public ModelAndView teaDealBuyInsert(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/member/user/list/teaBasketList");
		System.out.println(commandMap.get("B_NOList"));
		System.out.println(commandMap.get("rsp"));
		System.out.println(commandMap.get("IMP"));
		System.out.println(commandMap.get("frm"));

		String B_NO = (String) commandMap.get("B_NOList");
		String[] B_NOList = B_NO.split(",");

		// order
		commandMap.put("MEM_USER_NO", request.getSession().getAttribute("NOSession"));
		Map<String, Object> orderBTemp = infoService.MyInfo(commandMap.getMap());
		orderBTemp.put("OR_AD", orderBTemp.get("MEM_USER_ZIBUNADDR") + " " + orderBTemp.get("MEM_USER_DETAILADDR"));
		orderBTemp.put("rsp", commandMap.get("rsp"));
		orderService.InsertOrders(orderBTemp);

		// ORDER_DETAIL
		for (int i = 0; i < B_NOList.length; i++) {
			commandMap.put("B_NO", B_NOList[i]);
			Map<String, Object> orderTemp = orderService.selectOrders(commandMap.getMap());
			orderTemp.put("OR_AD", orderTemp.get("MEM_USER_ZIBUNADDR") + " " + orderTemp.get("MEM_USER_DETAILADDR"));
			orderTemp.put("rsp", commandMap.get("rsp"));
			orderService.InsertOrders2(orderTemp);
		}

		for (int i = 0; i < B_NOList.length; i++) {
			commandMap.put("B_NO", B_NOList[i]);
			orderService.TeaBasketListDelete(commandMap.getMap());
		}

		mv.addObject("B_NOList", commandMap.get("B_NOList"));
		return mv;
	}

}
