package com.ds;

public class QueueUsingStack {
	private Stack	m_cFront, m_cRear;
	
	public QueueUsingStack() {
		m_cFront = new Stack();
		m_cRear = new Stack();
	}
	
	public boolean isEmpty() {
		return (m_cFront.IsEmpty() && m_cRear.IsEmpty());
	}
	
	public long getCount() {
		if (!m_cFront.IsEmpty()) {
			return m_cFront.GetCount();
		}
		else if (!m_cRear.IsEmpty()) {
			return m_cRear.GetCount();
		}
		else {
			return 0;
		}
	}
	
	public void enQueue(int fnData) {
		while (!m_cRear.IsEmpty()) {
			m_cFront.Push(m_cRear.Pop());
		}
		
		m_cFront.Push(fnData);
	}
	
	public int deQueue() {
		while (!m_cFront.IsEmpty()) {
			m_cRear.Push(m_cFront.Pop());
		}
		
		return m_cRear.Pop();
	}
}
