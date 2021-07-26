package com.dp.ggomjirak.vo;

public class PagingDto {
	private int page = 1;
	private int startRow = 1; // 한페이지에서 보여질 페이지량
	private int endRow = 10;
	private int count; // 전체게시글
	private int startPage; // 아래 선택 숫자 페이지
	private int endPage;
	private int totalPage; // 전체페이지
	private int perPage = 10; // 한페이지당 보여줄 게시글
	private final int PAGEBLOCK = 10; // 아래 페이지네이션 몇개씩 보여줄것인지
	private String searchType; // 검색타입
	private String keyword; // 검색어
	
	
	
	public PagingDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PagingDto(int page) {
		super();
		this.page = page;
	}
	
	public PagingDto(int page, int totalCount, int perPage, String searchType, String keyword) {
		super();
		this.page = page;
		this.count = totalCount;
		this.perPage = perPage;
		this.searchType = searchType;
		this.keyword = keyword;
		
		this.endRow = page * this.perPage;
		this.startRow = endRow - (this.perPage - 1);
		// if (page % 10 == 0) {this.endPage = ((int)(page/10))*10;
		// } else { this.endPage = ((int)(page/10+1))*10;}
		this.endPage = (Math.abs((page - 1) / PAGEBLOCK) + 1) * PAGEBLOCK;
		this.startPage = endPage - (PAGEBLOCK - 1);
		
		this.totalPage = totalCount / this.perPage;
		if (totalCount % this.perPage != 0) {
			this.totalPage += 1;
		}
		// 끝페이지가 최대 페이지를 넘지 않도록
		if (this.endPage > this.totalPage) {
			this.endPage = this.totalPage;
		}
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
		
		this.endRow = page * this.perPage;
		this.startRow = endRow - (this.perPage - 1);
		// if (page % 10 == 0) {this.endPage = ((int)(page/10))*10;
		// } else { this.endPage = ((int)(page/10+1))*10;}
		this.endPage = (Math.abs((page - 1) / PAGEBLOCK) + 1) * PAGEBLOCK;
		this.startPage = endPage - (PAGEBLOCK - 1);
		
		this.totalPage = count / this.perPage;
		if (count % this.perPage != 0) {
			this.totalPage += 1;
		}
		// 끝페이지가 최대 페이지를 넘지 않도록
		if (this.endPage > this.totalPage) {
			this.endPage = this.totalPage;
		}
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getPerPage() {
		return perPage;
	}

	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Override
	public String toString() {
		return "PagingDto [page=" + page + ", startRow=" + startRow + ", endRow=" + endRow + ", count=" + count
				+ ", startPage=" + startPage + ", endPage=" + endPage + ", totalPage=" + totalPage + ", perPage="
				+ perPage + ", PAGEBLOCK=" + PAGEBLOCK + ", searchType=" + searchType + ", keyword=" + keyword + "]";
	}



	

	

	

	
	
	
}
