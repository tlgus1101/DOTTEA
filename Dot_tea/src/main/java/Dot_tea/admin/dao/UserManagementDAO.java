package Dot_tea.admin.dao;

import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Repository;

import Dot_tea.member.dao.AbstractDAO;


@Repository("u_mDAO")
public class UserManagementDAO extends AbstractDAO {

	/*
	 * @SuppressWarnings("unchecked") public List<Map<String, Object>>
	 * noticeList(Map<String, Object> map) { return (List<Map<String, Object>>)
	 * selectList("notice.noticeList", map); }
	 */

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> u_mList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectPagingList("u_managerment.u_mList", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> u_mView(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("u_managerment.u_mView", map);
	}

	public void u_mUpdate(Map<String, Object> map) throws Exception {
		update("u_managerment.u_mUpdate", map);
	}

	public void u_mDelete(Map<String, Object> map) throws Exception {
		delete("u_managerment.u_mDelete", map);
	}

	

}
