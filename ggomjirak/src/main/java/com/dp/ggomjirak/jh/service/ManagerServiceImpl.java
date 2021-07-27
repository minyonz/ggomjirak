package com.dp.ggomjirak.jh.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.dp.ggomjirak.jh.dao.ManagerDao;
import com.dp.ggomjirak.vo.CateStrVo;
import com.dp.ggomjirak.vo.EventVo;
import com.dp.ggomjirak.vo.ManagerVo;
import com.dp.ggomjirak.vo.MemberActivVo;
import com.dp.ggomjirak.vo.MemberDetailVo;
import com.dp.ggomjirak.vo.MemberInfoVo;
import com.dp.ggomjirak.vo.MemberVo;
import com.dp.ggomjirak.vo.PagingDto;

@Service
public class ManagerServiceImpl implements ManagerService {

	@Inject
	private ManagerDao managerDao;


	@Override
	public List<MemberVo> showMemberList() {
		List<MemberVo> list = managerDao.showMemberList();
		return list;
	}

	@Override
	public List<MemberVo> showMemberListLeave() {
		List<MemberVo> list = managerDao.showMemberListLeave();
		return list;
	}

	@Override
	public List<ManagerVo> showManagerList() {
		List<ManagerVo> list = managerDao.showManagerList();
		return list;
	}

	@Override
	public MemberVo selectMemberById(String user_id) {
		MemberVo memberVo = managerDao.selectMemberById(user_id);
		return memberVo;
	}
	

	@Override
	public CateStrVo selectCateStr(String user_id) {
		CateStrVo cateVo = managerDao.selectCateStr(user_id);
		return cateVo;
	}

	@Override
	public String selectGradeById(String user_id) {
		String grade = managerDao.selectGradeById(user_id);
		return grade;
	}

	@Override
	public MemberActivVo selectMemberActivById(String user_id) {
		MemberActivVo activeVo = managerDao.selectMemberActivById(user_id);
		return activeVo;
	}

	@Override
	public String selectMemberIntroById(String user_id) {
		String intro = managerDao.selectMemberIntroById(user_id);
		return intro;
	}


	@Override
	public void updateMember(MemberVo memberVo) {
		managerDao.updateMemberInfo(memberVo);
		managerDao.updateMemberDetail(memberVo);
		
	}

	@Override
	public void deleteMember(String user_id) {
		managerDao.deleteMember(user_id);
		
	}

	@Override
	public void cancleDeleteMember(String user_id) {
		managerDao.cancleDeleteMember(user_id);
		
	}
	

	@Override
	public void insertManager(ManagerVo managerVo) {
		managerDao.insertManager(managerVo);
		
	}

	@Override
	public void deleteManager(String user_id) {
		managerDao.deleteManager(user_id);
		
	}
	
	@Override
	public List<EventVo> showEventListAll(PagingDto pagingDto) {
		List<EventVo> list = managerDao.showEventListAll(pagingDto);
		return list;
	}
	
	@Override
	public List<EventVo> showEventList(PagingDto pagingDto) {
		List<EventVo> list = managerDao.showEventList(pagingDto);
		return list; 
	}

	@Override
	public List<EventVo> showEventListEnd(PagingDto pagingDto) {
		List<EventVo> list = managerDao.showEventListEnd(pagingDto);
		return list;
	}

	@Override
	public List<EventVo> showEventListDelete(PagingDto pagingDto) {
		List<EventVo> list = managerDao.showEventListDelete(pagingDto);
		return list;
	}

	@Override
	public int getCountEventAll(PagingDto pagingDto) {
		int count = managerDao.getCountEventAll(pagingDto);
		return count;
	}

	@Override
	public int getCountEvent(PagingDto pagingDto) {
		int count = managerDao.getCountEvent(pagingDto);
		return count;
	}

	@Override
	public int getCountEventEnd(PagingDto pagingDto) {
		int count = managerDao.getCountEventEnd(pagingDto);
		return count;
	}

	@Override
	public int getCountEventDelete(PagingDto pagingDto) {
		int count = managerDao.getCountEventDelete(pagingDto);
		return count;
	}

	@Override
	public EventVo selectByEno(int e_no) {
		EventVo eventVo = managerDao.selectByEno(e_no);
		return eventVo;
	}

	@Override
	public void insertEvent(EventVo eventVo) {
		managerDao.insertEvent(eventVo);
	}

	@Override
	public void updateEvent(EventVo eventVo) {
		managerDao.updateEvent(eventVo);
		
	}

	@Override
	public void deleteEvent(int e_no) {
		managerDao.deleteEvent(e_no);
	}

	@Override
	public List<MemberVo> selectPopularMemberList() {
		List<MemberVo> list = managerDao.selectPopularMemberList();
		return list;
	}

	@Override
	public int getMemberCount() {
		int count = managerDao.getMemberCount();
		return count;
	}





}
