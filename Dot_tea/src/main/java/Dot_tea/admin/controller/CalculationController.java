package Dot_tea.admin.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import Dot_tea.admin.service.calcService;
import Dot_tea.setting.CommandMap;

@Controller
public class CalculationController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "calcService")
	private calcService calcService;

	@RequestMapping("/admin/Calculator.tea")
	public ModelAndView Calculator(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/admin/calculator/calculationList");
		// List<Map<String, Object>> list = calcService.calcList(commandMap.getMap());
		Date date = new Date();
		Calendar cal = Calendar.getInstance();

		mv.addObject("yearC", cal.get(Calendar.YEAR));

		return mv;
	}

	@RequestMapping("/admin/CalculatorList.tea")
	public ModelAndView CalculatorList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");

		if (commandMap.get("searchType") != null) {
			String type = (String) commandMap.get("searchType");
			if (type.equals("1")) {// 기업 코드
				commandMap.put("type", "AND MEM_COM_NO");
			} else if (type.equals("2")) {// 기업 이름
				commandMap.put("type", "AND MEM_COM_NAME");
			}
			commandMap.put("searchKeyWord", " like '%" + commandMap.get("searchKeyWord") + "%'");
		} else {
			commandMap.put("type", "AND MEM_COM_NO");
			commandMap.put("searchKeyWord", "like '%%'");
		}

		if (commandMap.get("monC").equals("undefined")) {
			Date date = new Date();
			Calendar cal = Calendar.getInstance();

			if (cal.MONTH == 0) {
				commandMap.put("date", (cal.get(Calendar.YEAR) - 1) + "12");

			} else {
				String dt = cal.YEAR + "" + cal.MONTH;
				System.out.println("date1 ....: " + cal.get(Calendar.YEAR) + " " + cal.get(Calendar.MONTH));
				String mon = "";
				if (cal.get(Calendar.MONTH) < 10) {
					mon = "0" + cal.get(Calendar.MONTH);
				}

				commandMap.put("date", cal.get(Calendar.YEAR) + "" + mon);
			}

		} else {

			String year = (String) commandMap.get("yearC");
			String month = (String) commandMap.get("monC");
			commandMap.put("date", year + "" + month);

		}

		System.out.println("date : " + commandMap.get("date"));
		System.out.println("type : " + commandMap.get("type"));

		List<Map<String, Object>> list = calcService.calcList(commandMap.getMap());

		System.out.println("list" + list);
		mv.addObject("list", list);
		if (list != null)
			mv.addObject("TOTAL", list.size());
		else if (list == null)
			mv.addObject("TOTAL", 0);

		return mv;
	}

	@RequestMapping("/admin/CalculatorB.tea")
	public ModelAndView CalculatorB(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/admin/calculator/calculationBlackList");
		Date date = new Date();
		Calendar cal = Calendar.getInstance();

		mv.addObject("yearC", cal.get(Calendar.YEAR));

		return mv;
	}

	@RequestMapping("/admin/CalculatorBList.tea")
	public ModelAndView CalculatorBLista(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");

		if (commandMap.get("searchType") != null) {
			String type = (String) commandMap.get("searchType");
			if (type.equals("1")) {// 기업 코드
				commandMap.put("type", "AND MEM_COM_NO");
			} else if (type.equals("2")) {// 기업 이름
				commandMap.put("type", "AND MEM_COM_NAME");
			}
			commandMap.put("searchKeyWord", " like '%" + commandMap.get("searchKeyWord") + "%'");
		} else {
			commandMap.put("type", "AND MEM_COM_NO");
			commandMap.put("searchKeyWord", "like '%%'");
		}

		if (commandMap.get("monC").equals("undefined")) {
			Date date = new Date();
			Calendar cal = Calendar.getInstance();

			if (cal.MONTH == 0) {
				commandMap.put("date", (cal.get(Calendar.YEAR) - 1) + "12");

			} else {
				String dt = cal.YEAR + "" + cal.MONTH;
				System.out.println("date1 ....: " + cal.get(Calendar.YEAR) + " " + cal.get(Calendar.MONTH));
				String mon = "";
				if (cal.get(Calendar.MONTH) < 10) {
					mon = "0" + cal.get(Calendar.MONTH);
				}

				commandMap.put("date", cal.get(Calendar.YEAR) + "" + mon);
			}

		} else {

			String year = (String) commandMap.get("yearC");
			String month = (String) commandMap.get("monC");
			commandMap.put("date", year + "" + month);

		}

		System.out.println("date : " + commandMap.get("date"));
		System.out.println("type : " + commandMap.get("type"));

		List<Map<String, Object>> list = calcService.calcBList(commandMap.getMap());

		System.out.println("list" + list);
		mv.addObject("list", list);
		if (list != null)
			mv.addObject("TOTAL", list.size());
		else if (list == null)
			mv.addObject("TOTAL", 0);

		return mv;
	}

}
