package Dot_tea.product.controller;

import java.net.URLDecoder;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sun.xml.internal.fastinfoset.Encoder;

import Dot_tea.member.service.MemberUserService;
import Dot_tea.product.service.TeaDealService;
import Dot_tea.setting.CommandMap;
import Dot_tea.shop.service.Com_ReviewService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class TeaDealController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "teaDealService")
	private TeaDealService teaDealService;

	@Resource(name = "com_reviewService")
	private Com_ReviewService com_reviewService;

	@Resource(name = "memberUserService")
	private MemberUserService memberUserService;

	// -----------------------------별점 상세페이지에서
	// 보여주기-----------------------------------------------
	@RequestMapping("/teaDeal/starts.tea")
	public ModelAndView stars(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/teaDeal/stars");

		Map<String, Object> resultMap = com_reviewService.reviewBoardList(commandMap.getMap());

		mv.addObject("paginationInfo", (PaginationInfo) resultMap.get("paginationInfo"));
		mv.addObject("DEAL_NO", commandMap.get("DEAL_NO"));
		mv.addObject("list", resultMap.get("result"));

		return mv;
	}

	@RequestMapping("/teaDeal/insertstarts.tea")
	public ModelAndView starsInsert(CommandMap commandMap, HttpServletRequest request, HttpSession session)
			throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/teaDeal/starts.tea");
		System.out.println(commandMap.getMap());
		com_reviewService.reviewinsert(commandMap.getMap());
		mv.addObject("DEAL_NO", commandMap.get("DEAL_NO"));
		return mv;

	}

	@RequestMapping("/member/likeAjax.tea")
	public ModelAndView likeAjax(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/teaDeal/teaDealDetail.tea");

		HttpSession session = request.getSession();

		if (commandMap.get("type").equals("1")) {// like ing
			memberUserService.unlikeCk(commandMap.getMap());
			commandMap.put("DEAL_FAV", "-1");
			teaDealService.likeDeal(commandMap.getMap());
			mv.addObject("like", 1); // unlike change
		} else {// unlike ing
			commandMap.put("DEAL_FAV", "+1");
			teaDealService.likeDeal(commandMap.getMap());
			memberUserService.likeCK(commandMap.getMap());
			mv.addObject("like", 2);// like change
		}
		mv.addObject("NO", commandMap.get("NO"));
		return mv;
	}

	/*
	 * @RequestMapping("/teaDeal/deletestarts.tea") public ModelAndView
	 * starsDelete(CommandMap commandMap) throws Exception { ModelAndView mv = new
	 * ModelAndView("redirect:/teaDeal/starts.tea");
	 * System.out.println(commandMap.getMap());
	 * com_reviewService.reviewdelete(commandMap.getMap());
	 * 
	 * return mv; }
	 */

	// -------------- 상세페이지 부분----------------------------------
	@RequestMapping("/teaDeal/TeaRecommendList.tea")
	public ModelAndView mainTeaRecommendList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/teaDeal/teaRecommendList");

		List<Map<String, Object>> list = teaDealService.selectMainTeaRecommendList(commandMap.getMap());

		for (int i = 0; i < list.size(); i++) {

			String temp = (String) list.get(i).get("DEAL_IMGSV");
			if (temp != null) {
				list.get(i).put("DEAL_IMGSV", temp.split(",")[0]);
				System.out.println("DEAL_IMGSV " + temp.split(",")[0]);
			}
		}

		mv.addObject("list", list);

		return mv;
	}

//////////////////////////search////////////////////////////////////////////////////
	@RequestMapping("/teaDeal/searchTeaDeal.tea")
	public ModelAndView searchTeaDeal(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/teaDeal/searchTeaDeal");
		System.out.println("sdf11  " + commandMap.get("searchKeyword"));

		mv.addObject("searchKeyword", commandMap.get("searchKeyword"));

		return mv;
	}

	@RequestMapping("/teaDeal/searchTeaDealAjax.tea")
	public ModelAndView searchTeaDealAjax(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		String search = (String) commandMap.get("searchKeyword");

		commandMap.put("inputKeyword", "%" + search + "%");
		commandMap.put("selectType", "DEAL_DATE DESC");

		System.out.println("sdf" + commandMap.get("inputKeyword"));

		// System.out.println("sdf" + URLDecoder.decode((String)
		// commandMap.get("inputKeyword"), "UTF-8"));

		List<Map<String, Object>> list = teaDealService.searchTeaDealList(commandMap.getMap());

		if (list != null) {
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		} else {
			mv.addObject("TOTAL", 0);
		}
		mv.addObject("list", list);

		return mv;
	}

//	@RequestMapping("/teaDeal/teaDealDetail.tea")
//	public ModelAndView teaDealDetail(CommandMap commandMap) throws Exception {
//		ModelAndView mv = new ModelAndView("/teaDeal/teaDealDetail");
//
//		Map<String, Object> list = teaDealService.selectTeaDealDetail(commandMap.getMap());
//		mv.addObject("AlreadyBasket", commandMap.get("AlreadyBasket"));
//		mv.addObject("list", list);
//
//		return mv;
//	}

	@RequestMapping("/teaDeal/teaDealDetail.tea")
	public ModelAndView teaDealDetail(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/teaDeal/teaDealDetail");
		HttpSession session = request.getSession();

		System.out.println("no : " + commandMap.get("NO"));

		Map<String, Object> list = teaDealService.selectTeaDealDetail(commandMap.getMap());

		mv.addObject("list", list);

		System.out.println(session.getAttribute("typeSession"));

		Integer typeSession = (Integer) session.getAttribute("typeSession");

		if (typeSession != null) {
			if (typeSession == 1) {

				commandMap.put("MEM_USER_NO", session.getAttribute("NOSession"));

				Map<String, Object> likeList = memberUserService.likeSelect(commandMap.getMap());

				if (likeList != null) {
					String like = (String) likeList.get("MEM_LIKE_DEAL");
					String[] likeList1 = like.split(" ");

					for (int i = 0; i < likeList1.length; i++) {
						if (likeList1[i].equals(commandMap.get("NO"))) {
							mv.addObject("like", 2);
							System.out.println("존재함 ");
							break;
						} else {
							mv.addObject("like", 1);
						}
					}
				} else {
					System.out.println("존재함 안함 ");
					mv.addObject("like", 1);
				}
			}
		} else {
			mv.addObject("like", 1);
		}

		return mv;
	}

	@RequestMapping("/teaDeal/teaList.tea")
	public ModelAndView teaShopTeaList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/teaDeal/teaDealList");

		String teaShopType = (String) commandMap.get("teaShopType");

		mv.addObject("teaShopType", teaShopType);

		// teaSetTotalList.tea

		return mv;
	}

	@RequestMapping("/teaDeal/teaSetTotalList.tea")
	public ModelAndView teaSetTotalListAjax(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");

		String DealType = (String) commandMap.get("DealType");

		String select_type = (String) commandMap.get("select_type");

		if (DealType.equals("0")) {// 다기
			commandMap.put("typeStart", "2");
			commandMap.put("typeEnd", "4");
		}
		if (DealType.equals("2")) {// 티팟
			commandMap.put("typeStart", "2");
			commandMap.put("typeEnd", "2");
		}
		if (DealType.equals("3")) {// 티컵
			commandMap.put("typeStart", "3");
			commandMap.put("typeEnd", "3");
		}
		if (DealType.equals("4")) {// 세트
			commandMap.put("typeStart", "4");
			commandMap.put("typeEnd", "4");
		}

		List<Map<String, Object>> list = null;

		if (select_type.equals("1")) {// 신상품 순
			commandMap.put("selectType", "DEAL_DATE DESC");
			list = teaDealService.selectTeaTotalList(commandMap.getMap());
			mv.addObject("type", "신상품순");
			mv.addObject("typeCount", "1");
		} else if (select_type.equals("2")) {// 인기 상품순
			commandMap.put("selectType", "DEAL_FAV DESC");
			list = teaDealService.selectTeaTotalList(commandMap.getMap());
			mv.addObject("type", "인기상품순 ");
			mv.addObject("typeCount", "2");
		} else if (select_type.equals("3")) {// 낮은 가격순
			commandMap.put("selectType", "DEAL_PRICE ASC");
			list = teaDealService.selectTeaTotalList(commandMap.getMap());
			mv.addObject("type", "낮은가격순");
			mv.addObject("typeCount", "3");
		} else if (select_type.equals("4")) {// 높은 가격순
			commandMap.put("selectType", "DEAL_PRICE DESC");
			list = teaDealService.selectTeaTotalList(commandMap.getMap());
			mv.addObject("type", "높은가격순");
			mv.addObject("typeCount", "4");
		}

		for (int i = 0; i < list.size(); i++) {

			String temp = (String) list.get(i).get("DEAL_IMGSV");
			if (temp != null) {
				list.get(i).put("DEAL_IMGSV", temp.split(",")[0]);
				System.out.println("DEAL_IMGSV " + temp.split(",")[0]);

				temp = (String) list.get(i).get("DEAL_IMGOG");
				list.get(i).put("DEAL_IMGOG", temp.split(",")[0]);
				System.out.println("DEAL_IMGOG " + temp.split(",")[0]);
			}

		}

		mv.addObject("DealType", DealType);
		mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		mv.addObject("list", list);
		return mv;
	}

	@RequestMapping("/teaDeal/teaListAjax.tea")
	public ModelAndView teaListAjax(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		commandMap.put("type", "1");// 찻잎

		List<Map<String, Object>> list = null;

		if (commandMap.get("select_type").equals("1") || commandMap.get("type") == null) {// 신상품 순
			commandMap.put("selectType", "DEAL_DATE DESC");
			list = teaDealService.selectTeaList(commandMap.getMap());
			mv.addObject("type", "신상품순");
			mv.addObject("typeCount", "1");
		} else if (commandMap.get("select_type").equals("2")) {// 인기 상품순
			commandMap.put("selectType", "DEAL_FAV DESC");
			list = teaDealService.selectTeaList(commandMap.getMap());
			mv.addObject("type", "인기상품순 ");
			mv.addObject("typeCount", "2");
		} else if (commandMap.get("select_type").equals("3")) {// 낮은 가격순
			commandMap.put("selectType", "DEAL_PRICE ASC");
			list = teaDealService.selectTeaList(commandMap.getMap());
			mv.addObject("type", "낮은가격순");
			mv.addObject("typeCount", "3");
		} else if (commandMap.get("select_type").equals("4")) {// 높은 가격순
			commandMap.put("selectType", "DEAL_PRICE DESC");
			list = teaDealService.selectTeaList(commandMap.getMap());
			mv.addObject("type", "높은가격순");
			mv.addObject("typeCount", "4");
		}

		for (int i = 0; i < list.size(); i++) {

			String temp = (String) list.get(i).get("DEAL_IMGSV");
			if (temp != null) {
				list.get(i).put("DEAL_IMGSV", temp.split(",")[0]);
				System.out.println("DEAL_IMGSV " + temp.split(",")[0]);

				temp = (String) list.get(i).get("DEAL_IMGOG");
				list.get(i).put("DEAL_IMGOG", temp.split(",")[0]);
				System.out.println("DEAL_IMGOG " + temp.split(",")[0]);
			}

		}

		mv.addObject("teaShopType", "1");
		mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		mv.addObject("list", list);
		return mv;
	}

	@RequestMapping("/teaDeal/teaAccList.tea")
	public ModelAndView teaAccList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		commandMap.put("type", "5"); // 악세
		String select_type = (String) commandMap.get("select_type");

		List<Map<String, Object>> list = null;

		if (select_type.equals("1")) {// 신상품 순
			commandMap.put("selectType", "DEAL_DATE DESC");
			list = teaDealService.teaAccList(commandMap.getMap());
			mv.addObject("type", "신상품순");
			mv.addObject("typeCount", "1");
		} else if (select_type.equals("2")) {// 인기 상품순
			commandMap.put("selectType", "DEAL_FAV DESC");
			list = teaDealService.teaAccList(commandMap.getMap());
			mv.addObject("type", "인기상품순 ");
			mv.addObject("typeCount", "2");
		} else if (select_type.equals("3")) {// 낮은 가격순
			commandMap.put("selectType", "DEAL_PRICE ASC");
			list = teaDealService.teaAccList(commandMap.getMap());
			mv.addObject("type", "낮은가격순");
			mv.addObject("typeCount", "3");
		} else if (select_type.equals("4")) {// 높은 가격순
			commandMap.put("selectType", "DEAL_PRICE DESC");
			list = teaDealService.teaAccList(commandMap.getMap());
			mv.addObject("type", "높은가격순");
			mv.addObject("typeCount", "4");
		}

		for (int i = 0; i < list.size(); i++) {

			String temp = (String) list.get(i).get("DEAL_IMGSV");
			if (temp != null) {
				list.get(i).put("DEAL_IMGSV", temp.split(",")[0]);
				System.out.println("DEAL_IMGSV " + temp.split(",")[0]);

				temp = (String) list.get(i).get("DEAL_IMGOG");
				list.get(i).put("DEAL_IMGOG", temp.split(",")[0]);
				System.out.println("DEAL_IMGOG " + temp.split(",")[0]);
			}

		}

		mv.addObject("teaShopType", "5");
		mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		mv.addObject("list", list);

		return mv;
	}

	@RequestMapping("/teaDeal/teaEventList.tea")
	public ModelAndView teaEventList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		String select_type = (String) commandMap.get("select_type");
		commandMap.put("type", "6");// 이벤

		List<Map<String, Object>> list = null;

		if (select_type.equals("1")) {// 신상품 순
			commandMap.put("selectType", "DEAL_DATE DESC");
			list = teaDealService.teaEventList(commandMap.getMap());
			mv.addObject("type", "신상품순");
			mv.addObject("typeCount", "1");
		} else if (select_type.equals("2")) {// 인기 상품순
			commandMap.put("selectType", "DEAL_FAV DESC");
			list = teaDealService.teaEventList(commandMap.getMap());
			mv.addObject("type", "인기상품순 ");
			mv.addObject("typeCount", "2");
		} else if (select_type.equals("3")) {// 낮은 가격순
			commandMap.put("selectType", "DEAL_PRICE ASC");
			list = teaDealService.teaEventList(commandMap.getMap());
			mv.addObject("type", "낮은가격순");
			mv.addObject("typeCount", "3");
		} else if (select_type.equals("4")) {// 높은 가격순
			commandMap.put("selectType", "DEAL_PRICE DESC");
			list = teaDealService.teaEventList(commandMap.getMap());
			mv.addObject("type", "높은가격순");
			mv.addObject("typeCount", "4");
		}

		for (int i = 0; i < list.size(); i++) {

			String temp = (String) list.get(i).get("DEAL_IMGSV");
			if (temp != null) {
				list.get(i).put("DEAL_IMGSV", temp.split(",")[0]);
				System.out.println("DEAL_IMGSV " + temp.split(",")[0]);

				temp = (String) list.get(i).get("DEAL_IMGOG");
				list.get(i).put("DEAL_IMGOG", temp.split(",")[0]);
				System.out.println("DEAL_IMGOG " + temp.split(",")[0]);
			}

		}

		mv.addObject("teaShopType", "6");
		mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		mv.addObject("list", list);

		return mv;
	}

}
