package Dot_tea.product.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface TeaDealService {
	List<Map<String, Object>> selectMainTeaRecommendList(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> selectTeaList(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> searchTeaDealList(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> selectTeaTotalList(Map<String, Object> map) throws Exception;

	Map<String, Object> selectTeaDealDetail(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> teaAccList(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> teaEventList(Map<String, Object> map) throws Exception;

	void likeDeal(Map<String, Object> map) throws Exception;

}