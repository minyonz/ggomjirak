package com.dp.ggomjirak.my.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/workroom")
public class WrMainController {

	@RequestMapping(value="/wr_main", method=RequestMethod.GET)
	public String wrMain() throws Exception {
		return "workroom/wr_main";
	}
	
	@RequestMapping(value="/wr_hobby", method=RequestMethod.GET)
	public String wrHobby() throws Exception {
		return "workroom/wr_hobby";
	}
	
	@RequestMapping(value="/wr_mbm", method=RequestMethod.GET)
	public String wrMbm() throws Exception {
		return "workroom/wr_mbm";
	}
	
	@RequestMapping(value="/wr_story_content", method=RequestMethod.GET)
	public String wrStory() throws Exception {
		return "workroom/wr_story_content";
	}
	
}
