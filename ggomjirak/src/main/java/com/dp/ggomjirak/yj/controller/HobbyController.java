package com.dp.ggomjirak.yj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HobbyController {
	
	@RequestMapping(value="/writeForm", method=RequestMethod.GET)
	public String writeForm() throws Exception {
		return "hobby/write_form";
	}
	
	@RequestMapping(value="/content", method=RequestMethod.GET)
	public String content() throws Exception {
		return "hobby/content";
	}
}
