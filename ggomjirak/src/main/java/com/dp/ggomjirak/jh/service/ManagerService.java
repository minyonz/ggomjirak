package com.dp.ggomjirak.jh.service;

import java.util.List;

import com.dp.ggomjirak.vo.CateStrVo;
import com.dp.ggomjirak.vo.EventVo;
import com.dp.ggomjirak.vo.ManagerVo;
import com.dp.ggomjirak.vo.MemberActivVo;
import com.dp.ggomjirak.vo.MemberDetailVo;
import com.dp.ggomjirak.vo.MemberInfoVo;
import com.dp.ggomjirak.vo.MemberVo;

public interface ManagerService {

	public List<MemberVo> showMemberList();
	public List<MemberVo> showMemberListLeave();
	
	public MemberVo selectMemberById(String user_id);
	public CateStrVo selectCateStr(String user_id);
	public String selectGradeById(String user_id);
	public MemberActivVo selectMemberActivById(String user_id);
	public String selectMemberIntroById(String user_id);
	
	
	public void updateMember(MemberVo memberVo);
	public void deleteMember(String user_id);
	public void cancleDeleteMember(String user_id);
	
	public List<ManagerVo> showManagerList();
	public void insertManager(ManagerVo managerVo);
	public void deleteManager(String user_id);
	
	public List<EventVo> showEventListAll();
	public List<EventVo> showEventList();
	public List<EventVo> showEventListEnd();
	public List<EventVo> showEventListDelete();
	
	public EventVo selectByEno(int e_no);
	public void insertEvent(EventVo eventVo);
	public void updateEvent(EventVo eventVo);
	public void deleteEvent(int e_no);
	
	//메인
	public List<MemberVo> selectPopularMemberList();
}
