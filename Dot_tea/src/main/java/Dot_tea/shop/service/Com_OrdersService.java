package Dot_tea.shop.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface Com_OrdersService {

	List<Map<String, Object>> orderBoardList(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> orderBoardList2(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> orderBoardList3(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> orderBoardList4(Map<String, Object> map) throws Exception;

	Map<String, Object> orderTotal(Map<String, Object> map) throws Exception;

	// --------- 검색용 list 시작 --------------
	List<Map<String, Object>> ordersBoardListSchName(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> ordersBoardListSchPhone(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> ordersBoardList2SchName(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> ordersBoardList2SchPhone(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> ordersBoardList3SchName(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> ordersBoardList3SchPhone(Map<String, Object> map) throws Exception;

	// ---------- 검색용 list 끝 --------------

	// void insertBoard(Map<String, Object> map, HttpServletRequest request) throws
	// Exception;

	// void updateBoard(Map<String, Object> map, HttpServletRequest request) throws
	// Exception;

	// void deleteBoard(Map<String, Object> map) throws Exception;

	// void uploadimage(Map<String, Object> map, HttpServletRequest request) throws
	// Exception;

	Map<String, Object> orderBoardDetail(Map<String, Object> map, HttpServletRequest request) throws Exception;

	Map<String, Object> orderBoardDetailC(Map<String, Object> map, HttpServletRequest request) throws Exception;

	void updateBoard(Map<String, Object> map) throws Exception;

	void orderinsert(Map<String, Object> map) throws Exception;

	void updateBoard2(Map<String, Object> map) throws Exception;

	void updateBoard7(Map<String, Object> map) throws Exception;

	void updateBoard8(Map<String, Object> map) throws Exception;

	void updateBoard9(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> MonthTotal(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> DayTotal(Map<String, Object> map) throws Exception;
}
