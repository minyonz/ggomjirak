package com.dp.ggomjirak.yj.dao;

import java.util.List;

import com.dp.ggomjirak.vo.HobbyVo;
import com.dp.ggomjirak.vo.MaterialSearch;
import com.dp.ggomjirak.vo.MaterialVo;

public interface MaterialDao {
	

	/**
	 * @param materialVo
	 */
	public void insertMaterial2(List<MaterialVo> materialVos);
	
	public void insertMaterial(String materialName);
	
	public MaterialVo getMaterialVo (String material_name);
	
	public int getMaterialNo (String materialName);
	
//	 __________준비물로 목록조회 ___________
	public List<HobbyVo> selectHMList(MaterialSearch materialSearch);
	//전체조회
//	public List<HobbyVo> selectAll(int material_no);
//	//최신순
//	public List<HobbyVo> selectNew(int material_no);
//	//좋아요순
//	public List<HobbyVo> selectLike(int material_no);
//	//조회수순
//	public List<HobbyVo> selectView(int material_no);
//	//시간순
//	public List<HobbyVo> selectTime(int material_no);
//	//난이도순
//	public List<HobbyVo> selectLevel(int material_no);
//	//비용순
//	public List<HobbyVo> selectCost(int material_no);
}
