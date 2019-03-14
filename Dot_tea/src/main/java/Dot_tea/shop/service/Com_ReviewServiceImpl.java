package Dot_tea.shop.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.management.loading.MLet;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import Dot_tea.setting.CommandMap;
import Dot_tea.common.util.FileUtils;
import Dot_tea.shop.dao.Com_ReviewDAO;
import Dot_tea.shop.dao.ShopDAO;

@Service("com_reviewService")
public class Com_ReviewServiceImpl implements Com_ReviewService {
Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="com_reviewDAO")
	private Com_ReviewDAO com_reviewDAO;
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Override
	public Map<String, Object> reviewBoardList(Map<String, Object> map) throws Exception {
		return com_reviewDAO.ReviewBoardList(map);
		
	}

	@Override
	public void reviewinsert(Map<String, Object> map) throws Exception {
		com_reviewDAO.ReviewInsert(map);
		
	}

	@Override
	public void reviewdelete(Map<String, Object> map) throws Exception {
		com_reviewDAO.ReviewDelete(map);
	}

	@Override
	public Map<String, Object> reviewCompany(Map<String, Object> map) throws Exception {
		return com_reviewDAO.ReviewCompanyList(map);
	}

	@Override
	public void reviewPolice(Map<String, Object> map) throws Exception {
		com_reviewDAO.policeInsert(map);
		
	}

	@Override
	public Map<String, Object> PoliceReviewDE(Map<String, Object> map) throws Exception {
		
		return com_reviewDAO.policeDetail(map);
	}
	

}
