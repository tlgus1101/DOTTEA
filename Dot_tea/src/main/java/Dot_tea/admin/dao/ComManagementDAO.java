package Dot_tea.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import Dot_tea.member.dao.AbstractDAO;

@Repository("c_mDAO")
public class ComManagementDAO extends AbstractDAO {

	/*
	 * @SuppressWarnings("unchecked") public List<Map<String, Object>>
	 * noticeList(Map<String, Object> map) { return (List<Map<String, Object>>)
	 * selectList("notice.noticeList", map); }
	 */

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> c_mList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectPagingList("c_management.c_mList", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> c_mView(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("c_management.c_mView", map);
	}

	public void c_mUpdate(Map<String, Object> map) throws Exception {
		update("c_management.c_mUpdate", map);
	}

	public void c_mDelete(Map<String, Object> map) throws Exception {
		update("c_management.c_mDelete", map);
	}

}
