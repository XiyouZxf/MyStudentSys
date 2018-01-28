package model.vo;

public class pagesession {
	private String pagestr;
	private int totalPage;
	
	public pagesession() {
		super();
	}
	public pagesession(String pagestr, int totalPage) {
		super();
		this.pagestr = pagestr;
		this.totalPage = totalPage;
	}
	public String getPagestr() {
		return pagestr;
	}
	public void setPagestr(String pagestr) {
		this.pagestr = pagestr;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
}
