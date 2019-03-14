package Dot_tea.admin.controller;

import java.util.Map;


import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class MainController {

	Logger log = Logger.getLogger(this.getClass());


	@RequestMapping(value = "/admin/Main.tea")
	public ModelAndView u_mList(Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin/adminMain/AdminMain");
		return mv;
	}

	
}

