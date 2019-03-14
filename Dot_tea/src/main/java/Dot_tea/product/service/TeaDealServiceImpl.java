package Dot_tea.product.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import Dot_tea.common.util.FileUtils;
import Dot_tea.product.dao.TeaDealDAO;

@Service("teaDealService")
public class TeaDealServiceImpl implements TeaDealService {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "teaDealDAO")
	private TeaDealDAO teaShopDAO;

	@Override
	public List<Map<String, Object>> selectMainTeaRecommendList(Map<String, Object> map) throws Exception {
		return teaShopDAO.selectMainTeaRecommendList(map);
	}

	@Override
	public List<Map<String, Object>> selectTeaList(Map<String, Object> map) throws Exception {

		return teaShopDAO.selectTeaList(map);
	}

	@Override
	public List<Map<String, Object>> searchTeaDealList(Map<String, Object> map) throws Exception {

		return teaShopDAO.searchTeaDealList(map);
	}

	@Override
	public List<Map<String, Object>> selectTeaTotalList(Map<String, Object> map) throws Exception {

		return teaShopDAO.selectTeaTotalList(map);
	}

	@Override
	public Map<String, Object> selectTeaDealDetail(Map<String, Object> map) throws Exception {

		return teaShopDAO.selectTeaDealDetail(map);
	}

	@Override
	public List<Map<String, Object>> teaAccList(Map<String, Object> map) throws Exception {
		return teaShopDAO.selectTeaList(map);
	}

	@Override
	public List<Map<String, Object>> teaEventList(Map<String, Object> map) throws Exception {
		return teaShopDAO.selectTeaList(map);
	}

	@Override
	public void likeDeal(Map<String, Object> map) throws Exception {
		teaShopDAO.likeDeal(map);
	}

}