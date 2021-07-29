package com.dp.ggomjirak.yj.dao;

import java.util.List;

import com.dp.ggomjirak.vo.CompleteImgVo;
import com.dp.ggomjirak.vo.HobbyMaterialVo;
import com.dp.ggomjirak.vo.HobbyVo;
import com.dp.ggomjirak.vo.MakeStepVo;



public interface HobbyDao {

	
	/**
	 * @param hobbyVo
	 * @return hobby_no
	 */
	public int insertHobby (HobbyVo hobbyVo); 
	
	
	
	/** 취미 상세조회 타입A
	 * @param hobbyVo
	 * @return
	 */
	public HobbyVo selectHobby2(HobbyVo hobbyVo);
	
	/** 취미 상세조회 타입B
	 * @param hobby_no
	 * @return
	 */
	public HobbyVo selectHobby(int hobby_no);
	
	public List<HobbyMaterialVo> selectHobbyMaterialList2(HobbyVo hobbyVo);
	public List<HobbyMaterialVo> selectHobbyMaterialList(int hobby_no);
	public List<MakeStepVo> selectMakeStepList2(HobbyVo hobbyVo);
	public List<MakeStepVo> selectMakeStepList(int hobby_no);
	public List<CompleteImgVo> selectCompleteImgListNotNull(int hobby_no);
	public List<CompleteImgVo> selectCompleteImgListAll(int hobby_no);
	/**
	 * @param makeSteps
	 */
	public void insertMakeStepVo (List<MakeStepVo> makeSteps);
	
	/**
	 * @param hobbyMaterials
	 */
	public void insertHobbyMaterial (List<HobbyMaterialVo> hobbyMaterials);
	
	public void insertCompleteImg (List<CompleteImgVo> completeImgs);
	
}
