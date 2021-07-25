package com.dp.ggomjirak.jh.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dp.ggomjirak.jh.service.MainService;
import com.dp.ggomjirak.jh.service.ManagerService;
import com.dp.ggomjirak.vo.CateStrVo;
import com.dp.ggomjirak.vo.EventVo;
import com.dp.ggomjirak.vo.HobbyVo;
import com.dp.ggomjirak.vo.MemberVo;

@Controller
@RequestMapping("main")
public class MainController {
	
	@Inject
	private MainService mainService;
	
	@Inject
	private ManagerService managerService;

	@RequestMapping(value="/mainHome", method=RequestMethod.GET)
	public String mainHome(Model model) throws Exception {
		List<HobbyVo> popularHobby = mainService.getPopularHobbyList();
		List<HobbyVo> monthHobby = mainService.getMonthHobbyList();
		List<MemberVo> memberVo = managerService.showMemberList();
		String user_id = "cat";
		CateStrVo cateStrVo = managerService.selectCateStr(user_id);

		model.addAttribute("popularHobby", popularHobby);
		model.addAttribute("monthHobby", monthHobby);
		model.addAttribute("memberVo", memberVo);
		model.addAttribute("cateStrVo", cateStrVo);
		return "main/main_home";
	}
	
	@RequestMapping(value="/mainHobby", method=RequestMethod.GET)
	public String mainHobby(Model model) throws Exception {
		List<HobbyVo> popularHobby = mainService.getPopularHobbyList();
		model.addAttribute("popularHobby", popularHobby);
		return "main/main_hobby";
	}

	// 이벤트 리스트
	@RequestMapping(value="/mainEvent", method=RequestMethod.GET)
	public String mainEvent(Model model) throws Exception {
		List<EventVo> eventList = managerService.showEventList();
		model.addAttribute("eventList", eventList);
		return "main/main_event";
	}
	// 전체 이벤트
	@ResponseBody
	@RequestMapping(value="/getEventListAll", method=RequestMethod.GET)
	public List<EventVo> getEventListAll() throws Exception {
		List<EventVo> eventList = managerService.showEventListAll();
		return eventList;
	}
	// 진행중인 이벤트
	@ResponseBody
	@RequestMapping(value="/getEventList", method=RequestMethod.GET)
	public List<EventVo> getEventList() throws Exception {
		List<EventVo> eventList = managerService.showEventList();
		return eventList;
	}
	// 완료된 이벤트
	@ResponseBody
	@RequestMapping(value="/getEventListEnd", method=RequestMethod.GET)
	public List<EventVo> getEventListEnd() throws Exception {
		List<EventVo> eventList = managerService.showEventListEnd();
		return eventList;
	}

	// 이벤트 상세페이지
	@RequestMapping(value="/mainEventContent", method=RequestMethod.GET)
	public String mainEventContent(int e_no, Model model) throws Exception {
		EventVo eventVo = managerService.selectByEno(e_no);
		model.addAttribute("eventVo", eventVo);
		return "main/main_event_content";
	}
	
	@RequestMapping(value="/mainAboutUs", method=RequestMethod.GET)
	public String mainAboutUs() throws Exception {
		return "main/main_about_us";
	}
	
	@RequestMapping(value="/mainSearch", method=RequestMethod.GET)
	public String mainSearch(String keyword, Model model) throws Exception {
		List<HobbyVo> searchHobbyList = mainService.searchHobby(keyword);
		List<MemberVo> searchMemberList = mainService.searchMember(keyword);
		model.addAttribute("searchHobbyList", searchHobbyList);
		model.addAttribute("searchMemberList", searchMemberList);
		model.addAttribute("keyword", keyword);
		return "main/main_search";
	}
}
