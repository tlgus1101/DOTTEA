package Dot_tea.admin.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface ComManagementService {

	List<Map<String, Object>> c_mList(Map<String, Object> map) throws Exception;

	Map<String, Object> c_mView(Map<String, Object> map) throws Exception;

	void c_mUpdate(Map<String, Object> map) throws Exception;

	void c_mDelete(Map<String, Object> map) throws Exception;

}
