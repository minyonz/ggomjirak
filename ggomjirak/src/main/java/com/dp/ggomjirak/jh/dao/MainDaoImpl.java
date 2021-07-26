package com.dp.ggomjirak.jh.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dp.ggomjirak.vo.HobbyVo;
import com.dp.ggomjirak.vo.MemberVo;

@Repository
public class MainDaoImpl implements MainDao {
	
	private static final String NAMESPACE = "com.dp.ggomjirak.main.";
	
	@Inject
	SqlSession sqlSession;

	
	@Override
	public List<HobbyVo> getPopularHobbyList() {
		List<HobbyVo> list = sqlSession.selectList(NAMESPACE + "getPopularHobbyList");
		return list;
	}

	@Override
	public List<HobbyVo> getMonthHobbyList() {
		List<HobbyVo> list = sqlSession.selectList(NAMESPACE + "getMonthHobbyList");
		return list;
	}

	@Override
	public List<MemberVo> getPopularMemberList1() {
		List<MemberVo> list = sqlSession.selectList(NAMESPACE + "getPopularMemberList1");
		return list;
	}
	
	@Override
	public List<MemberVo> getPopularMemberList2() {
		List<MemberVo> list = sqlSession.selectList(NAMESPACE + "getPopularMemberList2");
		return list;
	}
	
	@Override
	public List<MemberVo> getPopularMemberList3() {
		List<MemberVo> list = sqlSession.selectList(NAMESPACE + "getPopularMemberList3");
		return list;
	}
	
	@Override
	public List<MemberVo> getPopularMemberList4() {
		List<MemberVo> list = sqlSession.selectList(NAMESPACE + "getPopularMemberList4");
		return list;
	}

	@Override
	public String selectUserGrade(int user_grade) {
		String strGrade = sqlSession.selectOne(NAMESPACE + "selectUserGrade", user_grade);
		return strGrade;
	}

	@Override
	public List<HobbyVo> searchHobby(String keyword) {
		List<HobbyVo> list = sqlSession.selectList(NAMESPACE + "searchHobby", keyword);
		return list;
	}

	@Override
	public List<MemberVo> searchMember(String keyword) {
		List<MemberVo> list = sqlSession.selectList(NAMESPACE + "searchMember", keyword);
		return list;
	}





}
