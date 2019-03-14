package Dot_tea.shop.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import Dot_tea.member.dao.AbstractDAO;

@Repository("com_qnaDAO")
public class Com_QnaDAO extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> QnaBoardList(Map<String, Object> map) throws Exception{
		 return (Map<String, Object>)selectPagingList2("comQnA.comQnAList", map);

	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> QnaCompanyList(Map<String, Object> map) throws Exception{
		 return (Map<String, Object>)selectPagingList2("comQnA.companyQnAList", map);

	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> QnaBoardDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("comQnA.comQnADetail", map);
	}
	public void QnAwrite(Map<String, Object> map) throws Exception{
		insert("comQnA.QnAwrite", map);
	}	
	
	public void comQnAreply(Map<String, Object> map) throws Exception{
	insert("comQnA.comQnAreply", map);
}	
	public void replyupdate(Map<String, Object> map) throws Exception{
		update("comQnA.QnAreplyUp", map);
	}
	public void replyCheck(Map<String, Object> map) throws Exception{
		update("comQnA.replyCheck", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> QnaDealNo(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("comQnA.DEALNO", map);
	}
	public void QnAupdate(Map<String, Object> map) throws Exception{
		update("comQnA.QnAupdate", map);
	}
	
	public void QnAdelete(Map<String, Object> map) throws Exception{
		update("comQnA.QnAdelete", map);
	}
	
	public void QnAupdatereply(Map<String, Object> map) throws Exception{
		update("comQnA.QnAupdatereply", map);
	}
	
}
