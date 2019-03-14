package Dot_tea.admin.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;

import Dot_tea.member.dao.AbstractDAO;

@Repository("policeComDAO")
public class PoliceComDAO extends AbstractDAO {

	/*
	 * @SuppressWarnings("unchecked") public List<Map<String, Object>>
	 * noticeList(Map<String, Object> map) { return (List<Map<String, Object>>)
	 * selectList("notice.noticeList", map); }
	 */

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> reportComList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectPagingList("policeCom.reportComList", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> reportBlComList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectPagingList("policeCom.reportBlComList", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> reportComView(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("policeCom.reportComView", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> reportComBView(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("policeCom.reportComBView", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> c_mView(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("policeCom.c_mView", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> blcomView(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("policeCom.blcomView", map);
	}

	public void refusalComUpdate(Map<String, Object> map) throws Exception {
		update("policeCom.refusalComUpdate", map);
	}

	public void updateStatus1(Map<String, Object> map) throws Exception {
		update("policeCom.updateStatus1", map);
	}

	public void cancelStatus1(Map<String, Object> map) throws Exception {
		update("policeCom.cancelStatus1", map);
	}

	public void updateStatus2(Map<String, Object> map) throws Exception {
		update("policeCom.updateStatus2", map);
	}

	public void updateApproval(Map<String, Object> map) throws Exception {
		update("policeCom.updateApproval", map);
	}
	
	public void reportComDealDelete(Map<String, Object> map) throws Exception {
		update("policeCom.reportComDealDelete", map);
	}

	public void reportComInsert(Map<String, Object> map) throws Exception {
		insert("policeCom.reportComInsert", map);
	}

	public void reportComDelete(Map<String, Object> map) throws Exception {
		delete("policeCom.reportComDelete", map);
	}

}
