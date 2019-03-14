package Dot_tea.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import Dot_tea.member.dao.AbstractDAO;

@Repository("noticeDAO")
public class NoticeDAO extends AbstractDAO {

	/*@SuppressWarnings("unchecked")
	public List<Map<String, Object>> noticeList(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("notice.noticeList", map);
	}*/

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> noticeList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>) selectPagingList("notice.noticeList", map);
	}
	
	public void noticeWrite(Map<String, Object> map) throws Exception {
		insert("notice.noticeWrite", map);
	}
	
	public void noticeFileUpdate(Map<String, Object> map) throws Exception{
		update("notice.noticeFileUpdate", map);
	}
		
/*	public void updateReadhit(Map<String, Object> map) throws Exception{
		update("notice.updateReadhit", map);
	}*/
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> noticeView(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("notice.noticeView", map);
	}
	
	public void noticeUpdate(Map<String, Object> map) throws Exception{
		update("notice.noticeUpdate", map);
	}
	
	public void noticeDelete(Map<String, Object> map) throws Exception{
		delete("notice.noticeDelete", map);
	}
	
	
}
