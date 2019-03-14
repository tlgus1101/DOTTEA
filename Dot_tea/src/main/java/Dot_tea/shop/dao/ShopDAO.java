package Dot_tea.shop.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import Dot_tea.member.dao.AbstractDAO;
@Repository("shopDAO")
public class ShopDAO extends AbstractDAO {
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectBoardList(Map<String, Object> map) throws Exception{
		 return (Map<String, Object>)selectPagingList2("ComShop.selectBoardList", map);

	}
	
/*	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectFileList(Map<String,Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("shop.selectFileList", map);
	}
*/
	public void insertBoard(Map<String, Object> map) throws Exception{
		insert("ComShop.insertBoard", map);
	}
	
	public void uploadimage(Map<String, Object> map)throws Exception{
		update("ComShop.insertFile",map);
	}

	/*public void updateHitCnt(Map<String, Object> map) throws Exception{
		update("shop.updateHitCnt", map);
	}*/

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("ComShop.selectBoardDetail", map);
	}

	public void updateBoard(Map<String, Object> map) throws Exception{
		update("ComShop.updateBoard", map);
	}

	public void deleteBoard(Map<String, Object> map) throws Exception{
		update("ComShop.deleteBoard", map);
	}
	
//	public void deleteFileList(Map<String,Object>map)throws Exception{
//		update("sample.deleteFileList",map);
//	}
//	public void updateFile(Map<String, Object> map)throws Exception{
//		update("sample.updateFile",map);
//	}

}
