package Dot_tea.product.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import Dot_tea.member.dao.AbstractDAO;

@Repository("teaDealDAO")
public class TeaDealDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMainTeaRecommendList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("deal.selectMainTeaRecommendList", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectTeaList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectPagingList("deal.selectTeaList", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectTeaTotalList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectPagingList("deal.selectTeaTotalList", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectTeaDealDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("deal.selectTeaDealDetail", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> searchTeaDealList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectPagingList("deal.searchTeaDealList", map);
	}

	public void likeDeal(Map<String, Object> map) {
		update("deal.likeDeal", map);

	}
}