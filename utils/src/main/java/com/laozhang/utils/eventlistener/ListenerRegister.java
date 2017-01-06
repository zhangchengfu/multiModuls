package com.laozhang.utils.eventlistener;

import java.util.ArrayList;
import java.util.EventListener;
import java.util.EventObject;
import java.util.List;

//注册器,负责注册和分发事件
public class ListenerRegister {
	
	private static ListenerRegister register;
	
	private ListenerRegister(){}
	
	//单例
	public static synchronized ListenerRegister newInstance() {
		if (null == register) {
			register = new ListenerRegister();
		}
		return register;
	}
	
	private List<EventListener> listeners;
	
	public synchronized void addListener(EventListener listener) {
		if (null == listeners) {
			listeners = new ArrayList<EventListener>();
		}
		listeners.add(listener);
	}
	
	public synchronized void removeListener(EventListener listener) {
		listeners.remove(listener);
	}
	
	public synchronized void fireAEvent(EventObject event) {
		for (EventListener listener : listeners) {
			if (listener instanceof ValueChangeListener 
					&& event instanceof ValueChangeEvent) {
				((ValueChangeListener)listener).perform((ValueChangeEvent) event);
			}
		}
	}
}
