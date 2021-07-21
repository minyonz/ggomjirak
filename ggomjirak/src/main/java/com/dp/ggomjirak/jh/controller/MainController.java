package com.dp.ggomjirak.jh.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("main")
public class MainController {

	@RequestMapping(value="/mainHome", method=RequestMethod.GET)
	public String mainHome() throws Exception {
		return "main/main_home";
	}
	
	@RequestMapping(value="/mainHobby", method=RequestMethod.GET)
	public String mainHobby() throws Exception {
		return "main/main_hobby";
	}
	
	@RequestMapping(value="/mainEvent", method=RequestMethod.GET)
	public String mainEvent() throws Exception {
		return "main/main_event";
	}
	
	@RequestMapping(value="/mainAboutUs", method=RequestMethod.GET)
	public String mainAboutUs() throws Exception {
		return "main/main_about_us";
	}
	
	@RequestMapping(value="/mainSearch", method=RequestMethod.GET)
	public String mainSearch() throws Exception {
		return "main/main_search";
	}

}
