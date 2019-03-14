package Dot_tea.admin.service;

import java.util.List;
import java.util.Map;


public interface BlComService {

	List<Map<String, Object>> blcomList(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> blcomPoliceList(Map<String, Object> map) throws Exception;

	Map<String, Object> blcomView(Map<String, Object> map) throws Exception;

	void blcomUpdate(Map<String, Object> map) throws Exception;

	void blcomDelete(Map<String, Object> map) throws Exception;
}
