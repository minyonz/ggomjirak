package com.dp.ggomjirak.vo;


public class ReviewPaging {
//	private String review_sort; // 최신,조회,댓글 
	private String review_level;
	
	// 현재페이지
	private int review_page = 1;
	
	private int review_startRow = 1;
	private int review_endRow = 6;
	// 게시물 총 갯수
	private int review_count;
	
	// 다음, 이전 페이지
	private int review_startPage;
	private int review_endPage;
	
	// 총 페이지 수(마지막 페이지 출력용)
	private int review_totalPage;
	
	private int review_perPage = 9; // 한페이지에 보여줄 게시글 개수 
	private final int REVIEW_PAGE_BLOCK = 5; // 1 2 3 4 5 6 7.. 10 
//	public String getReview_sort() {
//		return review_sort;
//	}
//	public void setReview_sort(String review_sort) {
//		this.review_sort = review_sort;
//	}
	public int getReview_page() {
		return review_page;
	}
	public void setReview_page(int review_page) {
		this.review_page = review_page;
	}
	public int getReview_startRow() {
		return review_startRow;
	}
	public void setReview_startRow(int review_startRow) {
		this.review_startRow = review_startRow;
	}
	public int getReview_endRow() {
		return review_endRow;
	}
	public void setReview_endRow(int review_endRow) {
		this.review_endRow = review_endRow;
	}
	public int getReview_count() {
		return review_count;
	}
	public void setReview_count(int review_count) {
		this.review_count = review_count;
	}
	public int getReview_startPage() {
		return review_startPage;
	}
	public void setReview_startPage(int review_startPage) {
		this.review_startPage = review_startPage;
	}
	public int getReview_endPage() {
		return review_endPage;
	}
	public void setReview_endPage(int review_endPage) {
		this.review_endPage = review_endPage;
	}
	public int getReview_totalPage() {
		return review_totalPage;
	}
	public void setReview_totalPage(int review_totalPage) {
		this.review_totalPage = review_totalPage;
	}
	public int getReview_perPage() {
		return review_perPage;
	}
	public void setReview_perPage(int review_perPage) {
		this.review_perPage = review_perPage;
	}
	public int getREVIEW_PAGE_BLOCK() {
		return REVIEW_PAGE_BLOCK;
	}
	public String getReview_level() {
		return review_level;
	}
	public void setReview_level(String review_level) {
		this.review_level = review_level;
	}
	@Override
	public String toString() {
		return "ReviewPaging [review_level=" + review_level + ", review_page=" + review_page + ", review_startRow="
				+ review_startRow + ", review_endRow=" + review_endRow + ", review_count=" + review_count
				+ ", review_startPage=" + review_startPage + ", review_endPage=" + review_endPage
				+ ", review_totalPage=" + review_totalPage + ", review_perPage=" + review_perPage
				+ ", REVIEW_PAGE_BLOCK=" + REVIEW_PAGE_BLOCK + "]";
	}


}
