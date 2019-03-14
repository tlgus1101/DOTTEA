package Dot_tea.admin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import Dot_tea.admin.dao.PoliceComDAO;

@Service("policeComService")
public class PoliceComServiceImpl implements PoliceComService {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "policeComDAO")
	private PoliceComDAO policeComDAO;

	// 페이징 리스트
	@Override
	public List<Map<String, Object>> reportComList(Map<String, Object> map) throws Exception {
		String key = (String) map.get("searchType");
		String keyword = (String) map.get("keyword");
		if (key == null) {
			// map.put("search", "AND TITLE LIKE '%%'");
			map.put("searchType", "P_Com_SUBJECT");
			map.put("keyword", "%%");

		}

//			map.put("searchType", "TITLE");
//			map.put("keyword", "%" + keyword + "%");
		else {
			if (key.equals("1")) {
				map.put("searchType", "P_Com_SUBJECT");
				map.put("keyword", "%" + keyword + "%");
			} else if (key.equals("2")) {
				map.put("searchType", "P_REPORTER_ID");
				map.put("keyword", "%" + keyword + "%");
			}
		}

		return policeComDAO.reportComList(map);
	}
	
	@Override
	public List<Map<String, Object>> reportBlComList(Map<String, Object> map) throws Exception {
		String key = (String) map.get("searchType");
		String keyword = (String) map.get("keyword");
		if (key == null) {
			// map.put("search", "AND TITLE LIKE '%%'");
			map.put("searchType", "P_Com_SUBJECT");
			map.put("keyword", "%%");

		}

//			map.put("searchType", "TITLE");
//			map.put("keyword", "%" + keyword + "%");
		else {
			if (key.equals("1")) {
				map.put("searchType", "P_Com_SUBJECT");
				map.put("keyword", "%" + keyword + "%");
			} else if (key.equals("2")) {
				map.put("searchType", "P_REPORTER_ID");
				map.put("keyword", "%" + keyword + "%");
			}
		}

		return policeComDAO.reportBlComList(map);
	}

	// 글 상세보기
	@Override
	public Map<String, Object> reportComView(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = policeComDAO.reportComView(map);
		return resultMap;
	}

	@Override
	public Map<String, Object> reportComBView(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = policeComDAO.reportComBView(map);
		return resultMap;
	}

	@Override
	public Map<String, Object> c_mView(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = policeComDAO.c_mView(map);
		return resultMap;
	}

	@Override
	public void updateStatus1(Map<String, Object> map) throws Exception {
		policeComDAO.updateStatus1(map);
		policeComDAO.reportComDealDelete(map);
	}

	@Override
	public void cancelStatus1(Map<String, Object> map) throws Exception {
		policeComDAO.cancelStatus1(map);
	}

	// 거절
	@Override
	public void updateStatus2(Map<String, Object> map) throws Exception {
		policeComDAO.refusalComUpdate(map);
		policeComDAO.updateStatus2(map);

	}

	@Override
	public void updateApproval(Map<String, Object> map) throws Exception {
		policeComDAO.updateApproval(map);

	}

	@Override
	public void reportComDelete(Map<String, Object> map) throws Exception {
		policeComDAO.reportComInsert(map);
		policeComDAO.reportComDelete(map);

	}

}
