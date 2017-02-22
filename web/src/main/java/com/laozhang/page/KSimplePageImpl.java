package com.laozhang.page;

import java.util.ArrayList;
import java.util.List;

public class KSimplePageImpl<T> implements KPage<T> {
	
	private int pageSize = 10;//每页条数
	
	private long start;//当前页位置，从0开始
	
	private List<T> data = new ArrayList<T>();//数据
	
	private long resultCount;//总记录数
	
	private long pageIndex;//当前页的页码

	@Override
	public List<T> getContent() {
		return data;
	}
	
	public void setContent(List<T> data){}

	@Override
	public int getTotalPageNumber() {
		return Integer.valueOf(String.valueOf(getPageCount()));
	}

	@Override
	public long getTotalRecordNumber() {
		return resultCount;
	}
	
	public long getPageCount() {
		if (resultCount % pageSize == 0) {
			return resultCount / pageSize;
		} else {
			return resultCount / pageSize + 1;
		}
	}

	@Override
	public void setStart(long start) {
		this.start = start;
	}

	@Override
	public void setData(List<T> list) {
		this.data = list;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public long getResultCount() {
		return resultCount;
	}

	public void setResultCount(long resultCount) {
		this.resultCount = resultCount;
	}

	public long getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(long pageIndex) {
		this.pageIndex = pageIndex;
	}
	
	/**
	 * 是否有下一页
	 * @return
	 */
	public boolean hasNextPage() {
		return getPageIndex() < getPageCount() - 1;
	}
	
	/**
	 * 是否有上一页
	 * @return
	 */
	public boolean hasPreviousPage() {
		return getPageIndex() > 0;
	}

	public long getStart() {
		return start;
	}

	public List<T> getData() {
		return data;
	}
	

}
