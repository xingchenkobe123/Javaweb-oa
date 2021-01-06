package cn.sjzc.edu.po;

import java.util.List;

public class PageBean {

	private int curPage = 1; // 当前页数,默认1
	private int pageSize; // 每页显示的记录数
	private int totalPage; // 总页数，计算得出
	private int totalRecords; // 总记录数，数据库查询得出
	private int startIndex; // 开始索引，（curPage-1）*pageSize

	private List list; // 数据库查询出来的分页数据集合
	private int prePage;// 上一页
	private int nextPage;// 下一页

	private String type;// 类型
	private String branch;// 部门
	private String group;// 小组

	
	

	public String getBranch() {
		return branch;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}

	public String getGroup() {
		return group;
	}

	public void setGroup(String group) {
		this.group = group;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getPrePage() {
		prePage = curPage - 1;
		if (prePage < 1) {
			prePage = 1;
		}
		return prePage;
	}

	public void setPrePage(int prePage) {
		this.prePage = prePage;
	}

	public int getNextPage() {
		nextPage = curPage + 1;
		if (nextPage > totalPage) {
			nextPage = totalPage;
		}
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}

	public PageBean(int curPage, int pageSize, int totalRecords) {
		this.curPage = curPage;
		this.pageSize = pageSize;
		this.totalRecords = totalRecords;

		// #1 总分页数
		this.totalPage = totalRecords % pageSize == 0 ? (totalRecords / pageSize) : (totalRecords / pageSize + 1);

		// #2 开始索引
		this.startIndex = (this.curPage - 1) * pageSize;
	}

	public PageBean(int curPage, int pageSize, int totalRecords, String type) {
		this.curPage = curPage;
		this.pageSize = pageSize;
		this.totalRecords = totalRecords;
		this.type = type;

		// #1 总分页数
		this.totalPage = totalRecords % pageSize == 0 ? (totalRecords / pageSize) : (totalRecords / pageSize + 1);

		// #2 开始索引
		this.startIndex = (this.curPage - 1) * pageSize;
	}
	
	public PageBean(int curPage, int pageSize, int totalRecords, String type,String branch,String group) {
		this.curPage = curPage;
		this.pageSize = pageSize;
		this.totalRecords = totalRecords;
		this.type = type;
		this.branch = branch;
		this.group = group;
		
		// #1 总分页数
		this.totalPage = totalRecords % pageSize == 0 ? (totalRecords / pageSize) : (totalRecords / pageSize + 1);
		
		// #2 开始索引
		this.startIndex = (this.curPage - 1) * pageSize;
	}
	public PageBean(int curPage, int pageSize, int totalRecords,String branch,String group) {
		this.curPage = curPage;
		this.pageSize = pageSize;
		this.totalRecords = totalRecords;
		this.branch = branch;
		this.group = group;
		
		// #1 总分页数
		this.totalPage = totalRecords % pageSize == 0 ? (totalRecords / pageSize) : (totalRecords / pageSize + 1);
		
		// #2 开始索引
		this.startIndex = (this.curPage - 1) * pageSize;
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}

	public int getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}

}
