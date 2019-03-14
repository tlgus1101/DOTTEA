package Dot_tea.admin.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;

import Dot_tea.member.dao.AbstractDAO;

@Repository("policeUserDAO")
public class PoliceUserDAO extends AbstractDAO {

	/*@SuppressWarnings("unchecked")
	public List<Map<String, Object>> noticeList(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("notice.noticeList", map);
	}*/

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> reportUserList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>) selectPagingList("policeUser.reportUserList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> reportBlUserList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>) selectPagingList("policeUser.reportBlUserList", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> reportUserView(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("policeUser.reportUserView", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> reportUserBView(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("policeUser.reportUserBView", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> u_mView(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("policeUser.u_mView", map);
	}
	
	
	public void refusalUserUpdate(Map<String, Object> map) throws Exception{
		update("policeUser.refusalUserUpdate", map);
	}
	
	public void updateStatus1(Map<String, Object> map) throws Exception{
		update("policeUser.updateStatus1", map);
	}
	
	public void cancelStatus1(Map<String, Object> map) throws Exception{
		update("policeUser.cancelStatus1", map);
	}
	
	public void updateStatus2(Map<String, Object> map) throws Exception{
		update("policeUser.updateStatus2", map);
	}
	
	public void updateApproval(Map<String, Object> map) throws Exception{
		update("policeUser.updateApproval", map);
	}
	
	public void reportUserRevDelete(Map<String, Object> map) throws Exception {
		update("policeUser.reportUserRevDelete", map);
	}
	
	public void reportUserInsert(Map<String, Object> map) throws Exception {
		insert("policeUser.reportUserInsert", map);
	}
	
	public void reportUserDelete(Map<String, Object> map) throws Exception{
		delete("policeUser.reportUserDelete", map);
	}
	
	
}
