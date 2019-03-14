package Dot_tea.info.service;

import java.util.List;
import java.util.Map;

public interface InfoService {
	Map<String, Object> MyInfo(Map<String, Object> map) throws Exception;
	Map<String, Object> memberCheck(Map<String, Object> map) throws Exception;
	void infoUpdate(Map<String, Object> map) throws Exception;
	void infoDelete(Map<String, Object> map) throws Exception;
}
