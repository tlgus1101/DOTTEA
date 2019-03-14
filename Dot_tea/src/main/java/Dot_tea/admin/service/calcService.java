package Dot_tea.admin.service;

import java.util.List;
import java.util.Map;

public interface calcService {

	List<Map<String, Object>> calcList(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> calcBList(Map<String, Object> map) throws Exception;

}
