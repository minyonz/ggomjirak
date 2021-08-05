package com.dp.ggomjirak.vo;

public class MaterialSearch {
	private int m_no;
	private String sort;
	private String cate;
	
	public MaterialSearch() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MaterialSearch(String sort, String cate) {
		super();
		this.sort = sort;
		this.cate = cate;
	}
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getCate() {
		return cate;
	}
	public void setCate(String cate) {
		this.cate = cate;
	}
	@Override
	public String toString() {
		return "MaterialSearch [m_no=" + m_no + ", sort=" + sort + ", cate=" + cate + "]";
	}
	

}
