package com.laozhang.utils.eventlistener;

public class Client {
	
	public static void main(String[] args) {
		EventProducer producer = new EventProducer();
		ListenerRegister register = ListenerRegister.newInstance();
		register.addListener(new EventConsumer());
		producer.setValue(3);
	}
}
