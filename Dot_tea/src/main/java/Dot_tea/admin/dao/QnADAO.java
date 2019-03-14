package Dot_tea.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import Dot_tea.member.dao.AbstractDAO;

@Repository("qnaDAO")
public class QnADAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> qnaList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectPagingList("qa.qnaList", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> qnaView(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("qa.qnaView", map);
	}

}
