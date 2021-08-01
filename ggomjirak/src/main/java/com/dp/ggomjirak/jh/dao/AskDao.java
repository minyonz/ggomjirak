package com.dp.ggomjirak.jh.dao;

import java.util.List;

import com.dp.ggomjirak.vo.CateStrVo;
import com.dp.ggomjirak.vo.EventVo;
import com.dp.ggomjirak.vo.ManagerVo;
import com.dp.ggomjirak.vo.MemberActivVo;
import com.dp.ggomjirak.vo.MemberVo;
import com.dp.ggomjirak.vo.PagingDto;
import com.dp.ggomjirak.vo.QnAVo;
import com.dp.ggomjirak.vo.WorkroomVo;

public interface AskDao {

	
	// 문의
	public List<QnAVo> selectQnAList(PagingDto pagingDto);
	public int getCountQnA(PagingDto pagingDto);
	public int getCountQnAMain();
	public QnAVo selectQnaByNo (int qna_no);
	public int getNextVal();
	public void insertAnswer(QnAVo qnaVo);
	public void updateAno(QnAVo qnaVo);

	
}
