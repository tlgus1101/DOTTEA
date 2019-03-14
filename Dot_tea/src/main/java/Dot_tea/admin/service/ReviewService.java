package Dot_tea.admin.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface ReviewService {

	/*
	 * List<Map<String, Object>> noticeList(Map<String, Object> map) throws
	 * Exception;
	 */
	List<Map<String, Object>> reviewList(Map<String, Object> map) throws Exception;

	Map<String, Object> reviewView(Map<String, Object> map) throws Exception;

}
