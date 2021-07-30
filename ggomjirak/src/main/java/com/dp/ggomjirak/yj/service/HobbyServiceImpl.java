package com.dp.ggomjirak.yj.service;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.dp.ggomjirak.vo.CompleteImgVo;
import com.dp.ggomjirak.vo.HobbyMaterialVo;
import com.dp.ggomjirak.vo.HobbyVo;
import com.dp.ggomjirak.vo.MakeStepVo;
import com.dp.ggomjirak.vo.MaterialVo;
import com.dp.ggomjirak.yj.dao.HobbyDao;
import com.dp.ggomjirak.yj.dao.MaterialDao;
import com.dp.ggomjirak.yj.util.MyFileUploadUtil;
import com.dp.ggomjirak.yj.util.UrlOGTag;

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
	
	@Override // isUpdate 수정폼에 뿌릴데이터인지아닌지 여부 true이면 수정용(사용자가 입력한 원본그대로 줘야함)
	public HobbyVo selectHobbyArticle(int hobby_no, boolean isUpdate) {
		HobbyVo hobbyVo = hobbyDao.selectHobby(hobby_no);
		
		// 준비물
		List<HobbyMaterialVo> hobbyMaterials = hobbyDao.selectHobbyMaterialList(hobby_no);
		hobbyVo.setHobbyMaterials(hobbyMaterials);

		// 만들기 순서
		List<MakeStepVo> makeSteps = hobbyDao.selectMakeStepList(hobby_no);
		
		
		if (!isUpdate) {
			//  유튜브 (hobby_video)작업
			String videoUrl = hobbyVo.getHobby_video();
			String hobby_video = null;
			if (videoUrl != null && !videoUrl.trim().equals("")) {
				hobby_video = getYoutubeV(videoUrl);
			}
			hobbyVo.setHobby_video(hobby_video);
			
			// 만들기 순서 작업
			for (MakeStepVo makeStepVo : makeSteps) {
				String link_url = makeStepVo.getLink_url();
				if (link_url != null) { // 사용자가 입력한 url있다면 
					UrlOGTag urlOgTag = new UrlOGTag(link_url);
					// ogtag찾기 실패하면 (ogtag.getstatus notfound상태) ogtag클래스의 url필드에 link_url주소만 넣고 프론트에 링크텍스트만 보여주기.
					makeStepVo.setUrlOgTag(urlOgTag);
					System.out.println(urlOgTag);
				}
			}
			List<CompleteImgVo> completeImgs = hobbyDao.selectCompleteImgListNotNull(hobby_no);
			hobbyVo.setCompleteImgs(completeImgs);
		} else {
			List<CompleteImgVo> completeImgs = hobbyDao.selectCompleteImgListAll(hobby_no);
			hobbyVo.setCompleteImgs(completeImgs);
		}
		hobbyVo.setMakeSteps(makeSteps);
		
		
		return hobbyVo;
	}
	
	private String getYoutubeV(String url) {
		String youtube = 
				"(?:https?:\\/\\/(?:[a-z]+.)?)(?:youtu\\.?be(?:\\.com)?\\/)(?:embed\\/)?(?:(?:(?:(?:watch\\?)?(?:time_continue=(?:[0-9]+))?.+v=)?([a-zA-Z0-9_-]+))(?:\\?t\\=(?:[0-9a-zA-Z]+))?)";
		Pattern youtubePattern = Pattern.compile(youtube);
		Matcher matcher = youtubePattern.matcher(url);
		if (matcher.matches()) {
			return matcher.group(1);
		}
		return null;
	}
	
	
	// 삭제 작업
	@Override
	public String selectCompleteImgName(CompleteImgVo completeImgVo) {
		return hobbyDao.selectCompleteImgName(completeImgVo);
	}

	@Override
	public String selectMainImg(int hobby_no) {
		return hobbyDao.selectMainImg(hobby_no);
	}

	@Override
	public String selectMakeStepImg(MakeStepVo makeStepVo) {
		return hobbyDao.selectMakeStepImg(makeStepVo);
	}

}
