package com.dp.ggomjirak.yj.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dp.ggomjirak.vo.HobbyVo;
import com.dp.ggomjirak.vo.MaterialSearch;
import com.dp.ggomjirak.vo.MaterialVo;

@Repository
public class MaterialDaoImpl implements MaterialDao {
	
	private static final String NAMESPACE = "com.dp.ggomjirak.material.";
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public void insertMaterial2(List<MaterialVo> materialVos) {
		sqlSession.insert(NAMESPACE + "insertMaterial2", materialVos);
//		System.out.println(count + "행 삽입됨");
	}
	

	@Override
	public MaterialVo getMaterialVo(String material_name) {
		MaterialVo materialVo = sqlSession.selectOne(NAMESPACE + "getMaterialVo", material_name);
		return materialVo;
	}


	@Override
	public void insertMaterial(String materialName) {
		sqlSession.insert(NAMESPACE + "insertMaterial", materialName);
	}


	@Override
	public int getMaterialNo(String materialName) {
		return sqlSession.selectOne(NAMESPACE + "getMaterialNo", materialName);
	}

//	 __________준비물로 목록조회 ___________

	@Override
	public List<HobbyVo> selectHMList(MaterialSearch materialSearch) {
		return sqlSession.selectList(NAMESPACE + "selectHMList", materialSearch);
	}
//
//	@Override
//	public List<HobbyVo> selectNew(int material_no) {
//		return sqlSession.selectList(NAMESPACE + "selectNew", material_no);
//	}
//
//	@Override
//	public List<HobbyVo> selectLike(int material_no) {
//		return sqlSession.selectList(NAMESPACE + "selectLike", material_no);
//	}
//
//	@Override
//	public List<HobbyVo> selectView(int material_no) {
//		return sqlSession.selectList(NAMESPACE + "selectView", material_no);
//	}
//
//	@Override
//	public List<HobbyVo> selectTime(int material_no) {
//		return sqlSession.selectList(NAMESPACE + "selectTime", material_no);
//	}
//
//	@Override
//	public List<HobbyVo> selectLevel(int material_no) {
//		return sqlSession.selectList(NAMESPACE + "selectLevel", material_no);
//	}
//
//	@Override
//	public List<HobbyVo> selectCost(int material_no) {
//		return sqlSession.selectList(NAMESPACE + "selectCost", material_no);
//	}





}
