package Dot_tea.admin.service;

import java.util.List;
import java.util.Map;


public interface BlUserService {

	List<Map<String, Object>> bluserList(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> bluserPoliceList(Map<String, Object> map) throws Exception;

	Map<String, Object> bluserView(Map<String, Object> map) throws Exception;

	void bluserUpdate(Map<String, Object> map) throws Exception;
	
	void bluserDelete(Map<String, Object> map) throws Exception;
	
}
