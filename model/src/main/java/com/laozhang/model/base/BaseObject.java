package com.laozhang.model.base;

import java.io.Serializable;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;

public abstract class BaseObject implements Serializable {
	
	public boolean equals(Object obj) {
		return EqualsBuilder.reflectionEquals(this, obj);
	}
	
	public int hashCode() {
		return HashCodeBuilder.reflectionHashCode(this);
	}
	
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}
