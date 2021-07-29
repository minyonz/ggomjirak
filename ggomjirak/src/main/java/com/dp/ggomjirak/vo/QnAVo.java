package com.dp.ggomjirak.vo;

import java.sql.Timestamp;

public class QnAVo {
	
	// 1:1 문의 유형
	private String qna_sort_cd;
	private String qna_type_nm;

	// 1:1 문의 게시판 내용
	private int qna_no;
	private int a_no;
	private char qna_type; 
	private String title;
	private String content;
	private String user_id;
	private char is_del;
//	private Timestamp save_time;
//	private Timestamp update_time;
//	private Timestamp delete_time;
	
	private String save_time;
	private String update_time;
	private String delete_time;
	
	private String input_name;
	private String input_tel;
	private String input_email;
	private String is_email_receive;
	
	// 질문 저장 시간
	private String a_save_time;
	
	// 답변 상태
	private String a_state;
	
	// 관리자 답변 내용
	private String q_title;
	private String q_content;
	private String m_nick;
	private String q_save_time;
	
	public QnAVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public QnAVo(String qna_sort_cd, String qna_type_nm, int qna_no, int a_no, char qna_type, String title,
			String content, String user_id, char is_del, String save_time, String update_time, String delete_time,
			String input_name, String input_tel, String input_email, String is_email_receive, String a_save_time,
			String a_state, String q_title, String q_content, String m_nick, String q_save_time) {
		super();
		this.qna_sort_cd = qna_sort_cd;
		this.qna_type_nm = qna_type_nm;
		this.qna_no = qna_no;
		this.a_no = a_no;
		this.qna_type = qna_type;
		this.title = title;
		this.content = content;
		this.user_id = user_id;
		this.is_del = is_del;
		this.save_time = save_time;
		this.update_time = update_time;
		this.delete_time = delete_time;
		this.input_name = input_name;
		this.input_tel = input_tel;
		this.input_email = input_email;
		this.is_email_receive = is_email_receive;
		this.a_save_time = a_save_time;
		this.a_state = a_state;
		this.q_title = q_title;
		this.q_content = q_content;
		this.m_nick = m_nick;
		this.q_save_time = q_save_time;
	}

	public String getQna_sort_cd() {
		return qna_sort_cd;
	}

	public void setQna_sort_cd(String qna_sort_cd) {
		this.qna_sort_cd = qna_sort_cd;
	}

	public String getQna_type_nm() {
		return qna_type_nm;
	}

	public void setQna_type_nm(String qna_type_nm) {
		this.qna_type_nm = qna_type_nm;
	}

	public int getQna_no() {
		return qna_no;
	}

	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}

	public int getA_no() {
		return a_no;
	}

	public void setA_no(int a_no) {
		this.a_no = a_no;
	}

	public char getQna_type() {
		return qna_type;
	}

	public void setQna_type(char qna_type) {
		this.qna_type = qna_type;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public char getIs_del() {
		return is_del;
	}

	public void setIs_del(char is_del) {
		this.is_del = is_del;
	}

	public String getSave_time() {
		return save_time;
	}

	public void setSave_time(String save_time) {
		this.save_time = save_time;
	}

	public String getUpdate_time() {
		return update_time;
	}

	public void setUpdate_time(String update_time) {
		this.update_time = update_time;
	}

	public String getDelete_time() {
		return delete_time;
	}

	public void setDelete_time(String delete_time) {
		this.delete_time = delete_time;
	}

	public String getInput_name() {
		return input_name;
	}

	public void setInput_name(String input_name) {
		this.input_name = input_name;
	}

	public String getInput_tel() {
		return input_tel;
	}

	public void setInput_tel(String input_tel) {
		this.input_tel = input_tel;
	}

	public String getInput_email() {
		return input_email;
	}

	public void setInput_email(String input_email) {
		this.input_email = input_email;
	}

	public String getIs_email_receive() {
		return is_email_receive;
	}

	public void setIs_email_receive(String is_email_receive) {
		this.is_email_receive = is_email_receive;
	}

	public String getA_save_time() {
		return a_save_time;
	}

	public void setA_save_time(String a_save_time) {
		this.a_save_time = a_save_time;
	}

	public String getA_state() {
		return a_state;
	}

	public void setA_state(String a_state) {
		this.a_state = a_state;
	}

	public String getQ_title() {
		return q_title;
	}

	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}

	public String getQ_content() {
		return q_content;
	}

	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}

	public String getM_nick() {
		return m_nick;
	}

	public void setM_nick(String m_nick) {
		this.m_nick = m_nick;
	}

	public String getQ_save_time() {
		return q_save_time;
	}

	public void setQ_save_time(String q_save_time) {
		this.q_save_time = q_save_time;
	}

	@Override
	public String toString() {
		return "QnAVo [qna_sort_cd=" + qna_sort_cd + ", qna_type_nm=" + qna_type_nm + ", qna_no=" + qna_no + ", a_no="
				+ a_no + ", qna_type=" + qna_type + ", title=" + title + ", content=" + content + ", user_id=" + user_id
				+ ", is_del=" + is_del + ", save_time=" + save_time + ", update_time=" + update_time + ", delete_time="
				+ delete_time + ", input_name=" + input_name + ", input_tel=" + input_tel + ", input_email="
				+ input_email + ", is_email_receive=" + is_email_receive + ", a_save_time=" + a_save_time + ", a_state="
				+ a_state + ", q_title=" + q_title + ", q_content=" + q_content + ", m_nick=" + m_nick
				+ ", q_save_time=" + q_save_time + "]";
	}
	
	

	
}