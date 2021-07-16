package com.dp.ggomjirak.kty.controller;

import java.io.FileInputStream;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class MyPageController {
	
	// 팀 프로젝트에 추가 - 회원 가입 & 정보수정 폼
	@RequestMapping(value = "/mypage/joinForm", method = RequestMethod.GET)
	public String joinForm() throws Exception {
		return "/mypage/joinForm";
	}
	
	// 팀 프로젝트에 추가 - 회원 프로필 수정 폼
	@RequestMapping(value = "/mypage/profileForm", method = RequestMethod.GET)
	public String profileForm() throws Exception {
		return "/mypage/profileForm";
	}
	
	// 팀 프로젝트에 추가 - 회원 탈퇴
	@RequestMapping(value = "/mypage/withdrawalForm", method = RequestMethod.GET)
	public String withdrawalForm() throws Exception {
		return "/mypage/withdrawalForm";
	}
		
	// 팀 프로젝트에 추가 - 알람 설정 폼  
	@RequestMapping(value = "/mypage/alarmSetup", method = RequestMethod.GET)
	public String alarmSetup() throws Exception {
		return "/mypage/alarmSetup";
	}
	
	// 팀 프로젝트에 추가 - 문의하기 게시판 리스트
	@RequestMapping(value = "/cs_center/consultList", method = RequestMethod.GET)
	public String consultList() throws Exception {
		return "/cs_center/consultList";
	}

	// 팀 프로젝트에 추가 - 문의하기 게시판 글쓰기
	@RequestMapping(value = "/cs_center/consultQS", method = RequestMethod.GET)
	public String consultQS() throws Exception {
		return "/cs_center/consultQS";
	}
	
	// 팀 프로젝트에 추가 - 문의하기 글 내용 확인 수정
	@RequestMapping(value = "/cs_center/consultQnA", method = RequestMethod.GET)
	public String consultQnA() throws Exception {
		return "/cs_center/consultQnA";
	}
	
}