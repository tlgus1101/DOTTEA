package Dot_tea.write.service;

import java.util.List;
import java.util.Map;

public interface WriteService {
	List<Map<String, Object>> qnaBoardList(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> qnaPagingList(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> reviewPagingList(Map<String, Object> map) throws Exception;

	Map<String, Object> qnaBoardDetail(Map<String, Object> map) throws Exception;

	Map<String, Object> reviewBoardDetail(Map<String, Object> map) throws Exception;

	void qnaUpdate(Map<String, Object> map) throws Exception;

	void qnaDelete(Map<String, Object> map) throws Exception;

	void reviewUpdate(Map<String, Object> map) throws Exception;

	void reviewDelete(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> qnaSearchList(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> reviewSearchList(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> miniReivew(Map<String, Object> map) throws Exception;
}
