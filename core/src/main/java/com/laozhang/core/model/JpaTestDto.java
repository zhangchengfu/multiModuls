package com.laozhang.core.model;

import java.io.Serializable;
import java.util.Date;

public class JpaTestDto implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -4879791660297980319L;

	public JpaTestDto() {
		super();
	}

	public JpaTestDto(String id, String name, Date createDate, Date modifyDate) {
		super();
		this.id = id;
		this.name = name;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
	}

	private String id;
	
	private Date createDate;
	
	private Date modifyDate;
	
	private String name;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
