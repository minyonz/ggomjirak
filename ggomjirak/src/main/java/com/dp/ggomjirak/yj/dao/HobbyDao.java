package com.dp.ggomjirak.yj.dao;

import java.util.List;

import com.dp.ggomjirak.vo.CompleteImgVo;
import com.dp.ggomjirak.vo.HobbyMaterialVo;
import com.dp.ggomjirak.vo.HobbyVo;
import com.dp.ggomjirak.vo.MakeStepVo;



public interface HobbyDao {


	
	/** 취미 상세조회 
	 * @param hobby_no
	 * @return
	 */
	public HobbyVo selectHobby(int hobby_no);
	
	public List<HobbyMaterialVo> selectHobbyMaterialList(int hobby_no);
	public List<MakeStepVo> selectMakeStepList(int hobby_no);
	public List<CompleteImgVo> selectCompleteImgListNotNull(int hobby_no);
	public List<CompleteImgVo> selectCompleteImgListAll(int hobby_no);
	
	
	
	/**
	 * @param hobbyVo
	 * @return hobby_no
	 */
	public int insertHobby (HobbyVo hobbyVo); 
	
	/**
	 * @param makeSteps
	 */
	public int insertMakeStepVo (List<MakeStepVo> makeSteps);
	
	/**
	 * @param hobbyMaterials
	 */
	public int insertHobbyMaterial (List<HobbyMaterialVo> hobbyMaterials);
	
	public int insertCompleteImg (List<CompleteImgVo> completeImgs);
	
	
	// * 수정 작업
	public String selectCompleteImgName(CompleteImgVo completeImgVo);
	public String selectMainImg(int hobby_no);
//	public String selectMakeStepImg(MakeStepVo makeStepVo);
	
	public int updateHobby(HobbyVo hobbyVo);
	
	public int deleteHobbyMaterial(List<HobbyMaterialVo> hobbyMaterials);
	public int updateHobbyMaterial(List<HobbyMaterialVo> hobbyMaterials);
	
	public int deleteMakeStep(List<MakeStepVo> makeSteps);
	public int updateMakeStep(List<MakeStepVo> makeSteps);
	
	public int updateCompleteImg(List<CompleteImgVo> completeImgs);
	
	// *삭제작업
	public int deleteHobby(int hobby_no);
	
	
	//조회수, 댓글, 좋아요 작업
	public int updateViewCnt(int hobby_no);
	public int updateCmtCnt(int hobby_no, int count);
	
	
//	 __________준비물로 목록조회 ___________
	//전체조회
	public List<HobbyVo> selectAll(int material_no);
	//최신순
	public List<HobbyVo> selectNew(int material_no);
	//좋아요순
	public List<HobbyVo> selectLike(int material_no);
	//조회수순
	public List<HobbyVo> selectView(int material_no);
	//시간순
	public List<HobbyVo> selectTime(int material_no);
	//난이도순
	public List<HobbyVo> selectLevel(int material_no);
	//비용순
	public List<HobbyVo> selectCost(int material_no);
}
