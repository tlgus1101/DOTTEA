package Dot_tea.admin.dao;

import java.util.List;
import java.util.Map;
import Dot_tea.member.dao.AbstractDAO;
import org.springframework.stereotype.Repository;

@Repository("bluserDAO")
public class BlUserDAO extends AbstractDAO {

	/*
	 * @SuppressWarnings("unchecked") public List<Map<String, Object>>
	 * noticeList(Map<String, Object> map) { return (List<Map<String, Object>>)
	 * selectList("notice.noticeList", map); }
	 */

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> bluserList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectPagingList("bluser.bluserList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> bluserPoliceList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("bluser.bluserPoliceList", map);
	}
	

	@SuppressWarnings("unchecked")
	public Map<String, Object> bluserView(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("bluser.bluserView", map);
	}
	
	public void bluserUpdate(Map<String, Object> map) throws Exception {
		update("bluser.bluserUpdate", map);
	}

	public void bluserDelete(Map<String, Object> map) throws Exception {
		delete("bluser.bluserDelete", map);
	}

}
