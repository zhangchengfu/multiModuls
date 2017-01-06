package com.laozhang.model.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public class Course implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private Integer cno;//课程号
	private String cname;//课程名
	private Integer ccredit;//学分
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getCno() {
		return cno;
	}
	public void setCno(Integer cno) {
		this.cno = cno;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public Integer getCcredit() {
		return ccredit;
	}
	public void setCcredit(Integer ccredit) {
		this.ccredit = ccredit;
	}
	
}
