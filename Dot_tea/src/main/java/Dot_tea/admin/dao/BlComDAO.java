package Dot_tea.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import Dot_tea.member.dao.AbstractDAO;

@Repository("blcomDAO")
public class BlComDAO extends AbstractDAO {

	/*
	 * @SuppressWarnings("unchecked") public List<Map<String, Object>>
	 * noticeList(Map<String, Object> map) { return (List<Map<String, Object>>)
	 * selectList("notice.noticeList", map); }
	 */

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> blcomList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectPagingList("blcom.blcomList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> blcomPoliceList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("blcom.blcomPoliceList", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> blcomView(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("blcom.blcomView", map);
	}
	
	public void blcomUpdate(Map<String, Object> map) throws Exception {
		update("blcom.blcomUpdate", map);
	}

	public void blcomDelete(Map<String, Object> map) throws Exception {
		update("blcom.blcomDelete", map);
	}

}
