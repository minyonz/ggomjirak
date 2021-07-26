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
		List<MemberVo> popularMember1 = mainService.getPopularMemberList1();
		List<MemberVo> popularMember2 = mainService.getPopularMemberList2();
		List<MemberVo> popularMember3 = mainService.getPopularMemberList3();
		List<MemberVo> popularMember4 = mainService.getPopularMemberList4();
		String user_id = "cat";
		CateStrVo cateStrVo = managerService.selectCateStr(user_id);

		model.addAttribute("popularHobby", popularHobby);
		model.addAttribute("monthHobby", monthHobby);
		model.addAttribute("popularMember1", popularMember1);
		model.addAttribute("popularMember2", popularMember2);
		model.addAttribute("popularMember3", popularMember3);
		model.addAttribute("popularMember4", popularMember4);
		
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
	@RequestMapping(value="/mainEventListAll", method=RequestMethod.GET)
	public String mainEventListAll(Model model) throws Exception {
		List<EventVo> eventListAll = managerService.showEventListAll();
		model.addAttribute("eventListAll", eventListAll);
		return "main/main_event_all";
	}
	
	// 완료된 이벤트
	@RequestMapping(value="/mainEventListEnd", method=RequestMethod.GET)
	public String getEventListEnd(Model model) throws Exception {
		List<EventVo> eventListEnd = managerService.showEventListEnd();
		model.addAttribute("eventListEnd", eventListEnd);
		return "main/main_event_end";
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
	
	// 카테고리
	public void getHobbyCate(Model model) throws Exception {
		
	}
}
