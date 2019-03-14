package Dot_tea.common.util;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component("fileUtils")
public class FileUtils {
	private static final String filePath = "/Users/isihyeon/Desktop/파이널 프로젝트 KH DOT_TEA/Dot_tea/src/main/webapp/images/";

	public List<Map<String, Object>> parseInsertFileInfo(Map<String, Object> map, HttpServletRequest request)
			throws Exception {
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();

		MultipartFile multipartFile = null;
		String originalFileName = "";
		String originalFileExtension = "";
		String storedFileName = "";

		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Map<String, Object> listMap = null;
		String DEAL_NO = (String) map.get("DEAL_NO");

		File file = new File(filePath);
		if (file.exists() == false) {
			file.mkdirs();
		}

		while (iterator.hasNext()) {
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			if (multipartFile.isEmpty() == false) {
				String orFileName = multipartFile.getOriginalFilename();
				originalFileExtension = orFileName.substring(orFileName.lastIndexOf("."));
				String stFileName = CommonUtils.getRandomString() + originalFileExtension;

				System.out.println("이미지 : "+filePath + stFileName);
				file = new File(filePath + stFileName);
				multipartFile.transferTo(file);

				originalFileName += orFileName + ",";
				storedFileName += stFileName + ",";
			}
		}

		listMap = new HashMap<String, Object>();
		listMap.put("DEAL_NO", DEAL_NO);
		listMap.put("DEAL_IMGOG", originalFileName);
		listMap.put("DEAL_IMGSV", storedFileName);
		list.add(listMap);

		return list;
	}

	/*
	 * public List<Map<String, Object>> parseUpdateFileInfo(Map<String, Object> map,
	 * HttpServletRequest request) throws Exception { MultipartHttpServletRequest
	 * multipartHttpServletRequest = (MultipartHttpServletRequest) request;
	 * Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
	 * 
	 * MultipartFile multipartFile = null; String originalFileName = null; String
	 * originalFileExtension = null; String storedFileName = null;
	 * 
	 * List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
	 * Map<String, Object> listMap = null;
	 * 
	 * String requestName = null; String idx = null;
	 * 
	 * while (iterator.hasNext()) { multipartFile =
	 * multipartHttpServletRequest.getFile(iterator.next()); if
	 * (multipartFile.isEmpty() == false) { originalFileName =
	 * multipartFile.getOriginalFilename(); originalFileExtension =
	 * originalFileName.substring(originalFileName.lastIndexOf(".")); storedFileName
	 * = CommonUtils.getRandomString() + originalFileExtension;
	 * 
	 * multipartFile.transferTo(new File(filePath + storedFileName));
	 * 
	 * listMap = new HashMap<String, Object>(); listMap.put("DEAL_IMGOG",
	 * originalFileName); listMap.put("DEAL_IMGSV", storedFileName);
	 * list.add(listMap); } else { requestName = multipartFile.getName(); idx =
	 * "ING_NO_" + requestName.substring(requestName.indexOf("_") + 1); if
	 * (map.containsKey(idx) == true && map.get(idx) != null) { listMap = new
	 * HashMap<String, Object>(); listMap.put("FILE_IDX", map.get(idx));
	 * list.add(listMap); } } } return list; }
	 */
}
