package com.dp.ggomjirak.my.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/workroom")
public class WrMainController {

	@RequestMapping(value = "/wr_main", method = RequestMethod.GET)
	public String wrMain() throws Exception {
		return "workroom/wr_main";
	}
	
}
