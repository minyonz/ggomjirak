package com.dp.ggomjirak.jh.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("main")
public class MainHomeController {

	@RequestMapping(value="/mainHome", method=RequestMethod.GET)
	public String mainHome() throws Exception {
		return "board/main_home";
	}
}
