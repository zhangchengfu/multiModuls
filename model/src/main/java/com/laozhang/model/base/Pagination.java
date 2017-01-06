package com.laozhang.model.base;

import java.util.Map;

/**
 * 
 * @description:分页查询条件
 * @author zhang chengfu
 * @date 2016-7-2下午7:58:23
 */
public class Pagination {
	
	private Integer page=1;//页码
	private Integer size=10;//每页数目
	private Map<Object, Object> params;//查询条件
	private String orderColumn;
	private String orderTurn = "ASC";
	
	public String getOrderColumn() {
		return orderColumn;
	}
	public void setOrderColumn(String orderColumn) {
		this.orderColumn = orderColumn;
	}
	public String getOrderTurn() {
		return orderTurn;
	}
	public void setOrderTurn(String orderTurn) {
		this.orderTurn = orderTurn;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getSize() {
		return size;
	}
	public void setSize(Integer size) {
		this.size = size;
	}
	public Map<Object, Object> getParams() {
		return params;
	}
	public void setParams(Map<Object, Object> params) {
		this.params = params;
	}
	
}
