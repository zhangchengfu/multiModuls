package com.laozhang.model.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public class ClassInfo implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String name;
	/*private Set<Soldier> soldiers = new HashSet<Soldier>();
	
	
	public Set<Soldier> getSoldiers() {
		return soldiers;
	}
	public void setSoldiers(Set<Soldier> soldiers) {
		this.soldiers = soldiers;
	}*/
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
}
