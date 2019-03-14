package Dot_tea.shop.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface Com_ReviewService {

		Map<String, Object> reviewBoardList(Map<String, Object> map) throws Exception; 
		
		Map<String, Object> reviewCompany(Map<String, Object> map) throws Exception; 
		

		void reviewinsert(Map<String, Object> map) throws Exception;

		void reviewdelete(Map<String, Object> map) throws Exception;
		
		void reviewPolice(Map<String, Object> map) throws Exception;
		
		Map<String, Object> PoliceReviewDE(Map<String, Object> map) throws Exception; 

		//void deleteBoard(Map<String, Object> map) throws Exception;
		
		//void uploadimage(Map<String, Object> map, HttpServletRequest request)  throws Exception;

		//Map<String, Object> selectBoardDetail(Map<String, Object> map, HttpServletRequest request) throws Exception;

	}
		
