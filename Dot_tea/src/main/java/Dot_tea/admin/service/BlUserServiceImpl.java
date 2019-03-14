package Dot_tea.admin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import Dot_tea.admin.dao.BlUserDAO;

@Service("bluserService")
public class BlUserServiceImpl implements BlUserService {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "bluserDAO")
	private BlUserDAO bluserDAO;

	// ∆‰¿Ã¬° ∏ÆΩ∫∆Æ
	@Override
	public List<Map<String, Object>> bluserList(Map<String, Object> map) throws Exception {

		return bluserDAO.bluserList(map);
	}
	
	// ∆‰¿Ã¬° ∏ÆΩ∫∆Æ
		@Override
		public List<Map<String, Object>> bluserPoliceList(Map<String, Object> map) throws Exception {

			return bluserDAO.bluserPoliceList(map);
		}
		

	// ±€ ªÛºº∫∏±‚
	@Override
	public Map<String, Object> bluserView(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = bluserDAO.bluserView(map);
		return resultMap;
	}

	// ±€ ºˆ¡§
	@Override
	public void bluserUpdate(Map<String, Object> map) throws Exception {
		bluserDAO.bluserUpdate(map);

	}

	// ±€ ªË¡¶
	@Override
	public void bluserDelete(Map<String, Object> map) throws Exception {
		bluserDAO.bluserDelete(map);
	}

}
