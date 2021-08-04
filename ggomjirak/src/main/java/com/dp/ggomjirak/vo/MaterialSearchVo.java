package com.dp.ggomjirak.vo;

public class MaterialSearchVo {
	private String sort;
	private String cate;
	
	public MaterialSearchVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MaterialSearchVo(String sort, String cate) {
		super();
		this.sort = sort;
		this.cate = cate;
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
		return "MaterialSearchVo [sort=" + sort + ", cate=" + cate + "]";
	}
	
	
}
