package com.dp.ggomjirak.jh.service;

import java.util.List;

import com.dp.ggomjirak.vo.CateStrVo;
import com.dp.ggomjirak.vo.EventVo;
import com.dp.ggomjirak.vo.ManagerVo;
import com.dp.ggomjirak.vo.MemberActivVo;
import com.dp.ggomjirak.vo.MemberDetailVo;
import com.dp.ggomjirak.vo.MemberInfoVo;
import com.dp.ggomjirak.vo.MemberVo;
import com.dp.ggomjirak.vo.PagingDto;
import com.dp.ggomjirak.vo.QnAVo;
import com.dp.ggomjirak.vo.WorkroomVo;

public interface EventService {

	public List<EventVo> getEventBannerList();
	public int getCountBanner(PagingDto pagingDto);
	
	public List<EventVo> showEventListAll(PagingDto pagingDto);
	public List<EventVo> showEventList(PagingDto pagingDto);
	public List<EventVo> showEventListEnd(PagingDto pagingDto);
	public List<EventVo> showEventListDelete(PagingDto pagingDto);
	
	public int getCountEventAll(PagingDto pagingDto);
	public int getCountEvent(PagingDto pagingDto);
	public int getCountEventEnd(PagingDto pagingDto);
	public int getCountEventDelete(PagingDto pagingDto);
	
	public EventVo selectByEno(int e_no);
	public void insertEvent(EventVo eventVo);
	public void updateEvent(EventVo eventVo);
	public void deleteEvent(int e_no);
	
	public List<EventVo> mainEventBannerList(PagingDto pagingDto);
	public int getCountMainEventBanner(PagingDto pagingDto);
	public void insertMainEvent(int e_no);
	public void deleteMainEvent(int e_no);
	
	
}
