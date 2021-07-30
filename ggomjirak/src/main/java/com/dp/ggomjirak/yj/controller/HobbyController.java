package com.dp.ggomjirak.yj.controller;




import java.io.FileInputStream;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dp.ggomjirak.vo.CateVo;
import com.dp.ggomjirak.vo.CompleteImgVo;
import com.dp.ggomjirak.vo.CostVo;
import com.dp.ggomjirak.vo.HobbyVo;
import com.dp.ggomjirak.vo.LevelVo;
import com.dp.ggomjirak.vo.MakeStepVo;
import com.dp.ggomjirak.vo.TimeVo;
import com.dp.ggomjirak.yj.service.CateService;
import com.dp.ggomjirak.yj.service.HobbyService;
import com.dp.ggomjirak.yj.util.MyFileUploadUtil;

import net.sf.json.JSONArray;

@Controller
public class HobbyController {
	
	@Inject
	private HobbyService hobbyService;
	
	@Inject
	private CateService cateService;
	
	private static final Logger logger = LoggerFactory.getLogger(HobbyController.class);
	private static final String MAIN_IMG_UPLOAD_PATH = "/test/main_img";
	private static final String STEP_IMG_UPLOAD_PATH = "/test/make_step";
	private static final String COMPLETE_IMG_UPLOAD_PATH = "/test/complete_img";
	
	String rootPath = MyFileUploadUtil.YJ_ACADEMY_FOLDER;
	
	@RequestMapping(value="/content/{hobby_no}", method=RequestMethod.GET)
	public String content(Model model, @PathVariable("hobby_no") int hobby_no,
			HttpServletRequest request) throws Exception {
		HobbyVo hobbyVo = hobbyService.selectHobbyArticle(hobby_no, false);
		System.out.println("완성사진:" + hobbyVo.getCompleteImgs());
		model.addAttribute("hobbyVo", hobbyVo);
		model.addAttribute("rootPath", rootPath);
		model.addAttribute("url", request.getRequestURL());
		return "hobby/content";
	}
	
	@RequestMapping(value="/update/{hobby_no}", method=RequestMethod.GET)
	public String update(Model model, @PathVariable("hobby_no") int hobby_no) throws Exception {
		
		HobbyVo hobbyVo = hobbyService.selectHobbyArticle(hobby_no, true);
		model.addAttribute("hobbyVo", hobbyVo);
		model.addAttribute("rootPath", rootPath);
		
		List<CateVo> cates = cateService.getCateList();
		List<TimeVo> times = cateService.getTimeList();
		List<LevelVo> levels = cateService.getLevelList();
		List<CostVo> costs = cateService.getCostList();
		model.addAttribute("cates", JSONArray.fromObject(cates));
		model.addAttribute("times", JSONArray.fromObject(times));
		model.addAttribute("levels", JSONArray.fromObject(levels));
		model.addAttribute("costs", JSONArray.fromObject(costs));
		return "hobby/modify_form";
	}
	
	@RequestMapping(value="/updateRun", method=RequestMethod.POST)
	public String updateRun(HobbyVo hobbyVo) throws Exception {
		System.out.println("컨트롤러 hobbyMaterials: " + hobbyVo.getHobbyMaterials());
		hobbyService.updateTest(hobbyVo);
		
		// 리다이렉트 자기글로 가기
		return "redirect:/listAll";
	}
	
	@RequestMapping(value="/insert", method=RequestMethod.GET)
	public String insert(Model model) throws Exception {
		List<CateVo> cates = cateService.getCateList();
		List<TimeVo> times = cateService.getTimeList();
		List<LevelVo> levels = cateService.getLevelList();
		List<CostVo> costs = cateService.getCostList();
		model.addAttribute("cates", JSONArray.fromObject(cates));
		model.addAttribute("times", JSONArray.fromObject(times));
		model.addAttribute("levels", JSONArray.fromObject(levels));
		model.addAttribute("costs", JSONArray.fromObject(costs));
		return "hobby/write_form";
	}
	
	@RequestMapping(value="/insertRun", method=RequestMethod.POST)
	public String insertRun(HobbyVo hobbyVo) throws Exception {
		System.out.println(hobbyVo);
		
		hobbyService.insertHobbyArticle(hobbyVo);
		return "redirect:/listAll";
	}
	
	@RequestMapping(value="/listAll", method=RequestMethod.GET)
	public String hobbyList() throws Exception {
		return "hobby/hobby_list";
	}
	
	
	//이미지 출력
	@RequestMapping(value="/displayImage", method=RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<byte[]> displayImage(String filePath) throws Exception {
		FileInputStream fis = new FileInputStream(filePath);
		HttpHeaders header = new HttpHeaders();
        header.setContentType(MediaType.IMAGE_JPEG);
        ResponseEntity<byte[]> entity = new ResponseEntity<byte[]>(
        		 IOUtils.toByteArray(fis), 
        		 header,
        		 HttpStatus.CREATED);
        fis.close();
		return entity;
	}
	
	//이미지 파일 업로드
	@RequestMapping(value="/uploadImg", method=RequestMethod.POST, produces="application/text;charset=utf-8")
	@ResponseBody
	public String uploadImg(MultipartFile file, String sort) throws Exception {
		System.out.println("file:" + file);
		System.out.println("sort:" + sort);
		String orgFileName = file.getOriginalFilename();
		System.out.println("orgFileName:" + orgFileName);
		String thumbPath = null;
		switch (sort) {
		case "mainImg":
			thumbPath = MyFileUploadUtil.uploadImage(MAIN_IMG_UPLOAD_PATH, 
					 orgFileName, file.getBytes(), 300, 260);
			break;

		case "stepImg":
			thumbPath = MyFileUploadUtil.uploadImage(STEP_IMG_UPLOAD_PATH, 
					 orgFileName, file.getBytes(), 170, 170);
			break;
		case "complImg":
			thumbPath = MyFileUploadUtil.uploadImage(COMPLETE_IMG_UPLOAD_PATH, 
					 orgFileName, file.getBytes(), 140, 140);
			break;
		}
		return thumbPath;
	}

	
	//첨부파일 서버에서 삭제
	@RequestMapping(value="/deleteFile", method=RequestMethod.GET)
	@ResponseBody
	public String deleteImg(String fileName) throws Exception {
		if (MyFileUploadUtil.deleteFile(fileName)) {
			return "success";
		};
		return "fail";
	}
	
	//*수정작업
	
	@RequestMapping(value="/selectCompleteImgName", method=RequestMethod.POST, produces="application/text;charset=utf-8") 
	@ResponseBody
	public String selectCompleteImgName(@RequestBody CompleteImgVo completeImgVo){
		System.out.println("완성사진: " + completeImgVo);
		return hobbyService.selectCompleteImgName(completeImgVo);
	}
	
	@RequestMapping(value="/selectMainImg", method=RequestMethod.GET, produces="application/text;charset=utf-8") 
	@ResponseBody
	public String selectMainImg(int hobby_no){
		return hobbyService.selectMainImg(hobby_no);
	}
	
	@RequestMapping(value="/selectMakeStepImg", method=RequestMethod.POST, produces="application/text;charset=utf-8") 
	@ResponseBody
	public String selectMakeStepImg(@RequestBody MakeStepVo makeStepVo){
		System.out.println("완성사진: " + makeStepVo);
		return hobbyService.selectMakeStepImg(makeStepVo);
	}

}