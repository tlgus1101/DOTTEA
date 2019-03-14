package Dot_tea.admin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import Dot_tea.admin.dao.QnADAO;
import Dot_tea.admin.dao.ReviewDAO;

@Service("qnaService")
public class QnAServiceImpl implements QnAService {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "qnaDAO")
	private QnADAO qnaDAO;

	// 페이징 리스트
	@Override
	public List<Map<String, Object>> qnaList(Map<String, Object> map) throws Exception {
		String key = (String) map.get("searchType");
		String keyword = (String) map.get("keyword");
		if (key == null) {
			// map.put("search", "AND TITLE LIKE '%%'");
			map.put("searchType", "QA_SUBJECT");
			map.put("keyword", "%%");

		}

//			map.put("searchType", "TITLE");
//			map.put("keyword", "%" + keyword + "%");
		else {
			if (key.equals("1")) {
				map.put("searchType", "QA_SUBJECT");
				map.put("keyword", "%" + keyword + "%");
			} else if (key.equals("2")) {
				map.put("searchType", "DEAL_NO");
				map.put("keyword", "%" + keyword + "%");
			}
		}

		return qnaDAO.qnaList(map);
	}

	// 글 상세보기
	@Override
	public Map<String, Object> qnaView(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = qnaDAO.qnaView(map);
		return resultMap;
	}

}
