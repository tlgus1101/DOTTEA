package Dot_tea.member.controller;

import java.io.BufferedInputStream;
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
public class CompanyResi {

	public final static String PHARM_URL = "http://apis.data.go.kr/B552015/NpsBplcInfoInqireService/getBassInfoSearch";
	public final static String KEY = "1zo530ANZihHp8BuhND4U21%2FOAGWTOdHmwzt%2FeEFYwz4tuknDToOZD4HF9WcC%2FLmivRCmMN2pqvr3jvCMemBcw%3D%3D";

	@RequestMapping(value = "/join/companyJoinForm.tea/findResi.tea")
	public ModelAndView apiParserSearch(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		// ModelAndView mv = new ModelAndView("/member/join/companyResi");
		URL url = new URL(getURLParam((String) commandMap.get("name"), (String) commandMap.get("number")));

		System.out.println("url  " + url);

		XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
		factory.setNamespaceAware(true);
		XmlPullParser xpp = factory.newPullParser();
		BufferedInputStream bis = new BufferedInputStream(url.openStream());
		xpp.setInput(bis, "utf-8");

		String tag = null;
		int event_type = xpp.getEventType();

		ArrayList<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		// ArrayList list = new ArrayList<>();
		Map<String, Object> map = new HashMap<String, Object>();
		// String addr = "";
		int count = 1;
		while (event_type != XmlPullParser.END_DOCUMENT) {
			// System.out.println(xpp.getText());
			if (event_type == XmlPullParser.START_TAG) {
				tag = xpp.getName();
			} else if (event_type == XmlPullParser.TEXT) {
				if (tag.equals("bzowrRgstNo")) {
					// System.out.println("");
					map.put("bzowrRgstNo" + count, xpp.getText());
					// addr += "사업장 번호:" + xpp.getText();
					// addr += xpp.getText();
				}
				if (tag.equals("dataCrtYm")) {
					map.put("dataCrtYm" + count, xpp.getText());
					// System.out.println(xpp.getText());
					// addr += " 사업자번호 발행일:" + xpp.getText();
					// addr += ","+xpp.getText();
				}
				if (tag.equals("wkplNm")) {
					map.put("wkplNm" + count, xpp.getText());
					// addr += " 사업장명:" + xpp.getText();
					// addr += "," + xpp.getText();
				}
				if (tag.equals("wkplRoadNmDtlAddr")) {
					map.put("wkplRoadNmDtlAddr" + count, xpp.getText());
					// addr += " 사업장 도로명상세 주소:" + xpp.getText();
					// addr += " ," + xpp.getText();
				}
				if (tag.equals("wkplJnngStcd")) {
					map.put("wkplJnngStcd" + count, xpp.getText());
					// addr += " 사업장 가입 상태 코드:" + xpp.getText();
					// addr += " ," + xpp.getText();
				}

			} else if (event_type == XmlPullParser.END_TAG) {
				tag = xpp.getName();
				if (tag.equals("item")) {
					list.add(map);
					++count;
					// list.add(addr);
				}
			}

			event_type = xpp.next();
		}

		if (list.size() != 0) {
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

		String url = PHARM_URL + "?wkpl_nm=" + URLEncoder.encode(name) + "&bzowr_rgst_no=" + number + "&ServiceKey="
				+ KEY;
		// String encodeResult = URLEncoder.encode(String encodingString, String
		// charsetName);

		return url;
	}

}
