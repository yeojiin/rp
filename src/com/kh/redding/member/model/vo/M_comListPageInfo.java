package com.kh.redding.member.model.vo;

public class M_comListPageInfo implements java.io.Serializable{
	private int currentPage;
	private int limit;
	private int maxPage;
	private int startPage;
	private int endPage;
	
	public M_comListPageInfo() {}

	public M_comListPageInfo(int currentPage, int limit, int maxPage, int startPage, int endPage) {
		super();
		this.currentPage = currentPage;
		this.limit = limit;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
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

	@Override
	public String toString() {
		return "M_comListPageInfo [currentPage=" + currentPage + ", limit=" + limit + ", maxPage=" + maxPage
				+ ", startPage=" + startPage + ", endPage=" + endPage + "]";
	}
	
	

}
