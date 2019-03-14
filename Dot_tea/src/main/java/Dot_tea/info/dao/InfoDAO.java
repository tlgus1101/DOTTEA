package Dot_tea.info.dao;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import Dot_tea.member.dao.AbstractDAO;

@Repository("infoDAO")
public class InfoDAO extends AbstractDAO {
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> MyInfo(Map<String, Object> map) throws Exception{
	    return (Map<String, Object>) selectOne("UserShop.MyInfo", map);
	}
	
	public void infoUpdate(Map<String, Object> map) throws Exception{
		update("UserShop.updateInfo", map);
	}
	
	public void infoDelete(Map<String, Object> map) throws Exception{
		update("UserShop.infoDelete", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> memberCheck(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("UserShop.checkPassword", map);
	}
	
}
