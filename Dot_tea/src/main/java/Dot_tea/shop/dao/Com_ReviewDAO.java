package Dot_tea.shop.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import Dot_tea.member.dao.AbstractDAO;

@Repository("com_reviewDAO")
public class Com_ReviewDAO extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> ReviewBoardList(Map<String, Object> map) throws Exception{
		 return (Map<String, Object>)selectPagingList2("review.reviewBoardList", map);

	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> ReviewCompanyList(Map<String, Object> map) throws Exception{
		 return (Map<String, Object>)selectPagingList2("review.reviewCompany", map);

	}
	
	public void ReviewInsert(Map<String, Object> map) throws Exception{
	insert("review.insertReview", map);
}	
	public void ReviewDelete(Map<String, Object> map) throws Exception {
		update("review.deleteReview", map);
	}
	
	public void policeInsert(Map<String, Object> map) throws Exception{
	insert("review.police", map);
}	

	@SuppressWarnings("unchecked")
	public Map<String, Object> policeDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("review.reviewDetail", map);
	}
}
