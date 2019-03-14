package Dot_tea.admin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import Dot_tea.admin.dao.PoliceUserDAO;

@Service("policeUserService")
public class PoliceUserServiceImpl implements PoliceUserService {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "policeUserDAO")
	private PoliceUserDAO policeUserDAO;

	// 페이징 리스트
	@Override
	public List<Map<String, Object>> reportUserList(Map<String, Object> map) throws Exception {
		String key = (String) map.get("searchType");
		String keyword = (String) map.get("keyword");
		if (key == null) {
			// map.put("search", "AND TITLE LIKE '%%'");
			map.put("searchType", "P_USER_SUBJECT");
			map.put("keyword", "%%");

		}

//			map.put("searchType", "TITLE");
//			map.put("keyword", "%" + keyword + "%");
		else {
			if (key.equals("1")) {
				map.put("searchType", "P_USER_SUBJECT");
				map.put("keyword", "%" + keyword + "%");
			} else if (key.equals("2")) {
				map.put("searchType", "P_REPORTER_ID");
				map.put("keyword", "%" + keyword + "%");
			}
		}

		return policeUserDAO.reportUserList(map);
	}
	
	@Override
	public List<Map<String, Object>> reportBlUserList(Map<String, Object> map) throws Exception {
		String key = (String) map.get("searchType");
		String keyword = (String) map.get("keyword");
		if (key == null) {
			// map.put("search", "AND TITLE LIKE '%%'");
			map.put("searchType", "P_USER_SUBJECT");
			map.put("keyword", "%%");

		}

//			map.put("searchType", "TITLE");
//			map.put("keyword", "%" + keyword + "%");
		else {
			if (key.equals("1")) {
				map.put("searchType", "P_USER_SUBJECT");
				map.put("keyword", "%" + keyword + "%");
			} else if (key.equals("2")) {
				map.put("searchType", "P_REPORTER_ID");
				map.put("keyword", "%" + keyword + "%");
			}
		}

		return policeUserDAO.reportBlUserList(map);
	}
	

	// 글 상세보기
	@Override
	public Map<String, Object> reportUserView(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = policeUserDAO.reportUserView(map);
		return resultMap;
	}

	@Override
	public Map<String, Object> reportUserBView(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = policeUserDAO.reportUserBView(map);
		return resultMap;
	}

	// 글 상세보기
	@Override
	public Map<String, Object> u_mView(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = policeUserDAO.u_mView(map);
		return resultMap;
	}

	@Override
	public void updateStatus1(Map<String, Object> map) throws Exception {
		policeUserDAO.updateStatus1(map);
		policeUserDAO.reportUserRevDelete(map);
	}

	@Override
	public void cancelStatus1(Map<String, Object> map) throws Exception {
		policeUserDAO.cancelStatus1(map);
	}

	// 거절
	@Override
	public void updateStatus2(Map<String, Object> map) throws Exception {
		policeUserDAO.refusalUserUpdate(map);
		policeUserDAO.updateStatus2(map);

	}

	@Override
	public void updateApproval(Map<String, Object> map) throws Exception {
		policeUserDAO.updateApproval(map);

	}

	@Override
	public void reportUserDelete(Map<String, Object> map) throws Exception {
		policeUserDAO.reportUserInsert(map);
		policeUserDAO.reportUserDelete(map);
		
	}
	
	

}
