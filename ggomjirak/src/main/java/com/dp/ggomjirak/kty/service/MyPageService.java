package com.dp.ggomjirak.kty.service;

import java.util.List;

import com.dp.ggomjirak.vo.CateVo;
import com.dp.ggomjirak.vo.MemberVo;

public interface MyPageService {
	
	public MemberVo login(String user_id, String user_pw);
	public boolean checkDupId(String user_id);
	public void insertMember(MemberVo memberVo);
	public List<CateVo> listHobbyCate1();
	public List<CateVo> listHobbyCate2(int parent_cate_no);
	public MemberVo info(String user_id);
	public void modifyRun(MemberVo memberVo);
	public boolean checkDupNick(String user_nick);
	//public void modifyProfileRun(String profile_text);
	public void modifyProfileRun(MemberVo memberVo);
	public void alarmSetUpRun(MemberVo memberVo);
}
