package Dot_tea.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import Dot_tea.member.dao.AbstractDAO;


@Repository("reviewDAO")
public class ReviewDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> reviewList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectPagingList("re.reviewList", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> reviewView(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("re.reviewView", map);
	}

}
