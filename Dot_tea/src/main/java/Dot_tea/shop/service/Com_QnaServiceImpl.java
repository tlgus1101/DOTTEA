package Dot_tea.shop.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.management.loading.MLet;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import Dot_tea.setting.CommandMap;
import Dot_tea.common.util.FileUtils;
import Dot_tea.shop.dao.Com_OrdersDAO;
import Dot_tea.shop.dao.Com_QnaDAO;

@Service("com_qnaService")
public class Com_QnaServiceImpl implements Com_QnaService{
	
Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="com_qnaDAO")
	private Com_QnaDAO com_qnaDAO;
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;

	@Override
	public Map<String, Object> comQnAList(Map<String, Object> map) throws Exception {
		return com_qnaDAO.QnaBoardList(map);
	}

	@Override
	public Map<String, Object> comQnADetail(Map<String, Object> map, HttpServletRequest request) throws Exception {
		Map<String, Object> resultMap = com_qnaDAO.QnaBoardDetail(map);
		
		return resultMap;
		
	}

	@Override
	public void comQnAreply(Map<String, Object> map, HttpServletRequest request) throws Exception {
			com_qnaDAO.comQnAreply(map);
		
	}

	@Override
	public void replyUpdate(Map<String, Object> map, HttpServletRequest request) throws Exception {
		com_qnaDAO.replyupdate(map);
		
	}

	@Override
	public void replyCheck(Map<String, Object> map, HttpServletRequest request) throws Exception {
		com_qnaDAO.replyCheck(map);
		
	}

	@Override
	public void QnAwrite(Map<String, Object> map, HttpServletRequest request) throws Exception {
		com_qnaDAO.QnAwrite(map);
		
	}

	@Override
	public Map<String, Object> QnADeal(Map<String, Object> map, HttpServletRequest request) throws Exception {
		Map<String, Object> resultMap = com_qnaDAO.QnaDealNo(map);
		return resultMap;
	}

	@Override
	public Map<String, Object> companyQnAList(Map<String, Object> map) throws Exception {
		return com_qnaDAO.QnaCompanyList(map);
	
	}

	@Override
	public void QnAupdate(Map<String, Object> map) throws Exception {
		com_qnaDAO.QnAupdate(map);
		
	}

	@Override
	public void QnAdelete(Map<String, Object> map) throws Exception {
		com_qnaDAO.QnAdelete(map);
		
	}

	@Override
	public void QnAupdateReply(Map<String, Object> map) throws Exception {
		com_qnaDAO.QnAupdatereply(map);
		
	}

	/*@Override
	public Map<String, Object> checkPassowrd(Map<String, Object> map, HttpServletRequest request) throws Exception {
		Map<String, Object> resultMap = com_qnaDAO.checkPassword(map);
		return resultMap;
		
	}*/
	

	

}
