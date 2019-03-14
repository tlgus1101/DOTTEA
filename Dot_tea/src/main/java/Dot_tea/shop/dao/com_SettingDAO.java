package Dot_tea.shop.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import Dot_tea.member.dao.AbstractDAO;

@Repository("settingDAO")
public class com_SettingDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public Map<String, Object> comSettingView(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("comSetting.comSettingView", map);
	}

	public void comSettingUpdate(Map<String, Object> map) throws Exception {
		update("comSetting.comSettingUpdate", map);
	}

	public void comSettingDelete(Map<String, Object> map) throws Exception {
		update("comSetting.comSettingDelete", map);
	}


}
