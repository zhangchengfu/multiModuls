package com.laozhang.utils.concurrent;

/*生产者生产数据，消费者使用数据。两个线程通过共享对象通信。在这里，线程协同工作的关键是：生产者发布数据之前，消费者不能够去读取数据；消费者没有读取旧数据前，生产者不能发布新数据。*/
public class Drop {
	//消息，从生产者到消费者
	private String message;
	private boolean empty = true;
	
	//消费消息
	public synchronized String take() {
		while(empty) {
			//如果没有消息产生，线程等待
			try {
				wait();
			} catch (InterruptedException e) {}
		}
		//改变标志
		empty = true;
		//唤醒生产者线程
		notifyAll();
		return message;
	}
	
	//生产消息
	public synchronized void put(String message) {
		//如果消息没有被消费，线程等待
		while (!empty) {
			try {
				wait();
			} catch (InterruptedException e) {}
		}
		//改变标志
		empty = false;
		//产生消息
		this.message = message;
		//唤醒消费者线程
		notifyAll();
	}
}
