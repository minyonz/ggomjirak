package com.dp.ggomjirak.yj.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.util.FileCopyUtils;

import com.mortennobel.imagescaling.AdvancedResizeOp;
import com.mortennobel.imagescaling.MultiStepRescaleOp;

public class MyFileUploadUtil {
	public static final String GGOMJIRAK_FOLDER = "//192.168.0.217/ggomjirak";
	public static final String YJ_ACADEMY_FOLDER = "D:/ggomjirak";
	public static final String YJ_HOME_FOLDER = "C:/Users/user/Desktop";

	private static String rootPath = YJ_ACADEMY_FOLDER;
	

	
	/**
	 * @param uploadPath 예) D:/ggomjirak/hobby/main_img/2021/7/28/uuid_사진.png 
	 * 		  -> /hobby/main_img 가 uploadPath
	 * @param fileName 
	 * @param fileData
	 * @param dw 썸네일사진 폭
	 * @param dh 썸네일사진 높이
	 * @return String thumbnailPath 만들어진 썸네일 사진 경로
	 * @throws Exception
	 */
	public static String uploadImage(String uploadPath, String fileName,
									byte[] fileData, int dw, int dh) throws Exception {
		String filePath = makeUploadPath(uploadPath) + calcUuidFileName(fileName);
		File target = new File(filePath);
		FileCopyUtils.copy(fileData, target); // fileData를 target에 복사
		String thumbPath = makeThumbImg(filePath, dw, dh);
		return thumbPath;
	}
	
	
	
	/** 파일 올라갈 폴더들 만들기 
	 * @param uploadPath
	 * @return 만든 폴더들 경로 리턴
	 */
	private static String makeUploadPath(String uploadPath) {
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int date = cal.get(Calendar.DATE);
		
		String datePath = "/" +  year + "/" + month + "/" + date + "/"; // 2021/7/20/ 
		uploadPath = rootPath + uploadPath + datePath; // D:/ggomjirak + /hobby/main_img + /2021/7/20/ +
		
		File f = new File(uploadPath);
		if (!f.exists()) {
			f.mkdirs();
		}
		return uploadPath;
	}
	
	private static String calcUuidFileName(String fileName) {
		UUID uuid = UUID.randomUUID(); // 중복되지 않는 고유한 값
		String uuidFileName = uuid + "_" + fileName;
		return uuidFileName;
	}
	
	private static String calcThumnailPath(String orgPath) {
		int slashIndex = orgPath.lastIndexOf("/");
		String front = orgPath.substring(0, slashIndex + 1);
		// -> D:/ggomjirak/hobby/main_img/2021/07/20/
		String rear = orgPath.substring(slashIndex + 1);
		// -> uuid_메인이미지.png
		return front + "sm_" + rear;
	}
	
	//파일의 확장명 얻기
	private static String getExtName(String fileName) {
		int dotIndex = fileName.lastIndexOf(".");
		String ext = fileName.substring(dotIndex + 1);
		return ext.toUpperCase();
	}
	
	private static String makeThumbImg(String orgPath, int dw, int dh) throws Exception {
		String thumbPath = calcThumnailPath(orgPath);
		File orgFile = new File(orgPath);
		File thumbFile = new File(thumbPath);
        BufferedImage img = ImageIO.read(orgFile);
        
        // java-image-scaling 라이브러리
        MultiStepRescaleOp rescale = new MultiStepRescaleOp(dw, dh);
        rescale.setUnsharpenMask(AdvancedResizeOp.UnsharpenMask.Soft);
        BufferedImage resizedImage = rescale.filter(img, null);
        
        ImageIO.write(resizedImage, getExtName(thumbPath), thumbFile);
		return thumbPath;
	}
	
	// 첨부파일 삭제
		public static boolean deleteFile(String fileName) throws Exception {
			File orgFile = new File(rootPath + fileName) ;
			String prefix = fileName.substring(0, fileName.lastIndexOf("/") + 1);
			String suffix = "sm_" + fileName.substring(fileName.lastIndexOf("/") + 1);
			File thumbFile = new File(rootPath + prefix + suffix);
			if(orgFile.exists()) {
				if (orgFile.delete() && thumbFile.delete()) {
					return true;
				}
			}
			return false;
		}
		
		
		
		
		
		
		
	
	
	
	//-> 화질 안좋아서 다른거 이용
//	private static String makeThumnailImg(String orgFilePath, int dw, int dh) {
//		String thumbnailPath = getThumnailPath(orgFilePath);
//		File orgFile = new File(orgFilePath);
//		File thumbFile = new File(thumbnailPath);
//		
//		try {
//			// 저장된 원본 파일로부터 BufferedImage객체 생성
//			BufferedImage srcImg = ImageIO.read(orgFile);
//			
//			//썸네일의 너비와 높이
////			int dw = 300, dh = 260;
//			
//			//원본이미지의 너비와 높이
//			int ow = srcImg.getWidth();
//			int oh = srcImg.getHeight();
//			
//			// 원본 너비를 기준으로 하여 썸네일의 비율로 높이를 계산
//			//(비례식)
//			int nw = ow;
//			int nh = (ow * dh) / dw;
//			
//			// 계산된 높이가 원본보다 높다면 crop이 안되므로 
//			// 원본 높이를 기준으로 썸네일의 비율로 너비를 계산
//			if(nh > oh) {
//				nw = (oh * dw) / dh;
//				nh = oh;
//			}
//			
//			// 계산된 크기로 원본이미지를 가운데에서 crop
//			BufferedImage cropImg = Scalr.crop(srcImg, (ow-nw)/2, (oh-nh)/2, nw, nh);
//			
//			// 원본에서 crop된 이미지로 썸네일을 생성
//			BufferedImage destImg = Scalr.resize(cropImg, dw, dh);
//			ImageIO.write(destImg, getExtName(thumbnailPath), thumbFile);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		
//		return thumbnailPath;
//	}
	
	
	
}
