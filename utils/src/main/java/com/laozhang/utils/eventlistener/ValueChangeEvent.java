package com.laozhang.utils.eventlistener;

import java.util.EventObject;
//事件
public class ValueChangeEvent extends EventObject {

	private static final long serialVersionUID = 1L;
	private int value;
	public ValueChangeEvent(Object source) {
		this(source, 0);
	}
	public ValueChangeEvent(Object source, int newValue) {
		super(source);
		value = newValue;
	}
	
	public int getValue() {
		return value;
	}
}
