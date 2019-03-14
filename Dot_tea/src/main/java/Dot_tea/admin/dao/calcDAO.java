package Dot_tea.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import Dot_tea.member.dao.AbstractDAO;

@Repository("calcDAO")
public class calcDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> calcList(Map<String, Object> map) throws Exception {

		return (List<Map<String, Object>>) selectPagingList("calc.calculationList", map);
	}

	public List<Map<String, Object>> calcBList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>) selectPagingList("calc.calculationBlackList", map);
	}
}
