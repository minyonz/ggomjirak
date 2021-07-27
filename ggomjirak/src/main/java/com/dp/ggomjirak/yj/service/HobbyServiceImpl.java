package com.dp.ggomjirak.yj.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.dp.ggomjirak.vo.CompleteImgVo;
import com.dp.ggomjirak.vo.HobbyMaterialVo;
import com.dp.ggomjirak.vo.HobbyVo;
import com.dp.ggomjirak.vo.MakeStepVo;
import com.dp.ggomjirak.vo.MaterialVo;
import com.dp.ggomjirak.vo.UrlOGTag;
import com.dp.ggomjirak.yj.dao.HobbyDao;
import com.dp.ggomjirak.yj.dao.MaterialDao;
import com.dp.ggomjirak.yj.util.MyFileUploadUtil;

@Service
public class HobbyServiceImpl implements HobbyService {

	
	@Inject
	private HobbyDao hobbyDao;
	
	@Inject 
	private MaterialDao materialDao;
	// 취미글 등록
	@Transactional
	@Override
	public void insertHobbyArticle(HobbyVo hobbyVo) {
		// * 유튜브 (hobby_video)작업
		String videoUrl = hobbyVo.getHobby_video();
		String hobby_video = videoUrl.substring(videoUrl.lastIndexOf("/") + 1);
		hobbyVo.setHobby_video(hobby_video);
		
		int hobby_no = hobbyDao.insertHobby(hobbyVo);
		// * 준비물 작업 
		List<HobbyMaterialVo> hobbyMaterials = hobbyVo.getHobbyMaterials();
		// material 테이블 insert 작업
		for (HobbyMaterialVo hobbyMaterialVo : hobbyMaterials) {
			String materialName = hobbyMaterialVo.getMaterialName();
			materialDao.insertMaterial(materialName);
		}
		// hobby_material 테이블 insert 작업
		for (HobbyMaterialVo hobbyMaterialVo : hobbyMaterials) {
//			MaterialVo materialVo = materialDao.getMaterialVo(hobbyMaterialVo.getMaterialName());
			int material_no = materialDao.getMaterialNo(hobbyMaterialVo.getMaterialName());
			//material_no 세팅
			hobbyMaterialVo.setMaterial_no(material_no);
			// hobby_no 세팅
			hobbyMaterialVo.setHobby_no(hobby_no);
		}
		hobbyDao.insertHobbyMaterial(hobbyMaterials);
		
		// * 만들기 작업
		List<MakeStepVo> makeSteps = hobbyVo.getMakeSteps();
		for (MakeStepVo makeStepVo : makeSteps) {
			makeStepVo.setHobby_no(hobby_no);
		}
		hobbyDao.insertMakeStepVo(makeSteps);
		
		// * 완성사진 작업
		List<CompleteImgVo> completeImgs = hobbyVo.getCompleteImgs();
		for(CompleteImgVo completeImgVo : completeImgs) {
			completeImgVo.setHobby_no(hobby_no);
		}
		hobbyDao.insertCompleteImg(completeImgs);
	}
	
	@Override
	public HobbyVo selectHobbyArticle(int hobby_no) {
		HobbyVo hobbyVo = hobbyDao.selectHobby(hobby_no);
		List<HobbyMaterialVo> hobbyMaterials = hobbyDao.selectHobbyMaterialList(hobby_no);
		List<MakeStepVo> makeSteps = hobbyDao.selectMakeStepList(hobby_no);
		List<CompleteImgVo> completeImgs = hobbyDao.selectCompleteImgList(hobby_no);
		for (MakeStepVo makeStepVo : makeSteps) {
			String link_url = makeStepVo.getLink_url();
			if (link_url != null) {
				UrlOGTag urlOgTag = new UrlOGTag(link_url);
				makeStepVo.setUrlOgTag(urlOgTag);
			}
		}
		hobbyVo.setHobbyMaterials(hobbyMaterials);
		hobbyVo.setMakeSteps(makeSteps);
		hobbyVo.setCompleteImgs(completeImgs);
		return hobbyVo;
	}


}
