package Dot_tea.write.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import Dot_tea.write.dao.WriteDAO;

@Service("writeService")
public class WriteServiceImpl implements WriteService {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "writeDAO")
	private WriteDAO writeDAO;

	@Override
	public List<Map<String, Object>> qnaBoardList(Map<String, Object> map) throws Exception {
		return writeDAO.qnaBoardList(map);
	}

	@Override
	public List<Map<String, Object>> qnaPagingList(Map<String, Object> map) throws Exception {
		return writeDAO.qnaPagingList(map);
	}

	@Override
	public List<Map<String, Object>> reviewPagingList(Map<String, Object> map) throws Exception {
		return writeDAO.reviewPagingList(map);
	}

	@Override
	public Map<String, Object> qnaBoardDetail(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = writeDAO.qnaBoardDetail(map);
		return resultMap;
	}

	@Override
	public Map<String, Object> reviewBoardDetail(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = writeDAO.reviewBoardDetail(map);
		return resultMap;
	}

	@Override
	public void qnaUpdate(Map<String, Object> map) throws Exception {
		writeDAO.qnaUpdate(map);
	}

	@Override
	public void qnaDelete(Map<String, Object> map) throws Exception {
		writeDAO.qnaDelete(map);
	}

	@Override
	public void reviewUpdate(Map<String, Object> map) throws Exception {
		writeDAO.reviewUpdate(map);
	}

	@Override
	public void reviewDelete(Map<String, Object> map) throws Exception {
		writeDAO.reviewDelete(map);
	}

	@Override
	public List<Map<String, Object>> qnaSearchList(Map<String, Object> map) throws Exception {
		return writeDAO.qnaSearchList(map);
	}

	@Override
	public List<Map<String, Object>> reviewSearchList(Map<String, Object> map) throws Exception {
		return writeDAO.reviewSearchList(map);
	}

	@Override
	public List<Map<String, Object>> miniReivew(Map<String, Object> map) throws Exception {
		return writeDAO.miniReview(map);
	}

}
