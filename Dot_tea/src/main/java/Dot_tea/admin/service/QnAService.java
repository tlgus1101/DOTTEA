package Dot_tea.admin.service;

import java.util.List;
import java.util.Map;

public interface QnAService {

	List<Map<String, Object>> qnaList(Map<String, Object> map) throws Exception;

	Map<String, Object> qnaView(Map<String, Object> map) throws Exception;

}
