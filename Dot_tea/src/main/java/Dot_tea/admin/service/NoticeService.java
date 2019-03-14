package Dot_tea.admin.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface NoticeService {

	/*
	 * List<Map<String, Object>> noticeList(Map<String, Object> map) throws
	 * Exception;
	 */
	List<Map<String, Object>> noticeList(Map<String, Object> map) throws Exception;

	void noticeWrite(Map<String, Object> map, HttpServletRequest request) throws Exception;

	Map<String, Object> noticeView(Map<String, Object> map) throws Exception;

	void noticeUpdate(Map<String, Object> map, HttpServletRequest request) throws Exception;

	void noticeFileUpdate(Map<String, Object> map, HttpServletRequest request) throws Exception;

	void noticeDelete(Map<String, Object> map) throws Exception;

}
