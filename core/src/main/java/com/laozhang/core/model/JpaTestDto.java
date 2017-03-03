package com.laozhang.core.model;

import java.io.Serializable;
import java.util.Date;

import com.laozhang.core.aop.DateFormat;

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
	
	@DateFormat(property="createDate")
	private String createDateFormat;
	
	private Date modifyDate;
	
	@DateFormat(property="modifyDate")
	private String modifyDateFormat;
	
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

	public String getCreateDateFormat() {
		return createDateFormat;
	}

	public void setCreateDateFormat(String createDateFormat) {
		this.createDateFormat = createDateFormat;
	}

	public String getModifyDateFormat() {
		return modifyDateFormat;
	}

	public void setModifyDateFormat(String modifyDateFormat) {
		this.modifyDateFormat = modifyDateFormat;
	}
}
