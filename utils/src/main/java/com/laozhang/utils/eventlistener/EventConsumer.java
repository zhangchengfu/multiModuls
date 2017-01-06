package com.laozhang.utils.eventlistener;
//事件的消费者,当EventProducer 发送事件时，接收事件
public class EventConsumer implements ValueChangeListener {

	public void perform(ValueChangeEvent e) {
		System.out.println("value changed, new value = " + e.getValue()); 
	}

}
