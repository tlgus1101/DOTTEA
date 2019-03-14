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
import Dot_tea.shop.dao.ShopDAO;

@Service("shopService")
public class ShopServiceImpl implements ShopService {
Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="shopDAO")
	private ShopDAO shopDAO;
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Override
	public Map<String, Object> selectBoardList(Map<String, Object> map) throws Exception {
		return shopDAO.selectBoardList(map);
		
	}

	@Override
	public void insertBoard(Map<String, Object> map, HttpServletRequest request) throws Exception {
		shopDAO.insertBoard(map);
		
			
	}
	@Override
	public Map<String, Object> selectBoardDetail(Map<String, Object> map, HttpServletRequest request) throws Exception {
		Map<String, Object> resultMap = shopDAO.selectBoardDetail(map);
		
		
	/*	List<Map<String, Object>> list = shopDAO.selectFileList(map);
		resultMap.put("list", list);*/
		
		return resultMap;
	}


	@Override
	public void deleteBoard(Map<String, Object> map) throws Exception {
		shopDAO.deleteBoard(map);
	}

	@Override
	public void updateBoard(Map<String, Object> map, HttpServletRequest request) throws Exception {
		shopDAO.updateBoard(map);
		
		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(map, request);
		for(int i=0, size=list.size(); i<size; i++) {
			shopDAO.uploadimage(list.get(i));
		}
		
	
	}

	@Override
	public void uploadimage(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(map, request);
		for(int i=0, size=list.size(); i<size; i++) {
			shopDAO.uploadimage(list.get(i));
		}
		
		
	}

}