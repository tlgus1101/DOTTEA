package Dot_tea.admin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import Dot_tea.admin.dao.BlComDAO;
import Dot_tea.admin.dao.ComManagementDAO;

@Service("blcomService")
public class BlComServiceImpl implements BlComService {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "blcomDAO")
	private BlComDAO blcomDAO;

	// 페이징 리스트
	@Override
	public List<Map<String, Object>> blcomList(Map<String, Object> map) throws Exception {

		return blcomDAO.blcomList(map);
	}

	@Override
	public List<Map<String, Object>> blcomPoliceList(Map<String, Object> map) throws Exception {

		return blcomDAO.blcomPoliceList(map);
	}
	
	// 글 상세보기
	@Override
	public Map<String, Object> blcomView(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = blcomDAO.blcomView(map);
		return resultMap;
	}

	// 글 수정
	@Override
	public void blcomUpdate(Map<String, Object> map) throws Exception {
		blcomDAO.blcomUpdate(map);

	}

	// 탈퇴
	@Override
	public void blcomDelete(Map<String, Object> map) throws Exception {
		blcomDAO.blcomDelete(map);
	}

}
