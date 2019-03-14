package Dot_tea.admin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import Dot_tea.admin.dao.ReviewDAO;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "reviewDAO")
	private ReviewDAO reviewDAO;

	// 페이징 리스트
	@Override
	public List<Map<String, Object>> reviewList(Map<String, Object> map) throws Exception {
		String key = (String) map.get("searchType");
		String keyword = (String) map.get("keyword");
		if (key == null) {
			// map.put("search", "AND TITLE LIKE '%%'");
			map.put("searchType", "RE_SUBJECT");
			map.put("keyword", "%%");

		}

//			map.put("searchType", "TITLE");
//			map.put("keyword", "%" + keyword + "%");
		else {
			if (key.equals("1")) {
				map.put("searchType", "RE_CONTENT");
				map.put("keyword", "%" + keyword + "%");
			} else if (key.equals("2")) {
				map.put("searchType", "RE_SUBJECT");
				map.put("keyword", "%" + keyword + "%");
			}
		}

		return reviewDAO.reviewList(map);
	}

	// 글 상세보기
	@Override
	public Map<String, Object> reviewView(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = reviewDAO.reviewView(map);
		return resultMap;
	}

}
