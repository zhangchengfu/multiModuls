package com.laozhang.utils.concurrent;
//ProducerConsumerExample是主线程，它启动生产者线程和消费者线程。 
public class ProducerConsumerExample {
	public static void main(String[] args) {
		Drop drop = new Drop();
		new Thread(new Producer(drop)).start();
		new Thread(new Consumer(drop)).start();
	}
}
