package com;

import com.ds.QueueUsingStack;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		QueueUsingStack lcQueue = new QueueUsingStack();
		
		lcQueue.enQueue(1);
		lcQueue.enQueue(2);
		lcQueue.enQueue(3);
		lcQueue.enQueue(4);
		System.out.println(lcQueue.deQueue());
		System.out.println(lcQueue.deQueue());
		lcQueue.enQueue(5);
		System.out.println(lcQueue.deQueue());
		lcQueue.enQueue(6);
		System.out.println(lcQueue.deQueue());
		System.out.println(lcQueue.deQueue());
	}

}
