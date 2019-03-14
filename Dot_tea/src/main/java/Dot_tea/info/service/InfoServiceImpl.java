package Dot_tea.info.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import Dot_tea.info.dao.InfoDAO;

@Service("infoService")
public class InfoServiceImpl implements InfoService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="infoDAO")
	private InfoDAO infoDAO;
	
	@Override
	public Map<String, Object> MyInfo(Map<String, Object> map) throws Exception {
	    Map<String, Object> resultMap = infoDAO.MyInfo(map);
	    return resultMap;
	}
	
	@Override
	public void infoUpdate(Map<String, Object> map) throws Exception {
		infoDAO.infoUpdate(map);
	}
	
	@Override
	public void infoDelete(Map<String, Object> map) throws Exception {
		infoDAO.infoDelete(map);
	}
	
	@Override
	public Map<String, Object> memberCheck(Map<String, Object> map) throws Exception {
	    Map<String, Object> resultMap = infoDAO.memberCheck(map);
	    // map: password & MEM_USER_NO 두 개 값 뿐임
	    return resultMap;
	}

}
