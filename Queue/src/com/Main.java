package com;

import com.ds.Queue;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Queue lcQueue = new Queue();
		lcQueue.enQueue(1);
		lcQueue.enQueue(2);
		lcQueue.enQueue(3);
		lcQueue.enQueue(4);
		System.out.println(lcQueue.deQueue());
		lcQueue.enQueue(5);
		while(!lcQueue.isEmpty()) {
			System.out.println(lcQueue.deQueue());
		}
		lcQueue.enQueue(6);
		lcQueue.enQueue(7);
		System.out.println(lcQueue.deQueue());
		System.out.println(lcQueue.deQueue());
		System.out.println(lcQueue.deQueue());
	}
}
