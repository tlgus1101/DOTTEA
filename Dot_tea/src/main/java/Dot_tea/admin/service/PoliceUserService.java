package Dot_tea.admin.service;

import java.util.List;
import java.util.Map;


import org.springframework.transaction.annotation.Transactional;

@Transactional
public interface PoliceUserService {
	
	List<Map<String, Object>> reportUserList(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> reportBlUserList(Map<String, Object> map) throws Exception;
	
	Map<String, Object> reportUserView(Map<String, Object> map) throws Exception;
	
	Map<String, Object> reportUserBView(Map<String, Object> map) throws Exception;
	
	Map<String, Object> u_mView(Map<String, Object> map) throws Exception;
	
	void updateStatus1(Map<String, Object> map) throws Exception;
	
	void cancelStatus1(Map<String, Object> map) throws Exception;
	
	void updateStatus2(Map<String, Object> map) throws Exception;
	
	void updateApproval(Map<String, Object> map) throws Exception;
	
	void reportUserDelete (Map<String, Object> map) throws Exception;
	
}
