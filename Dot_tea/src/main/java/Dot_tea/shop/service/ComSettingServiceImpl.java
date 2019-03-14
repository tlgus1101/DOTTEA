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
import Dot_tea.shop.dao.com_SettingDAO;

@Service("comsettingService")
public class ComSettingServiceImpl implements ComSettingService  {
Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="settingDAO")
	private com_SettingDAO settingDAO;
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;

	@Override
	public Map<String, Object> comSettingView(Map<String, Object> map, HttpServletRequest request) throws Exception {
		Map<String, Object> resultMap = settingDAO.comSettingView(map);
		return resultMap;
		
	}

	@Override
	public void comSettingupdate(Map<String, Object> map, HttpServletRequest request) throws Exception {
		settingDAO.comSettingUpdate(map);
	}

	@Override
	public void comSettingdelete(Map<String, Object> map) throws Exception {
		settingDAO.comSettingDelete(map);
		
	}

}
