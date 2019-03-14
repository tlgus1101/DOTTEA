package Dot_tea.admin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import Dot_tea.admin.dao.UserManagementDAO;

@Service("u_mService")
public class UserManagementServiceImpl implements UserManagementService {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "u_mDAO")
	private UserManagementDAO u_mDAO;

	/*
	 * // 리스트
	 * 
	 * @Override public List<Map<String, Object>> noticeList(Map<String, Object>
	 * map) throws Exception { return noticeDAO.noticeList(map); }
	 */

	// 페이징 리스트
	@Override
	public List<Map<String, Object>> u_mList(Map<String, Object> map) throws Exception {
		String key = (String) map.get("searchType");
		String keyword = (String) map.get("keyword");
		if (key == null) {
			// map.put("search", "AND TITLE LIKE '%%'");
			map.put("searchType", "MEM_USER_USERNAME");
			map.put("keyword", "%%");

		}

//			map.put("searchType", "TITLE");
//			map.put("keyword", "%" + keyword + "%");
		else {
			if (key.equals("1")) {
				map.put("searchType", "MEM_USER_USERNAME");
				map.put("keyword", "%" + keyword + "%");
			} else if (key.equals("2")) {
				map.put("searchType", "MEM_USER_USERNAME");
				map.put("keyword", "%" + keyword + "%");
			}
		}

		return u_mDAO.u_mList(map);
	}

	// 글 상세보기
	@Override
	public Map<String, Object> u_mView(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = u_mDAO.u_mView(map);
		return resultMap;
	}

	// 글 수정
	@Override
	public void u_mUpdate(Map<String, Object> map) throws Exception {
		u_mDAO.u_mUpdate(map);

	}

	// 글 삭제
	@Override
	public void u_mDelete(Map<String, Object> map) throws Exception {
		u_mDAO.u_mDelete(map);
	}

}
