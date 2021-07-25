package com.dp.ggomjirak.jh.service;

import java.util.List;

import com.dp.ggomjirak.vo.HobbyVo;
import com.dp.ggomjirak.vo.MemberVo;

public interface MainService {
	

	public List<HobbyVo> getPopularHobbyList();
	public List<HobbyVo> getMonthHobbyList();
	public String selectUserGrade(int user_grade);
	
	public List<HobbyVo> searchHobby(String keyword);
	public List<MemberVo> searchMember(String keyword);

}
