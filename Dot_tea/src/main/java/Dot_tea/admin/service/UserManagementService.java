package Dot_tea.admin.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface UserManagementService {
	
	List<Map<String, Object>> u_mList(Map<String, Object> map) throws Exception;
		
	Map<String, Object> u_mView(Map<String, Object> map) throws Exception;
	
	void u_mUpdate(Map<String, Object> map) throws Exception;
	
	void u_mDelete(Map<String, Object> map) throws Exception;
	
}
