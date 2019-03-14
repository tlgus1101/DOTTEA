package Dot_tea.member.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import Dot_tea.info.service.InfoService;
import Dot_tea.member.service.MemberUserService;
import Dot_tea.order.service.OrderService;
import Dot_tea.product.service.TeaDealService;
import Dot_tea.setting.CommandMap;
import Dot_tea.write.service.WriteService;

@Controller
@SessionAttributes("Id")
public class MemberController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "orderService")
	private OrderService orderService;

	@Resource(name = "writeService")
	private WriteService writeService;

	@Resource(name = "memberUserService")
	private MemberUserService memberUserService;

	@Resource(name = "teaDealService")
	private TeaDealService teaDealService;

	@RequestMapping(value = "/member/mypage.tea")
	public ModelAndView mymain(CommandMap commandMap, HttpSession session, HttpServletRequest request)
			throws Exception {
		ModelAndView mv = new ModelAndView("/member/user/myPage");

		request.getSession().getAttribute("NOSession");
		commandMap.put("MEM_USER_NO", session.getAttribute("NOSession"));
		session.setAttribute("NOSession", commandMap.get("MEM_USER_NO"));
		request.getSession().getAttribute("idSession");
		commandMap.put("MEM_USER_USERID", request.getSession().getAttribute("idSession"));

		List<Map<String, Object>> orderlist = orderService.orderBoardList(commandMap.getMap());
		List<Map<String, Object>> qnalist = writeService.qnaBoardList(commandMap.getMap());
		List<Map<String, Object>> list = writeService.miniReivew(commandMap.getMap());
		mv.addObject("order", orderlist);
		mv.addObject("qna", qnalist);
		mv.addObject("list", list);
		return mv;
	}

	@RequestMapping(value = "/member/myLikeList.tea")
	public ModelAndView likeList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		HttpSession session = request.getSession();

		System.out.println("MAP 뭐가 나오는지 볼까??" + commandMap.getMap());
		System.out.println("뭐가 나오는지 볼까??" + commandMap);
		System.out.println("세션 값이 있나요? " + commandMap.get("NOSession"));
		commandMap.put("MEM_USER_NO", commandMap.get("NOSession"));

		Map<String, Object> like = memberUserService.likeSelect(commandMap.getMap());

		if (like != null) {
			String likeStr = (String) like.get("MEM_LIKE_DEAL");
			String[] likeNOList = likeStr.split(" ");

			List<Map<String, Object>> likeList = new ArrayList<Map<String, Object>>();

			for (int i = 0; i < likeNOList.length; i++) {
				if (likeNOList[i] != " ") {
					System.out.println("세션 DEAL_NO 있나요? " + likeNOList[i]);
					int tempNo = Integer.parseInt(likeNOList[i]);
					commandMap.put("NO", tempNo);
					Map<String, Object> temp = teaDealService.selectTeaDealDetail(commandMap.getMap());
					likeList.add(temp);
				}
			}

			if (likeList != null) {
				mv.addObject("TOTAL", likeList.size());
			} else {
				mv.addObject("TOTAL", 0);

			}

			mv.addObject("likeList", likeList);
		} else {
			mv.addObject("TOTAL", 0);
		}
		return mv;
	}

}