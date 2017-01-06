package com.laozhang.model.base;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class PageResult<T> {
	private int currentPage;//当前页数
	private int totalPage;//总页数
	private int totalSize;//总记录数
	private int pageSize;//每页条数
	private List<T> result = new ArrayList<T>();//查询记录
	private String pageComponet;
	private Map<String, Object> params;//查询条件
	
	
	public String getPageComponet() {
		return pageComponet;
	}
	public void setPageComponet(String pageComponet) {
		this.pageComponet = pageComponet;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getTotalPage() {
		if (totalPage > 0) {
			return totalPage;
		}
		totalPage = totalSize / pageSize;
		if (totalSize % pageSize > 0) {
			totalPage++;
		}
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getTotalSize() {
		return totalSize;
	}
	public void setTotalSize(int totalSize) {
		this.totalSize = totalSize;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public List<T> getResult() {
		return result;
	}
	public void setResult(List<T> result) {
		this.result = result;
	}
	public Map<String, Object> getParams() {
		return params;
	}
	public void setParams(Map<String, Object> params) {
		this.params = params;
	}
	
	
}
