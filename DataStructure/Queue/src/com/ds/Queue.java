package com.ds;

public class Queue {
	private Node	m_cFront, m_cRear;
	private long	m_nCount;
	
	public Queue() {
		m_cFront = null;
		m_cRear = null;
		m_nCount = 0;
	}
	
	@Override
	protected void finalize() throws Throwable {
		// TODO Auto-generated method stub
		super.finalize();
		while(!isEmpty()) {
			m_cRear = m_cRear.cNext;
		}
		m_cFront = m_cRear = null;
	}
	
	public final boolean isEmpty() {
		return (null == m_cFront);
	}
	
	public final long getCount() {
		return m_nCount;
	}
	
	public void enQueue(int fnData) {
		Node lcNewNode = null;
		lcNewNode = new Node(fnData);
		
		if (null == m_cFront) {
			m_cFront = m_cRear = lcNewNode;
		}
		else {
			m_cFront.cNext = lcNewNode;
		}
		m_cFront = lcNewNode;
		m_nCount++;
	}
	
	public int deQueue(){
		int lnData = -1;
		Node lcNextNode = null;
		
		if (isEmpty()) {
			return lnData;
		}
		
		lcNextNode = m_cRear;
		m_cRear = m_cRear.cNext;
		lnData = lcNextNode.nData;
		lcNextNode = null;
		m_nCount--;
		
		if (0 == m_nCount) {
			m_cFront = m_cRear = null;
		}
		
		return lnData;
	}
}
