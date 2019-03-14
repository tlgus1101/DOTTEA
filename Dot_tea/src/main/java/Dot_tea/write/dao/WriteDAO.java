package Dot_tea.write.dao;

import java.util.List;
import java.util.Map;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import Dot_tea.member.dao.AbstractDAO;

@Repository("writeDAO")
public class WriteDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> qnaBoardList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("UserShop.MyQnaList", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> qnaPagingList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectPagingList("UserShop.qnaBoardList", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> reviewPagingList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectPagingList("UserShop.reviewBoardList", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> qnaBoardDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("UserShop.qnaBoardDetail", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> reviewBoardDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("UserShop.reviewBoardDetail", map);
	}

	public void qnaUpdate(Map<String, Object> map) throws Exception {
		update("UserShop.qnaUpdate", map);
	}

	public void qnaDelete(Map<String, Object> map) throws Exception {
		update("UserShop.qnaDelete", map);
	}

	public void reviewUpdate(Map<String, Object> map) throws Exception {
		update("UserShop.reviewUpdate", map);
	}

	public void reviewDelete(Map<String, Object> map) throws Exception {
		update("UserShop.reviewDelete", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> qnaSearchList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectPagingList("UserShop.qnaSearchList", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> reviewSearchList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectPagingList("UserShop.reviewSearchList", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> miniReview(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("UserShop.minireviewList", map);
	}

}
