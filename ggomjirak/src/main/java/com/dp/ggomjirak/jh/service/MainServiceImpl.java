package com.dp.ggomjirak.jh.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.dp.ggomjirak.jh.dao.MainDao;
import com.dp.ggomjirak.vo.HobbyVo;
import com.dp.ggomjirak.vo.MemberVo;

@Service
public class MainServiceImpl implements MainService {
	
	@Inject
	private MainDao mainDao;



	@Override
	public List<HobbyVo> getPopularHobbyList() {
		List<HobbyVo> list = mainDao.getPopularHobbyList();
		return list;
	}

	@Override
	public List<HobbyVo> getMonthHobbyList() {
		List<HobbyVo> list = mainDao.getMonthHobbyList();
		return list;
	}

	@Override
	public String selectUserGrade(int user_grade) {
		String strGrade = mainDao.selectUserGrade(user_grade);
		return strGrade;
	}

	@Override
	public List<HobbyVo> searchHobby(String keyword) {
		List<HobbyVo> list = mainDao.searchHobby(keyword);
		return list;
	}

	@Override
	public List<MemberVo> searchMember(String keyword) {
		List<MemberVo> list = mainDao.searchMember(keyword);
		return list;
	}

}
