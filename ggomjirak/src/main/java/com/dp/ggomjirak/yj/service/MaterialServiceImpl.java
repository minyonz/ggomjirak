package com.dp.ggomjirak.yj.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.dp.ggomjirak.vo.HobbyVo;
import com.dp.ggomjirak.vo.MaterialSearch;
import com.dp.ggomjirak.yj.dao.MaterialDao;

@Service
public class MaterialServiceImpl implements MaterialService {

	@Inject 
	private MaterialDao materialDao;
	
	@Override
	public List<HobbyVo> selectHMList(MaterialSearch materialSearch) {
		return materialDao.selectHMList(materialSearch);
	}

}
