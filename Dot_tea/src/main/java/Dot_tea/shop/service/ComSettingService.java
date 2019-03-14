package Dot_tea.shop.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface ComSettingService {
	
	Map<String, Object> comSettingView(Map<String, Object> map, HttpServletRequest request) throws Exception;
	
	void comSettingupdate(Map<String, Object> map, HttpServletRequest request) throws Exception;
	
	void comSettingdelete(Map<String, Object> map) throws Exception;

	
	

}
