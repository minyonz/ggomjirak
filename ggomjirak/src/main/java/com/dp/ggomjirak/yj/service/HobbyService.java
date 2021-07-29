package com.dp.ggomjirak.yj.service;

import com.dp.ggomjirak.vo.HobbyVo;

public interface HobbyService {
	
	/** 글작성
	 * @param hobbyVo
	 */
	public void insertHobbyArticle (HobbyVo hobbyVo); 
	
	public HobbyVo selectHobbyArticle (int hobby_no, boolean isUpdate);
}
