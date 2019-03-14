package Dot_tea.admin.service;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import Dot_tea.admin.dao.NoticeDAO;
import Dot_tea.common.util.FileUtils;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "fileUtils")
	private FileUtils fileUtils;

	@Resource(name = "noticeDAO")
	private NoticeDAO noticeDAO;

/*	// ����Ʈ
	@Override
	public List<Map<String, Object>> noticeList(Map<String, Object> map) throws Exception {
		return noticeDAO.noticeList(map);
	}*/

	// ����¡ ����Ʈ
		@Override
		public List<Map<String, Object>> noticeList(Map<String, Object> map) throws Exception {
			String key = (String) map.get("searchType");
			String keyword = (String) map.get("keyword");
			if (key == null) {
				// map.put("search", "AND TITLE LIKE '%%'");
				map.put("searchType", "N_SUBJECT");
				map.put("keyword", "%%");
			
			}

//			map.put("searchType", "TITLE");
//			map.put("keyword", "%" + keyword + "%");
			else {
				if (key.equals("1")) {
					map.put("searchType", "N_CONTENT");
					map.put("keyword", "%" + keyword + "%");
				} else if (key.equals("2")) {
					map.put("searchType", "N_SUBJECT");
					map.put("keyword", "%" + keyword + "%");
				}
			}

//			if(key.equals("1"))
//			{
//				map.put("search", "AND  CONTENTS  LIKE  '%"+keyword+"%'");
//			}else if(key.equals("2"))
//			{
//				map.put("search", "AND  TITLE  LIKE  '%"+keyword+"%'");
//			}else if(key.equals("3"))
//			{
//				map.put("search", "AND  TITLE  LIKE  '%"+keyword+"%'" +  "OR CONTENTS  LIKE  '%"+keyword+"%'" );
//			}
//			else {
//				map.put("search", "AND  TITLE  LIKE  '%%'");
//			}
		
		return noticeDAO.noticeList(map);
}

	// �� �ۼ�
	@Override
	public void noticeWrite(Map<String, Object> map, HttpServletRequest request) throws Exception {
		noticeDAO.noticeWrite(map);

		/*
		 * List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(map, request);
		 * for (int i = 0, size = list.size(); i < size; i++) {
		 * noticeDAO.noticeFileUpdate(list.get(i));
		 * 
		 * MultipartHttpServletRequest multipartHttpServletRequest =
		 * (MultipartHttpServletRequest) request; Iterator<String> iterator =
		 * multipartHttpServletRequest.getFileNames(); MultipartFile multipartFile =
		 * null; while (iterator.hasNext()) { multipartFile =
		 * multipartHttpServletRequest.getFile(iterator.next()); if
		 * (multipartFile.isEmpty() == false) {
		 * log.debug("------------- file start -------------"); log.debug("name : " +
		 * multipartFile.getName()); log.debug("filename : " +
		 * multipartFile.getOriginalFilename()); log.debug("size : " +
		 * multipartFile.getSize());
		 * log.debug("-------------- file end --------------\n"); } } }
		 */
	}

	// �� �󼼺���
	@Override
	public Map<String, Object> noticeView(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = noticeDAO.noticeView(map);
		return resultMap;
	}

	// �� ����
	@Override
	public void noticeUpdate(Map<String, Object> map, HttpServletRequest request) throws Exception {
		noticeDAO.noticeUpdate(map);
		
		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(map, request);
		for (int i = 0, size = list.size(); i < size; i++) {
			noticeDAO.noticeFileUpdate(list.get(i));
		}
	   
	}

	// ���Ͼ��ε�
	@Override
	public void noticeFileUpdate(Map<String, Object> map, HttpServletRequest request) throws Exception {
		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(map, request);
		for (int i = 0, size = list.size(); i < size; i++) {
			noticeDAO.noticeFileUpdate(list.get(i));
		}

	}

	// �� ����
	@Override
	public void noticeDelete(Map<String, Object> map) throws Exception {
		noticeDAO.noticeDelete(map);
	}

	

}
