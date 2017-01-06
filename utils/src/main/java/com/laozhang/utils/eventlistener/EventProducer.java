package com.laozhang.utils.eventlistener;
//事件的产生者,提供了监听容器ListenerRegister，负责消费者的注册
public class EventProducer {
	
	ListenerRegister register = ListenerRegister.newInstance();
	
	private int value;
	
	public int getValue(){
		return value;
	}
	
	public void setValue(int newValue) {
		if (value != newValue) {
			value = newValue;
			ValueChangeEvent event = new ValueChangeEvent(this, newValue);
			fireAEvent(event);
		}
	}
	
	public void addListener(ValueChangeListener listener) {
		register.addListener(listener);
	}
	
	public void removeListener(ValueChangeListener listener) {
		register.removeListener(listener);
	}
	
	public void fireAEvent(ValueChangeEvent event) {
		register.fireAEvent(event);
	}
}
