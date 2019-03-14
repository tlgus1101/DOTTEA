package Dot_tea.admin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import Dot_tea.admin.dao.ComManagementDAO;

@Service("c_mService")
public class ComManagementServiceImpl implements ComManagementService {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "c_mDAO")
	private ComManagementDAO c_mDAO;

	/*
	 * // 리스트
	 * 
	 * @Override public List<Map<String, Object>> noticeList(Map<String, Object>
	 * map) throws Exception { return noticeDAO.noticeList(map); }
	 */

	// 페이징 리스트
	@Override
	public List<Map<String, Object>> c_mList(Map<String, Object> map) throws Exception {
		String key = (String) map.get("searchType");
		String keyword = (String) map.get("keyword");
		if (key == null) {
			// map.put("search", "AND TITLE LIKE '%%'");
			map.put("searchType", "MEM_COM_NAME");
			map.put("keyword", "%%");

		}

//			map.put("searchType", "TITLE");
//			map.put("keyword", "%" + keyword + "%");
		else {
			if (key.equals("1")) {
				map.put("searchType", "MEM_COM_NAME");
				map.put("keyword", "%" + keyword + "%");
			} else if (key.equals("2")) {
				map.put("searchType", "MEM_COM_NAME");
				map.put("keyword", "%" + keyword + "%");
			}
		}

//			if(key.equals("1"))
//			{
//				map.put("search", "AND  CONTENTS  LIKE  '%"+keyword+"%'");
//			}else if(key.equals("2"))
//			{
//				map.put("search", "AND  TITLE  LIKE  '%"+keyword+"%'");
//			}else if(key.equals("3"))
//			{
//				map.put("search", "AND  TITLE  LIKE  '%"+keyword+"%'" +  "OR CONTENTS  LIKE  '%"+keyword+"%'" );
//			}
//			else {
//				map.put("search", "AND  TITLE  LIKE  '%%'");
//			}

		return c_mDAO.c_mList(map);
	}

	// 글 상세보기
	@Override
	public Map<String, Object> c_mView(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = c_mDAO.c_mView(map);
		return resultMap;
	}

	// 글 수정
	@Override
	public void c_mUpdate(Map<String, Object> map) throws Exception {
		c_mDAO.c_mUpdate(map);

	}

	// 탈퇴
	@Override
	public void c_mDelete(Map<String, Object> map) throws Exception {
		c_mDAO.c_mDelete(map);
	}

}
