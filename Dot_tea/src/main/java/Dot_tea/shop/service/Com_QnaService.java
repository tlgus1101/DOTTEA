package Dot_tea.shop.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface Com_QnaService {
	Map<String, Object> comQnAList(Map<String, Object> map) throws Exception;
	
	Map<String, Object> companyQnAList(Map<String, Object> map) throws Exception;
	
	Map<String, Object> comQnADetail(Map<String, Object> map, HttpServletRequest request) throws Exception;
	
/*	Map<String, Object> checkPassowrd(Map<String, Object> map, HttpServletRequest request) throws Exception;*/
	
	void QnAwrite(Map<String, Object> map, HttpServletRequest request) throws Exception;
	
	void comQnAreply(Map<String, Object> map, HttpServletRequest request) throws Exception;

	void replyUpdate(Map<String, Object> map, HttpServletRequest request) throws Exception;
	
	void replyCheck(Map<String, Object> map, HttpServletRequest request) throws Exception;
	
	Map<String, Object> QnADeal(Map<String, Object> map, HttpServletRequest request) throws Exception;
	
	void QnAupdate(Map<String, Object> map) throws Exception;
	
	void QnAupdateReply(Map<String, Object> map) throws Exception;
	
	void QnAdelete(Map<String, Object> map) throws Exception;
	
	
	
}
