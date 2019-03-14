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
import Dot_tea.shop.service.Com_QnaService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class Com_QnaController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "com_qnaService")
	private Com_QnaService com_qnaService;

	@RequestMapping(value = "/com_qna/openBoardList.tea")
	public ModelAndView openBoardList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/member/com/com_qna/com_qnaList");

		Map<String, Object> resultMap = com_qnaService.comQnAList(commandMap.getMap());

		mv.addObject("paginationInfo", (PaginationInfo) resultMap.get("paginationInfo"));
		mv.addObject("list", resultMap.get("result"));
		mv.addObject("DEAL_NO", commandMap.get("DEAL_NO"));

		return mv;
	}

	@RequestMapping(value = "/com_qna/openQnAList.tea")
	public ModelAndView openQnAList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/member/com/com_qna/QAcompany");
		Map<String, Object> resultMap = com_qnaService.companyQnAList(commandMap.getMap());

		mv.addObject("paginationInfo", (PaginationInfo) resultMap.get("paginationInfo"));
		mv.addObject("list", resultMap.get("result"));
		mv.addObject("MEM_COM_ID", commandMap.get("MEM_COM_ID"));

		return mv;
	}

	@RequestMapping(value = "/com_qna/openBoardDetail.tea")
	public ModelAndView openBoardDetail(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/member/com/com_qna/com_qnaDetail");

		Map<String, Object> map = com_qnaService.comQnADetail(commandMap.getMap(), request);
		mv.addObject("map", map);

		return mv;
	}

	@RequestMapping(value = "/com_qna/QABoardDetail.tea")
	public ModelAndView QAdetail(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/member/com/com_qna/QAdetail");

		Map<String, Object> map = com_qnaService.comQnADetail(commandMap.getMap(), request);
		mv.addObject("map", map);
		mv.addObject("MEM_COM_ID", commandMap.get("MEM_COM_ID"));

		return mv;
	}

	@RequestMapping(value = "/com_qna/checkForm.tea")
	public ModelAndView checkPasswordForm(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/member/com/com_qna/checkForm");
		Map<String, Object> map = com_qnaService.comQnADetail(commandMap.getMap(), request);
		mv.addObject("map", map);

		/* mv.addObject("QA_PASSWORD", commandMap.get("QA_PASSWORD")); */
		return mv;

	}

	@RequestMapping(value = "/com_qna/checkPassword.tea")
	public ModelAndView checkPassword(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("redirect:/com_qna/openBoardDetail.tea");
		mav.addObject("QA_NO", commandMap.get("QA_NO"));
		/*
		 * Map<String,Object> map = com_qnaService.checkPassowrd(commandMap.getMap(),
		 * request); mav.addObject("map", map);
		 */

		return mav;

	}

	@RequestMapping(value = "/com_qna/openBoardWrite.tea")
	public ModelAndView openBoardWrite(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/member/com/com_qna/QAwriteForm");
		Map<String, Object> map = com_qnaService.comQnADetail(commandMap.getMap(), request);
		mv.addObject("map", map);
		mv.addObject("MEM_COM_ID", commandMap.get("MEM_COM_ID"));
		return mv;
	}

	@RequestMapping(value = "/com_qna/insertBoard.tea")
	public ModelAndView QnAinsert(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/com_qna/openQnAList.tea");

		com_qnaService.comQnAreply(commandMap.getMap(), request);
		com_qnaService.replyUpdate(commandMap.getMap(), request);
		com_qnaService.replyCheck(commandMap.getMap(), request);
		mv.addObject("MEM_COM_ID", commandMap.get("MEM_COM_ID"));
		return mv;
	}

	@RequestMapping(value = "/com_qna/useropenWrite.tea")
	public ModelAndView userWrite(CommandMap commandMap, HttpServletRequest request) throws Exception {

		ModelAndView mv = new ModelAndView("/member/com/com_qna/userWriteForm");
		mv.addObject("DEAL_NO", commandMap.get("DEAL_NO"));
		/*
		 * Map<String,Object> map = com_qnaService.comQnADetail(commandMap.getMap(),
		 * request); mv.addObject("map", map);
		 */
		return mv;
	}

	@RequestMapping(value = "/com_qna/userinsert.tea")
	public ModelAndView userQAinsert(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/com_qna/openBoardList.tea");
		com_qnaService.QnAwrite(commandMap.getMap(), request);
		mv.addObject("DEAL_NO", commandMap.get("DEAL_NO"));

		return mv;
	}

	@RequestMapping(value = "/com_qna/QnAUpdate.tea")
	public ModelAndView QnAopenUpdate(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/member/com/com_qna/userUpdateForm");

		System.out.println(commandMap.getMap());

		Map<String, Object> map = com_qnaService.comQnADetail(commandMap.getMap(), request);
		mv.addObject("DEAL_NO", commandMap.get("DEAL_NO"));
		mv.addObject("map", map);

		return mv;
	}

	@RequestMapping(value = "/com_qna/QnAupdateBoard.tea")
	public ModelAndView QnAupdate(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/com_qna/openBoardList.tea");

		com_qnaService.QnAupdate(commandMap.getMap());
		mv.addObject("QA_NO", commandMap.get("QA_NO"));
		mv.addObject("DEAL_NO", commandMap.get("DEAL_NO"));
		return mv;
	}

	@RequestMapping(value = "/com_qna/QnAdelete.tea")
	public ModelAndView QnAdelete(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/com_qna/openBoardList.tea");

		System.out.println("safdjlaksjdflk ::::: " + commandMap.getMap());

		// commandMap.put("QA_NO", commandMap.get("QA_STEP"));
		com_qnaService.QnAdelete(commandMap.getMap());
		mv.addObject("DEAL_NO", commandMap.get("DEAL_NO"));

		return mv;
	}

	@RequestMapping(value = "/com_qna/QAUpdateForm.tea")
	public ModelAndView QAopenUpdate(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/member/com/com_qna/QAupdateForm");

		Map<String, Object> map = com_qnaService.comQnADetail(commandMap.getMap(), request);
		mv.addObject("map", map);
		mv.addObject("MEM_COM_ID", commandMap.get("MEM_COM_ID"));

		return mv;
	}

	@RequestMapping(value = "/com_qna/QnAupdate.tea")
	public ModelAndView QAupdate(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/com_qna/openQnAList.tea");

		System.out.println(commandMap.getMap());
		com_qnaService.QnAupdateReply(commandMap.getMap());
		mv.addObject("QA_NO", commandMap.get("QA_NO"));
		mv.addObject("MEM_COM_ID", commandMap.get("MEM_COM_ID"));
		return mv;
	}

	@RequestMapping(value = "/com_qna/QAdelete.tea")
	public ModelAndView QAdelete(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/com_qna/openQnAList.tea");

		com_qnaService.QnAdelete(commandMap.getMap());
		mv.addObject("MEM_COM_ID", commandMap.get("MEM_COM_ID"));

		return mv;
	}

}
