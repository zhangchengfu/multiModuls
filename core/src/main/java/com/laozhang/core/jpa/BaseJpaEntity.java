package com.laozhang.core.jpa;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;

import com.laozhang.core.aop.DateFormat;

@MappedSuperclass
public abstract class BaseJpaEntity implements Serializable {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO, generator="uuid")
	@GenericGenerator(name="uuid",strategy="uuid2")
	@Column(name = "id")
	protected String id;//主键

	@Column(name = "createDate")
	@Temporal(value=TemporalType.TIMESTAMP)
	protected Date createDate;
	
	@Transient
	@DateFormat(property="createDate")
	protected String createDateFormat;
	
	@Column(name = "modifyDate")
	@Temporal(value=TemporalType.TIMESTAMP)
	protected Date modifyDate;
	
	@Transient
	@DateFormat(property="modifyDate")
	protected String modifyDateFormat;
	
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
