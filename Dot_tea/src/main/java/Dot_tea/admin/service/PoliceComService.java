package Dot_tea.admin.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface PoliceComService {

	List<Map<String, Object>> reportComList(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> reportBlComList(Map<String, Object> map) throws Exception;

	Map<String, Object> reportComView(Map<String, Object> map) throws Exception;
	
	Map<String, Object> reportComBView(Map<String, Object> map) throws Exception;
	
	Map<String, Object> c_mView(Map<String, Object> map) throws Exception;
	
	void updateStatus1(Map<String, Object> map) throws Exception;

	void cancelStatus1(Map<String, Object> map) throws Exception;

	void updateStatus2(Map<String, Object> map) throws Exception;

	void updateApproval(Map<String, Object> map) throws Exception;
	
	void reportComDelete (Map<String, Object> map) throws Exception;

}
