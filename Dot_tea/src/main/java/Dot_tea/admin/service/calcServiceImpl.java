package Dot_tea.admin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import Dot_tea.admin.dao.calcDAO;

@Service("calcService")
public class calcServiceImpl implements calcService {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "calcDAO")
	private calcDAO calcDAO;

	@Override
	public List<Map<String, Object>> calcList(Map<String, Object> map) throws Exception {
		return calcDAO.calcList(map);
	}

	@Override
	public List<Map<String, Object>> calcBList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return calcDAO.calcBList(map);
	}

}
