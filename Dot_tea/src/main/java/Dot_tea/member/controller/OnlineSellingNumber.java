package Dot_tea.member.controller;

import java.io.BufferedInputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserFactory;

import Dot_tea.setting.CommandMap;

@Controller
public class OnlineSellingNumber {

	// http://apis.data.go.kr/1130000/openapi/service/MllInfoService/getMllInfoDetail?seq=26&ServiceKey=서비스키
	public final static String PHARM_URL = "http://apis.data.go.kr/1130000/MllInfoService/getMllBizRNoInfo";
	public final static String PHARM_URL_seq = "http://apis.data.go.kr/1130000/MllInfoService/getMllCmpNmInfo";
	public final static String PHARM_URL_last = "http://apis.data.go.kr/1130000/MllInfoService/getMllInfoDetail";

	public final static String KEY = "1t%2BvvKS9queTBw5AmFiOC7gYQA3Ol5KJcq1%2FR5u5TMHpJ91KwJE6kIVgxKGg%2Fv3%2BeRSIr4KQ6Ly5fIBm%2F2RIUA%3D%3D";

	// http://apis.data.go.kr/1130000/MllInfoService/getMllBizRNoInfo?wrkrNo=2208162517&ServiceKey=1t%2BvvKS9queTBw5AmFiOC7gYQA3Ol5KJcq1%2FR5u5TMHpJ91KwJE6kIVgxKGg%2Fv3%2BeRSIr4KQ6Ly5fIBm%2F2RIUA%3D%3D

	@RequestMapping(value = "/join/companyJoinForm.tea/findSellingNumber.tea")
	public ModelAndView apiParserSearch(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		// ModelAndView mv = new ModelAndView("/member/join/companyResi");
		URL url = new URL(getURLParam((String) commandMap.get("name"), (String) commandMap.get("number")));

		System.out.println("utl       : " + url);

		XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
		factory.setNamespaceAware(true);
		XmlPullParser xpp = factory.newPullParser();
		BufferedInputStream bis = new BufferedInputStream(url.openStream());
		xpp.setInput(bis, "utf-8");

		String tag = null;
		int event_type = xpp.getEventType();

		ArrayList<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Map<String, Object> map = new HashMap<String, Object>();

		while (event_type != XmlPullParser.END_DOCUMENT) {
			// System.out.println(xpp.getText());
			if (event_type == XmlPullParser.START_TAG) {
				tag = xpp.getName();
				System.out.println(xpp.getName());
			} else if (event_type == XmlPullParser.TEXT) {
				System.out.println("xpp.getText(): " + xpp.getText());
				if (tag.equals("bupNm")) {
					map.put("bupNm", xpp.getText());

				}
				if (tag.equals("apvPermMgtNo")) {
					map.put("apvPermMgtNo", xpp.getText());
					// 통판 번호
				}

				if (tag.equals("mngStateCode")) {
					map.put("mngStateCode", xpp.getText());
					// 영업 상태
				}
				if (tag.equals("repsntNm")) {
					map.put("repsntNm", xpp.getText());
					// 대표자명
				}

			} else if (event_type == XmlPullParser.END_TAG) {
				tag = xpp.getName();
				if (tag.equals("item")) {
					list.add(map);

					// list.add(addr);
				}
			}

			event_type = xpp.next();
		}

		if (list.size() != 0)

		{
			mv.addObject("TOTAL", list.size());
		} else {
			mv.addObject("TOTAL", 0);
		}

		mv.addObject("ResiList", list);
		commandMap.put("ResiList", list);

		// System.out.println(list.get(2).get("dataCrtYm"));

		return mv;
	}

	private String getURLParam(String name, String number) {

		String url = PHARM_URL + "?wrkrNo=" + number + "&ServiceKey=" + KEY;
		// + URLEncoder.encode(name) + "&apv_perm_mgt_no=" + number + "&ServiceKey="+
		// KEY;
		// String encodeResult = URLEncoder.encode(String encodingString, String
		// charsetName);

		return url;
	}

}
